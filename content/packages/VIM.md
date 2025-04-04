---
author: Steffen Moritz
date: '2019-07-10'
slug: VIM
categories: []
tags: []
description: ''
---


##### Package: 
VIM

##### Authors:
Matthias Templ [aut, cre], Alexander Kowarik ORCID iD [aut], Andreas Alfons [aut], Gregor de Cillia [aut], Bernd Prantner [ctb], Wolfgang Rannetbauer [aut]

##### Category:
Single Imputation, Visualisations for Missing Data

##### Use-Cases:
Single imputation for numerical, categorical, ordered and semi-continous variables, Missing data visualizations

##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/VIM)](https://cran.r-project.org/package=VIM)

##### Description:
 New tools for the visualization of missing and/or imputed values are introduced, which can be used for exploring the data and the structure of the missing and/or imputed values. Depending on this structure of the missing values, the corresponding methods may help to identify the mechanism generating the missing values and allows to explore the data including missing values. In addition, the quality of imputation can be visually explored using various univariate, bivariate, multiple and multivariate plot methods. A graphical user interface available in the separate package VIMGUI allows an easy handling of the implemented plot methods.
 
#### Last update:
[![CRAN Release](https://www.r-pkg.org/badges/last-release/VIM
)](https://cran.r-project.org/package=VIM)

##### Algorithms:
- irmi	Iterative robust model-based imputation (IRMI)
- kNN	k-Nearest Neighbour Imputation
- hotdeck	Hot-Deck Imputation
- regressionImp	Regression Imputation

##### Datasets:
- tao	Tropical (Atmosphere Ocean (TAO) project data)
- testdata	(Simulated data set for testing purpose)
- sleep	(Mammal sleep data)

##### Further Information:
 - Alexander Kowarik, Matthias Templ (2016). Imputation with the R Package VIM. Journal of Statistical
  Software, 74(7), 1-16. doi:10.18637/jss.v074.i07
  
- https://datascienceplus.com/graphical-presentation-of-missing-data-vim-package/

- https://datasciencebeginners.com/2018/11/07/visualization-of-imputed-values-using-vim/

##### Input: 
data.frame, matrix

##### Example:
~~~~ 
library("VIM")

# load dataset sleep, whcih contains NAs
data(sleep, package = "VIM")
print("before imputation")
summary(sleep)

# Perfom imputation with kNN
x  <- kNN(sleep)
print("after imputation")
summary(x)

~~~~


Here you can have a interactive look at the example:
<iframe width='100%' height='800' src='https://rdrr.io/snippets/embed/?code=library(%22VIM%22)%0A%0A%23%20load%20dataset%20sleep%2C%20whcih%20contains%20NAs%0Adata(sleep%2C%20package%20%3D%20%22VIM%22)%0Aprint(%22before%20imputation%22)%0Asummary(sleep)%0A%0A%23%20Perfom%20imputation%20with%20kNN%0Ax%20%20%3C-%20kNN(sleep)%0Aprint(%22after%20imputation%22)%0Asummary(x)' frameborder='0'></iframe>

 https://rdrr.io/snippets/embedding/ 

