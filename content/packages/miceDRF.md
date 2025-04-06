---
author: Krystyna Grzesiak
slug: miceDRF
date: '2025-04-04'
categories: []
tags: []
description: ''
---

##### Package: 
miceDRF

##### Authors: 
Krystyna Grzesiak, Jeffrey Näf

##### Category:
Multiple Imputation, MICE

##### Use-Cases:
Imputation, Distributional Random Forest

##### Popularity:
soon on CRAN


##### Description:
This package contains miceDRF imputation method and tools for measuring imputation performance.

##### Algorithms:
- impute_mice_drf(): mice + Distributional Random Forest imputation

##### Datasets:
none

##### Further Information:

- Package repository: https://github.com/KrystynaGrzesiak.

##### Input: 
data.frame, matrix

##### Example:

~~~

library(miceDRF)
library(mice)

n <- 200
d <- 5
X <- matrix(runif(n * d), nrow = n, ncol = d)


pmiss <- 0.2

X.NA <- apply(X, 2, function(x) {
  U <- runif(length(x))
  ifelse(U <= pmiss, rep(NA, length(x)), x)
})

imp <- mice(X.NA, m = 1, method = "DRF")
Ximp <- mice::complete(imp)

~~~