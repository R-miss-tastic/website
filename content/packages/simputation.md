---
author: Steffen Moritz
date: '2019-07-10'
slug: simputation
categories: []
tags: []
description: ''
---


##### Package: 
simputation

##### Category:
Single Imputation, Meta-Package

##### Use-Cases:
Use imputation algortihms of multiple packages via one interface.

##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/simputation)](https://cran.r-project.org/package=simputation)

##### Description:
Easy to use interfaces to a number of imputation methods that fit in the not-a-pipe operator of the 'magrittr' package.


#### Last update:
[![CRAN Release](https://www.r-pkg.org/badges/last-release/simputation
)](https://cran.r-project.org/package=simputation)

##### Algorithms:
- impute_cart	Decision Tree Imputation
- impute_const	Impute by variable derivation
- impute_em	Multivariate, model-based imputation
- impute_en	(Robust) Linear Regression Imputation
- impute_hotdeck	Hot deck imputation
- impute_knn	Hot deck imputation
- impute_lm	(Robust) Linear Regression Imputation
- impute_median	Impute (group-wise) medians
- impute_mf	Multivariate, model-based imputation
- impute_multivariate	Multivariate, model-based imputation
- impute_pmm	Hot deck imputation
- impute_proxy	Impute by variable derivation
- impute_rf	Decision Tree Imputation
- impute_rhd	Hot deck imputation
- impute_rlm	(Robust) Linear Regression Imputation
- impute_shd	Hot deck imputation

##### Datasets:
none

##### Further Information:
 - Announcing the simputation package: make imputation simple (https://www.r-bloggers.com/announcing-the-simputation-package-make-imputation-simple/)

- Easy imputation with the simputation package, useR! 2017 (https://www.slideshare.net/MarkVanDerLoo/user2017markvanderloo)

- http://www.di.fc.ul.pt/~jpn/r/missing/index.html

- http://analyticsyatra.com/RNotebooks/Impute_Missing_Data.nb.html

- "An introduction to imputation", uRos 2018 (http://r-project.ro/conference2018/presentations/simputation_presentation.pdf)

##### Input: 
data.frame

##### Example:
~~~~ 
library("simputation")

# create dataset with missing data for testing purposes
dat <- iris
dat[1:3,1] <- dat[3:7,2] <- dat[8:10,5] <- NA
print("before imputation")
head(dat,10)

# Impute variables Sepal.Length + Sepal.Width
da5 <- impute_rlm(dat, Sepal.Length + Sepal.Width ~ Petal.Length + Species)
print("after imputation")
head(da5)
~~~~


Here you can have a interactive look at the example:
<iframe width='100%' height='800' src='https://rdrr.io/snippets/embed/?code=library(%22simputation%22)%0A%0A%23%20create%20dataset%20with%20missing%20data%20for%20testing%20purposes%0Adat%20%3C-%20iris%0Adat%5B1%3A3%2C1%5D%20%3C-%20dat%5B3%3A7%2C2%5D%20%3C-%20dat%5B8%3A10%2C5%5D%20%3C-%20NA%0Aprint(%22before%20imputation%22)%0Ahead(dat%2C10)%0A%0A%23%20Impute%20variables%20Sepal.Length%20%2B%20Sepal.Width%0Ada5%20%3C-%20impute_rlm(dat%2C%20Sepal.Length%20%2B%20Sepal.Width%20~%20Petal.Length%20%2B%20Species)%0Aprint(%22after%20imputation%22)%0Ahead(da5)' frameborder='0'></iframe>

 https://rdrr.io/snippets/embedding/ 

