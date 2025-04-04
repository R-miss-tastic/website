---
author: Krystyna Grzesiak
slug: imputomics
categories: []
tags: []
description: ''
---

##### Package: 
imputomics

##### Authors:
author: Michał Burdukiewicz, Krystyna Grzesiak, Jarosław Chilimoniuk, Jakub Kołodziejczyk, Dominik Nowakowski 

##### Category:
Single and Multiple Imputation

##### Use-Cases:
Imputation for 'omics' data, Imputation for left-censored data.

##### Description:
A robust wrapper package containing a range of methods for simulating and imputing missing values in different types of omics data such as genomics, transcriptomics, proteomics, and metabolomics. Provides tools for comparing and evaluating the performance of imputation methods and a web server.

##### Algorithms:
 - impute_amelia: Amelia:  bootstrap EM
 - impute_areg: multiple imputation additive regression
 - impute_bayesmetab: BayesMetab
 - impute_bpca: Bayesian Principal Component Analysis
 - impute_metabimpute_bpca: Bayesian Principal Component Analysis
 - impute_mice_cart: Classification And Regression Trees
 - impute_cm: compound minimium
 - impute_halfmin: half-minimum imputation
 - impute_metabimpute_halfmin: half-minimum imputation
 - impute_imputation_knn: k-nearest neighbors
 - impute_knn: k-nearest neighbors
 - impute_vim_knn: k-nearest neighbors
 - impute_corknn: k-nearest neighbors correlation
 - impute_eucknn: k-nearest neighbors euclidean
 - impute_tknn: K-nearest neighbor truncation
 - impute_mean: mean imputation
 - impute_metabimpute_mean: mean imputation
 - impute_median: median imputation
 - impute_metabimpute_median: median imputation
 - impute_mice_mixed: Multiple Imputation by Chained Equations Mixed
 - impute_metabimpute_min: minimum imputation
 - impute_min: minimum imputation
 - impute_mnmf: Non-negative Matrix Factorization
 - impute_nipals: Non-Linear Iterative Partial Least Squares
 - impute_missmda_em: iterative PCA
 - impute_pemm: Penalized Expectation Maximization
 - impute_mice_pmm: Predictive Mean Matching
 - impute_ppca: Probabilistic Principal Component Analysis
 - impute_qrilc: quantile regression approach for the imputation of left-censored
 - impute_metabimpute_qrilc: quantile regression approach for the imputation of left-censored
 - impute_random: Random imputation
 - impute_metabimpute_rf: Random Forest
 - impute_mice_rf: Random Forest
 - impute_missforest: Random Forest
 - impute_regimpute: glmnet ridge regression
 - impute_softimpute: Iterative Soft-Thresholded SVD
 - impute_bcv_svd: Singular Value Decomposition
 - impute_svd: Singular Value Decomposition
 - impute_metabimpute_zero: zero imputation
 - impute_zero: zero imputation
 - impute_gsimp: Gibbs Sampler imputation
 - impute_mai: Mechanism Aware Imputation
 - impute_metabimpute_gsimp: Gibbs Sampler imputation

The references to the methods cn be found in the documentation: https://biogenies.info/imputomics/

##### Datasets:
none

##### Further Information:
- Jarosław Chilimoniuk, Krystyna Grzesiak, Jakub Kała, Dominik Nowakowski, Adam Krętowski, Rafał Kolenda, Michał Ciborowski, Michał Burdukiewicz (2023). imputomics: web server and R package for missing values imputation in metabolomics data, Bioinformatics, 10.1093/bioinformatics/btae098.

- Web server: https://biogenies.info/imputomics-ws/

- R package: https://github.com/BioGenies/imputomics

- Documentation: https://biogenies.info/imputomics/

##### Input: 
data.frame, tibble

##### Example:
~~~~ 
library(imputomics) # load package

# to use a graphical interface for imputomics run imputomics_gui() function

# list the available imputation functions with:
list_imputations()

# example usage:

data(sim_miss)
imputed_dat <- impute_tknn(sim_miss)

head(imputed_dat)
~~~~

