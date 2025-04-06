---
author: Krystyna Grzesiak
slug: rrcovNA
date: '2025-04-04'
categories: []
tags: []
description: ''
---

##### Package: 
rrcovNA

##### Authors: 
Valentin Todorov [aut, cre]

##### Category:
Single Imputation, Analysis for Incomplete Data

##### Use-Cases:
High-breakdown point estimation for location and scatter, Suitable for incomplete and outlier-contaminated data.


##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/rrcovNA)](https://cran.r-project.org/package=rrcovNA)

##### Description:
Contains many functions useful for data analysis, high-level graphics, utility operations, functions for computing sample size and power, simulation, importing and annotating datasets, imputing missing values, advanced table making, variable clustering, character string manipulation, conversion of R objects to LaTeX and html code, recoding variables, caching, simplified parallel computing, encrypting and decrypting data using a safe workflow, general moving window statistical estimation, and assistance in interpreting principal component analysis.

##### Algorithms for Imputation:
- `impNorm()`: Draws missing elements of a data matrix under the multivariate normal model and a user-supplied parameter,
- `impSeq()`: Impute missing multivariate data using sequential algorithm,
- `impSeqRob()`: Impute missing multivariate data using robust sequential algorithm.

##### Other Algorithms:
- `PcaNA()` - Computes classical and robust principal components for incomplete data using an EM algorithm as descibed by Serneels and Verdonck (2008)

##### Datasets:

- `bush10` - Campbell Bushfire Data with added missing data items(10 percent),
- `ces` - Consumer Expenditure Survey Data.

##### Further Information:

- Package repository: https://github.com/valentint/rrcovNA

- Documentation: https://www.rdocumentation.org/packages/rrcovNA/versions/0.5-2

- Valentin Todorov, Matthias Templ, *Detection of multivariate outliers in business survey data with incomplete information*, DOI:10.1007/s11634-010-0075-2

##### Input: 
data.frame

##### Example:

You can find a nice vignette with example usage [here](https://hbiostat.org/r/hmisc/examples)
