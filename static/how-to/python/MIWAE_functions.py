#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Dec 15 14:58:47 2020

@author: audesportisse
"""

import numpy as np

import torch
import torch.nn as nn
import torch.distributions as td
from torch import nn, optim




def mse(xhat,xtrue,mask): # MSE function for imputations
    xhat = np.array(xhat)
    xtrue = np.array(xtrue)
    return np.mean(np.power(xhat-xtrue,2)[~mask])


def miwae_loss(iota_x,mask,d,K,p_z,encoder,decoder):
  batch_size = iota_x.shape[0]
  p = iota_x.shape[1]
  out_encoder = encoder(iota_x)
  q_zgivenxobs = td.Independent(td.Normal(loc=out_encoder[..., :d],scale=torch.nn.Softplus()(out_encoder[..., d:(2*d)])),1)
  
  zgivenx = q_zgivenxobs.rsample([K])
  zgivenx_flat = zgivenx.reshape([K*batch_size,d])
  
  out_decoder = decoder(zgivenx_flat)
  all_means_obs_model = out_decoder[..., :p]
  all_scales_obs_model = torch.nn.Softplus()(out_decoder[..., p:(2*p)]) + 0.001
  all_degfreedom_obs_model = torch.nn.Softplus()(out_decoder[..., (2*p):(3*p)]) + 3
  
  data_flat = torch.Tensor.repeat(iota_x,[K,1]).reshape([-1,1])
  tiledmask = torch.Tensor.repeat(mask,[K,1])
  
  all_log_pxgivenz_flat = torch.distributions.StudentT(loc=all_means_obs_model.reshape([-1,1]),scale=all_scales_obs_model.reshape([-1,1]),df=all_degfreedom_obs_model.reshape([-1,1])).log_prob(data_flat)
  all_log_pxgivenz = all_log_pxgivenz_flat.reshape([K*batch_size,p])
  
  logpxobsgivenz = torch.sum(all_log_pxgivenz*tiledmask,1).reshape([K,batch_size])
  logpz = p_z.log_prob(zgivenx)
  logq = q_zgivenxobs.log_prob(zgivenx)
  
  neg_bound = -torch.mean(torch.logsumexp(logpxobsgivenz + logpz - logq,0))
  
  return neg_bound



def miwae_impute(iota_x,mask,L,d,p_z,encoder,decoder):
  batch_size = iota_x.shape[0]
  p = iota_x.shape[1]
  out_encoder = encoder(iota_x)
  q_zgivenxobs = td.Independent(td.Normal(loc=out_encoder[..., :d],scale=torch.nn.Softplus()(out_encoder[..., d:(2*d)])),1)
  
  zgivenx = q_zgivenxobs.rsample([L])
  zgivenx_flat = zgivenx.reshape([L*batch_size,d])
  
  out_decoder = decoder(zgivenx_flat)
  all_means_obs_model = out_decoder[..., :p]
  all_scales_obs_model = torch.nn.Softplus()(out_decoder[..., p:(2*p)]) + 0.001
  all_degfreedom_obs_model = torch.nn.Softplus()(out_decoder[..., (2*p):(3*p)]) + 3
  
  data_flat = torch.Tensor.repeat(iota_x,[L,1]).reshape([-1,1]).cuda()
  tiledmask = torch.Tensor.repeat(mask,[L,1]).cuda()
  
  all_log_pxgivenz_flat = torch.distributions.StudentT(loc=all_means_obs_model.reshape([-1,1]),scale=all_scales_obs_model.reshape([-1,1]),df=all_degfreedom_obs_model.reshape([-1,1])).log_prob(data_flat)
  all_log_pxgivenz = all_log_pxgivenz_flat.reshape([L*batch_size,p])
  
  logpxobsgivenz = torch.sum(all_log_pxgivenz*tiledmask,1).reshape([L,batch_size])
  logpz = p_z.log_prob(zgivenx)
  logq = q_zgivenxobs.log_prob(zgivenx)
  
  xgivenz = td.Independent(td.StudentT(loc=all_means_obs_model, scale=all_scales_obs_model, df=all_degfreedom_obs_model),1)

  imp_weights = torch.nn.functional.softmax(logpxobsgivenz + logpz - logq,0) # these are w_1,....,w_L for all observations in the batch
  xms = xgivenz.sample().reshape([L,batch_size,p])
  xm=torch.einsum('ki,kij->ij', imp_weights, xms) 
  

  
  return xm


def weights_init(layer):
  if type(layer) == nn.Linear: torch.nn.init.orthogonal_(layer.weight)


def MIWAE(X_miss,h=128,d=1,K=20,bs=64,n_epochs=2002):
    mask = (1-np.isnan(X_miss).numpy()).astype(bool) 
    xhat_0 = np.where(np.isnan(X_miss),0,X_miss)
    n = np.shape(X_miss)[0]
    p = np.shape(X_miss)[1]
    p_z = td.Independent(td.Normal(loc=torch.zeros(d).cuda(),scale=torch.ones(d).cuda()),1)
    decoder = nn.Sequential(
        torch.nn.Linear(d, h),
        torch.nn.ReLU(),
        torch.nn.Linear(h, h),
        torch.nn.ReLU(),
        torch.nn.Linear(h, 3*p),  # the decoder will output both the mean, the scale, and the number of degrees of freedoms (hence the 3*p)
    )
    encoder = nn.Sequential(
        torch.nn.Linear(p, h),
        torch.nn.ReLU(),
        torch.nn.Linear(h, h),
        torch.nn.ReLU(),
        torch.nn.Linear(h, 2*d),  # the encoder will output both the mean and the diagonal covariance
    )
    encoder.cuda() # we'll use the GPU
    decoder.cuda()    
    optimizer = optim.Adam(list(encoder.parameters()) + list(decoder.parameters()),lr=1e-3)
    xhat = np.copy(xhat_0) # This will be out imputed data matrix
    
    encoder.apply(weights_init)
    decoder.apply(weights_init)
    
    for ep in range(1,n_epochs):
      perm = np.random.permutation(n) # We use the "random reshuffling" version of SGD
      batches_data = np.array_split(xhat_0[perm,], n/bs)
      batches_mask = np.array_split(mask[perm,], n/bs)
      for it in range(len(batches_data)):
        optimizer.zero_grad()
        encoder.zero_grad()
        decoder.zero_grad()
        b_data = torch.from_numpy(batches_data[it]).float().cuda()
        b_mask = torch.from_numpy(batches_mask[it]).float().cuda()
        loss = miwae_loss(iota_x = b_data, mask = b_mask, d=d, K=K, p_z=p_z, encoder=encoder, decoder=decoder)
        loss.backward()
        optimizer.step()
        ### Imputation
        xhat[~mask] = miwae_impute(iota_x = torch.from_numpy(xhat_0).float().cuda(),mask = torch.from_numpy(mask).float().cuda(),L=10,d=d,p_z=p_z,encoder=encoder,decoder=decoder).cpu().data.numpy()[~mask]
    x_miwae = np.where(np.isnan(X_miss),xhat,X_miss)
    return(x_miwae)
















