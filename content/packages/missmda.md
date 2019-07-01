---
author: Imke Mayer
date: '2019-07-01'
slug: missmda
categories: []
tags: []
description: ''
---


##### Package: 
missMDA

##### Category:
Single and multiple imputation

##### Use-Cases:
Imputation of incomplete continuous, categorical or mixed datasets, ...

##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/missMDA)](https://cran.r-project.org/package=missMDA)

##### Description:
Imputation of incomplete continuous or categorical datasets; Missing values are imputed with a principal component analysis (PCA), a multiple correspondence analysis (MCA) model or a multiple factor analysis (MFA) model; Perform multiple imputation with and in PCA or MCA.

#### Last update:
[![CRAN Release](https://www.r-pkg.org/badges/last-release/missMDA
)](https://cran.r-project.org/package=missMDA)

##### Algorithms:
- Continuous data (multiple) imputation (with Principal Components Analysis)
- Contingency table imputation (with Correspondence Analysis)
- Mixed data (multiple) imputation (with Factorial Analysis of Mixed Data)
- Categorical data (multiple) imputation (with Multiple Correspondence Analysis)
- Structured data imputation (with Multiple Factor Analysis)
- Multilevel mixed data imputation (with Multilevel Factorial Analysis for Mixed Data)
- Overimputation diagnostic

##### Datasets:
- gene
- geno
- orange
- ozone
- snorena
- TitanicNA
- vnf

##### Further Information:
- Josse, J. & Husson, F. (2012). Handling missing values in exploratory multivariate data analysis methods. Journal de la SFdS, 153(2), pp. 79-99. [PDF (on HAL)](https://hal.archives-ouvertes.fr/hal-00811888)
- Julie Josse, Francois Husson (2016). missMDA: A Package for Handling Missing Values in Multivariate Data Analysis. Journal of Statistical Software, 70(1), 1-31. doi:10.18637/jss.v070.i01. [PDF (on HAL)](https://hal.archives-ouvertes.fr/hal-01314945)
- Audigier, V., Husson, F., and Josse, J. (2016). Multiple imputation for continuous variables using a bayesian principal component analysis. Journal of Statistical Computation and Simulation, 86(11):2140-2156. [PDF (on arXiv)](https://arxiv.org/abs/1401.5747)
- Audigier, V., Husson, F., and Josse, J. (2016). A principal component method to impute missing values for mixed data. Advances in Data Analysis and Classification, 10(1):5-26. [PDF (on arXiv)](https://arxiv.org/abs/1301.4797)
- Audigier, V., Husson, F., and Josse, J. (2017). Mimca: multiple imputation for categorical variables with multiple correspondence analysis. Statistics and Computing, 27(2):501-518. [PDF (on arXiv)](https://arxiv.org/abs/1505.08116)
- [Some videos (on Youtube)](https://www.youtube.com/playlist?list=PLnZgp6epRBbQzxFnQrcxg09kRt-PA66T_)

##### Input: 
data.frame, mids

##### Example:
~~~~ 
library(missMDA)

data(orange)

print("print data set with NAs")
print(head(orange))

## First the number of components has to be chosen
## (for the imputation step)
## nb <- estim_ncpPCA(orange,ncp.max=5) ## Time consuming, nb = 2
## Imputation
res.comp <- imputePCA(orange,ncp=2)

print("print data set with the imputations")
print(head(res.comp$completeObs))
~~~~


Here you can have a interactive look at the example:
<iframe width='100%' height='300' src='https://rdrr.io/snippets/embed/?code=library(missMDA)%0A%0Adata(orange)%0A%0Aprint(%22print%20data%20set%20with%20NAs%22)%0Aprint(head(orange))%0A%0A%23%23%20First%20the%20number%20of%20components%20has%20to%20be%20chosen%0A%23%23%20(for%20the%20imputation%20step)%0A%23%23%20nb%20%3C-%20estim_ncpPCA(orange%2Cncp.max%3D5)%20%23%23%20Time%20consuming%2C%20nb%20%3D%202%0A%23%23%20Imputation%0Ares.comp%20%3C-%20imputePCA(orange%2Cncp%3D2)%0A%0Aprint(%22print%20data%20set%20with%20the%20imputations%22)%0Aprint(head(res.comp%24completeObs))' frameborder='0'></iframe>

 https://rdrr.io/snippets/embedding/ 

