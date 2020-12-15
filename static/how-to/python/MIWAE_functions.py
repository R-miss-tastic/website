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
   