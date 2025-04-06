---
author: Krystyna Grzesiak, Christophe Muller
slug: imputelcmd
date: '2025-04-04'
categories: []
tags: []
description: ''
---

##### Package: 
imputeLCMD

##### Authors:
Samuel Wieczorek, Thomas Burger, Cosmin Lazar

##### Category:
Left-Censored Missing Data

##### Use-Cases:
Left-censored data imputation, gene expression data generation

##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/imputeLCMD)](https://cran.r-project.org/package=imputeLCMD)

##### Description:
 A collection of functions for left-censored missing data imputation. Left-censoring is a special case of missing not at random (MNAR)  mechanism that generates non-responses in proteomics experiments. The package also contains functions to artificially generate peptide/protein expression data (log-transformed) as random draws from a multivariate Gaussian distribution as well as a function to generate missing data (both randomly and non-randomly). For comparison reasons, the package also contains several wrapper functions for the imputation of non-responses that are missing at random. * New functionality has been added: a hybrid method that allows the imputation of missing values in a more complex scenario where the missing data are both MAR and MNAR.
 
##### Algorithms for imputation:

- impute.MAR() – Imputation under MAR/MCAR assumption,  
- impute.MAR.MNAR() – Imputation under combined MCAR and MNAR assumption,  
- impute.MinDet() – Imputation with minimum detection value,  
- impute.MinProb() – Imputation using random draws from a left-censored distribution,  
- impute.QRILC() – Imputation based on quantile regression for left-censored data,  
- impute.wrapper.KNN() – Imputation using k-nearest neighbors,  
- impute.wrapper.MLE() – Imputation using the EM algorithm (Maximum Likelihood Estimation),  
- impute.wrapper.SVD() – Imputation based on Singular Value Decomposition,  
- impute.ZERO() – Imputation by zero.  

##### Algorithms for amputation:

- insertMVs() – Generate missing values in the dataset.

##### Datasets:

The artificial data can be generated using:

- generate.ExpressionData() -	Generate expression data,
- generate.RollUpMap() – Generate roll-up map.

The datasets can be loaded using functions:

- intensity_PXD000022() – Load dataset PXD000022 from ProteomeXchange,  
- intensity_PXD000052() – Load dataset PXD000052 from ProteomeXchange,  
- intensity_PXD000438() – Load dataset PXD000438 from ProteomeXchange,  
- intensity_PXD000501() – Load dataset PXD000501 from ProteomeXchange.

##### Further Information:

- Documentation: https://rdrr.io/cran/imputeLCMD/man/

##### Input: 
data.frame, tibble

##### Example:

You can find a nice vignette with example usage [here](https://hbiostat.org/r/hmisc/examples)
