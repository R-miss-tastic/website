---
author: Steffen Moritz
date: '2019-07-10'
slug: missForest
categories: []
tags: []
description: ''
---


##### Package: 
missForest

##### Authors:
Daniel J. Stekhoven

##### Category:
Single Imputation

##### Use-Cases:
Single Imputation of continuous and/or categorical data.

##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/missForest)](https://cran.r-project.org/package=missForest)

##### Description:
The function 'missForest' in this package is used to impute missing values particularly in the case of mixed-type data. It uses a random forest trained on the observed values of a data matrix to predict the missing values. It can be used to impute continuous and/or categorical data including complex interactions and non-linear relations. It yields an out-of-bag (OOB) imputation error estimate without the need of a test set or elaborate cross-validation. It can be run in parallel to save computation time.
 
#### Last update:
[![CRAN Release](https://www.r-pkg.org/badges/last-release/missForest
)](https://cran.r-project.org/package=missForest)

##### Algorithms:
- missForest (randomForest)

##### Datasets:
none

##### Further Information:
 - Stekhoven D. J., & Buehlmann, P. (2012). MissForest - non-parametric missing value imputation for
  mixed-type data. Bioinformatics, 28(1), 112-118.
  
- "Using the missForest package" (https://stat.ethz.ch/education/semesters/ss2012/ams/paper/missForest_1.2.pdf)


##### Input: 
data.frame

##### Example:
~~~~ 
library(missForest)
library(VIM)

# Load sleep data from VIM package as example
data(sleep, package = "VIM")
print("before imputation")
summary(sleep)

# Perform imputation
erg <- missForest(sleep)
print("after imputation")
summary(erg$ximp)

~~~~


Here you can have a interactive look at the example:
<iframe width='100%' height='800' src='https://rdrr.io/snippets/embed/?code=library(missForest)%0Alibrary(VIM)%0A%0A%23%20Load%20sleep%20data%20from%20VIM%20package%20as%20example%0Adata(sleep%2C%20package%20%3D%20%22VIM%22)%0Aprint(%22before%20imputation%22)%0Asummary(sleep)%0A%0A%23%20Perform%20imputation%0Aerg%20%3C-%20missForest(sleep)%0Aprint(%22after%20imputation%22)%0Asummary(erg%24ximp)' frameborder='0'></iframe>
 https://rdrr.io/snippets/embedding/ 

