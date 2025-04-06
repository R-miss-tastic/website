---
author: Krystyna Grzesiak
slug: CALIBERrfimpute
date: '2025-04-04'
categories: []
tags: []
description: ''
---

##### Package: 
CALIBERrfimpute

##### Authors: 
Anoop Shah [aut, cre], Jonathan Bartlett [ctb], Harry Hemingway [ths], Owen Nicholas [ths], Aroon Hingorani [ths]

##### Category:
Multiple Imputation

##### Use-Cases:
Multiple Imputation, MICE and Random Forest

##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/CALIBERrfimpute)](https://cran.r-project.org/package=CALIBERrfimpute)

##### Description:
Functions to impute using random forest under full conditional specifications (multivariate imputation by chained equations). The methods are described in Shah and others (2014) <doi:10.1093/aje/kwt312>.

##### Algorithms for Imputation:

`mice` compatible methods such as:
- `rfcont` - Impute continuous variables using Random Forest within MICE,
- `rfcat` - Impute categorical variables using Random Forest within MICE.

##### Other Algorithms:
- `simdata()` - Simulate multivariate data for testing

##### Datasets:
none.

##### Further Information:

- Documentation: https://www.rdocumentation.org/packages/CALIBERrfimpute/versions/1.0-7/topics/CALIBERrfimpute-package

- Shah AD, Bartlett JW, Carpenter J, Nicholas O, Hemingway H. Comparison of Random Forest and parametric imputation models for imputing missing data using MICE: a CALIBER study. American Journal of Epidemiology 2014; 179(6): 764–774. doi:10.1093/aje/kwt312

- Doove LL, van Buuren S, Dusseldorp E. Recursive partitioning for missing data imputation in the presence of interaction effects. Computational Statistics and Data Analysis 2014; 72: 92–104. doi:10.1016/j.csda.2013.10.025

##### Input: 
data.frame

##### Vignette:

[Comparison of parametric and Random Forest-based MICE methods for imputing missing data in survival analysis. ](https://cran.r-project.org/web/packages/CALIBERrfimpute/vignettes/simstudy_survival.pdf)

##### Example:

~~~~ 
library(CALIBERrfimpute)

mydata <- data.frame(x1 = as.factor(c('this', 'this', NA, 'that', 'this')), 
                     x2 = 1:5, 
                     x3 = c(TRUE, FALSE, TRUE, NA, FALSE)) 
mice(mydata, method = c('rfcat', 'rfcont'), m = 2, maxit = 2)
~~~~

