---
author: Krystyna Grzesiak
slug: mixgb
date: '2025-04-04'
categories: []
tags: []
description: ''
---

##### Package: 
mixgb

##### Authors: 
Yongshi Deng [aut, cre], Thomas Lumley [ths]

##### Category:
Single Imputation, Analysis for Incomplete Data

##### Use-Cases:
Multiple imputation for large datasets.


##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/mixgb)](https://cran.r-project.org/package=mixgb)

##### Description:
Multiple imputation using 'XGBoost', subsampling, and predictive mean matching as described in Deng and Lumley (2023) <doi:10.1080/10618600.2023.2252501>. The package supports various types of variables, offers flexible settings, and enables saving an imputation model to impute new data. Data processing and memory usage have been optimised to speed up the imputation process.

##### Algorithms for Imputation:
- `impute_new()`: Impute new data with a saved mixgb imputer object
- `mixgb()`: This function is used to generate multiply-imputed datasets using XGBoost, subsampling and predictive mean matching (PMM),
- `mixgb_cv()`: Use cross-validation to find the optimal nrounds for an Mixgb imputer. Note that this method relies on the complete cases of a dataset to obtain the optimal nrounds.

##### Algorithms for Amputation:

- `createNA()` - This function creates missing values under the missing complete at random (MCAR) mechanism. It is for demonstration purposes only.

##### Datasets:

- `nhanes3` - A small subset of the NHANES III (1988-1994) newborn data,
- `nhanes3_newborn` - NHANESIII (1988-1994) newborn data.

##### Further Information:

- Package repository: https://github.com/agnesdeng/mixgb

- Documentation: https://www.rdocumentation.org/packages/mixgb/versions/1.5.2/topics/mixgb

- Yongshi Deng, Thomas Lumley, *"Multiple Imputation Through XGBoost"*, https://doi.org/10.1080/10618600.2023.2252501

##### Input: 
data.frame

##### Vignettes:

- [Imputing newdata with a saved mixgb imputer](https://cran.r-project.org/web/packages/mixgb/vignettes/Imputing-newdata.html)
- [mixgb: Multiple Imputation Through XGBoost](https://cran.r-project.org/web/packages/mixgb/vignettes/Using-mixgb.html)
