---
author: Steffen Moritz
date: '2019-07-13'
slug: primePCA
categories: []
tags: []
description: ''
---


##### Package: 
primePCA <!-- Replace <name_of_package> by the package name-->

##### Category:
Principal component analysis (PCA)<!-- Replace <category> by the category (e.g. Time Series Imputation, Regression, Classification, etc.) -->

##### Use-Cases:
PCA, Clustering, Personalized recommendation <!-- Replace <use_cases> by one or more examples (e.g. Imputation for Sensor Recordings, Prediction on incomplete health/ecology/... records, etc.) -->

##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/primePCA)](https://cran.r-project.org/package=primePCA) <!-- Replace the two instances of <pkg> by the CRAN package name-->

##### Description:
Implements the primePCA algorithm, developed and analysed in Zhu, Z., Wang, T. and Samworth, R. J. (2019) High-dimensional principal component analysis with heterogeneous missingness (arXiv:1906.12125). Starting from the inverse probability weighted (IPW) estimator, *primePCA* iteratively projects the observed entries of the data matrix onto the column space of our current estimate to impute the missing entries, and then updates our estimate by computing the leading right singular space of the imputed data matrix.<!-- Add short description (<10 lines) on main functionalities and caracteristics of the packages-->

#### Last update:
[![CRAN Release](https://www.r-pkg.org/badges/last-release/primePCA
)](https://cran.r-project.org/package=primePCA) <!-- Replace the two instances of <pkg> by the CRAN package name-->

##### Algorithms:
- Inverse probability weighted method 
- primePCA <!-- List the algorithms used/implemented in this package-->


##### Datasets:
None <!-- List the datasets used in this package-->

##### Further Information:
- Zhu, Z., Wang, T. and Samworth, R. J. (2019). “High-dimensional principal component analysis with heterogeneous missingness.” arXiv:1906.12125. <!-- If available, provide related publications or other links (e.g. vignettes)-->

##### Example:
~~~~ 
library(primePCA) # load package
X = matrix(1:30 + .1 * rnorm(30), 10, 3)
X[1, 1] = NA
X[2, 3] = NA
v_tilde = primePCA(X, 1)$V_cur
~~~~


Here you can have a interactive look at the example:
<!-- How to generate an embedded R example that can be run on the website:
	 1) Go to https://rdrr.io/snippets/embedding/
	 2) Copy the short R example above in the dedicated box.
	 3) Click on "Generate embed code"
	 4) Copy the resulting code directly here below (something like "<iframe width='100% ... </iframe>")
-->
<iframe width='100%' height='300' src='https://rdrr.io/snippets/embed/?code=library(primePCA)%20%23%20load%20package%0AX%20%3D%20matrix(1%3A30%20%2B%20.1%20*%20rnorm(30)%2C%2010%2C%203)%0AX%5B1%2C%201%5D%20%3D%20NA%0AX%5B2%2C%203%5D%20%3D%20NA%0Av_tilde%20%3D%20primePCA(X%2C%201)%24V_cur%0A' frameborder='0'></iframe>

 https://rdrr.io/snippets/embedding/ 
