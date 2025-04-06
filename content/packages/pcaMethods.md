---
author: Krystyna Grzesiak
slug: pcaMethods
categories: []
tags: []
description: ''
---

##### Package: 
pcaMethods

##### Authors:
Wolfram Stacklies, Henning Redestig, Kevin Wright

##### Category:
Single Imputation

##### Use-Cases:
Bayesian and probabilistic PCA on incomplete data, Missing value imputation using PCA methods, Comparison with cluster-based imputation, Unified structure for PCA results and plots.

##### Description:
Provides Bayesian PCA, Probabilistic PCA, Nipals PCA, Inverse Non-Linear PCA and the conventional SVD PCA. A cluster based method for missing value estimation is included for comparison. BPCA, PPCA and NipalsPCA may be used to perform PCA on incomplete data as well as for accurate missing value estimation. A set of methods for printing and plotting the results is also provided. All PCA methods make use of the same data structure (pcaRes) to provide a common interface to the PCA results. Initiated at the Max-Planck Institute for Molecular Plant Physiology, Golm, Germany.

##### Algorithms for Imputation:

- `bpca()` - Bayesian PCA missing value estimation,
- `nipalsPca()` - PCA by non-linear iterative partial least squares,
- `ppca()` - Probabilistic PCA,
- `svdImpute()` - SVD imputation,
- `LLSImpute()` - local least squares imputation,
- `nlpca()` - Neural network based non-linear PCA.

##### Datasets:

- `helix` - A helix structured toy data set, 
- `metaboliteData` - A incomplete metabolite data set from an Arabidopsis coldstress experiment, 
- `metaboliteDataComplete` - A complete metabolite data set from an Arabidopsis coldstress experiment.

##### Further Information:

- Stacklies W, Redestig H, Scholz M, Walther D, Selbig J (2007). “pcaMethods – a Bioconductor package providing PCA methods for incomplete data.” Bioinformatics, 23, 1164–1167.

- R package: https://bioconductor.org/packages/release/bioc/html/pcaMethods.html

##### Input: 
matrix





