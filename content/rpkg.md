---
author: "Steffen Moritz"
date: 2010-04-04
linktitle: R packages
menu: navbar
name: "R packages on missing values"
url: "/rpkg/"
weight: 4
---


#### R Packages

<p align="justify">This page provides introductions to popular missing data packages with small examples on how to use them. Thus the page gives more extensive information than the  <a href="https://CRAN.R-project.org/view=MissingData" target="_blank">CRAN Task View on Missing Data</a>, which is recommended to get a first overall overview about the CRAN missing data landscape.</p>

<p align="justify"><i>You can also contribute on your own to this page and provide a short introduction to a missing data package. Take a look at <a href="/packages/rpkg-listitem-template.md" target="_blank">this short description</a> on how to do this. We are very happy about all contributions.</i></p>




<div id="users">
  <input class="search" placeholder="Search" />
  <button class="sort" data-sort="name">
    Sort by name
  </button>
  <button class="sort" data-sort="Category">
    Sort by Category
  </button>
 

<p>
  <ul class="list">
  <li style="margin: 40px;">
    <h3 class="name">missMDA</h3>
    <h6 class="Category">Category: Single and multiple Imputation, Multivariate Data Analysis</h6>
    <i class="Description">Imputation of incomplete continuous or categorical datasets; Missing values are imputed with a principal component analysis (PCA), a multiple correspondence analysis (MCA) model or a multiple factor analysis (MFA) model; Perform multiple imputation with and in PCA or MCA.</i> <br>
    <img src="https://cranlogs.r-pkg.org/badges/missMDA" alt="CRAN Downloads" /> 
    <img src="https://www.r-pkg.org/badges/last-release/missMDA" alt="CRAN Release" /> <br>
    <a href="/packages/missMDA"> more.. </a>
  </li> 

  <li style="margin: 40px;">
    <h3 class="name">imputeTS</h3>
    <h6 class="Category">Category: Time-Series Imputation, Visualisations for Missing Data</h6>
    <i class="Description">Imputation (replacement) of missing values in univariate time series. Offers several imputation functions and missing data plots. Available imputation algorithms include: 'Mean', 'LOCF', 'Interpolation', 'Moving Average', 'Seasonal Decomposition', 'Kalman Smoothing on Structural Time Series models', 'Kalman Smoothing on ARIMA models'.</i> <br>
    <img src="https://cranlogs.r-pkg.org/badges/imputeTS" alt="CRAN Downloads" /> 
    <img src="https://www.r-pkg.org/badges/last-release/imputeTS" alt="CRAN Release" /> <br>
    <a href="/packages/imputeTS"> more.. </a>
  </li> 

  <li style="margin: 40px;">
    <h3 class="name">mice</h3>
    <h6 class="Category">Category: Multiple Imputation</h6>
    <i class="Description">Multiple imputation using Fully Conditional Specification (FCS) implemented by the MICE algorithm as described in Van Buuren and Groothuis-Oudshoorn (2011). Each variable has its own imputation model. Built-in imputation models are provided for continuous data (predictive mean matching, normal), binary data (logistic regression), unordered categorical data (polytomous logistic regression) and ordered categorical data (proportional odds). MICE can also impute continuous two-level data (normal model, pan, second-level variables). Passive imputation can be used to maintain consistency between variables. Various diagnostic plots are available to inspect the quality of the imputations.</i> <br>
    <img src="https://cranlogs.r-pkg.org/badges/mice" alt="CRAN Downloads" /> 
    <img src="https://www.r-pkg.org/badges/last-release/mice" alt="CRAN Release" /> <br>
    <a href="/packages/mice"> more.. </a>
  </li> 
    
  <li style="margin: 40px;">
    <h3 class="name">naniar</h3>
    <h6 class="Category">Category: Visualisations for Missing Data</h6>
    <i class="Description">Missing values are ubiquitous in data and need to be explored and handled in the initial stages of analysis. 'naniar' provides data structures and functions that facilitate the plotting of missing values and examination of imputations. This allows missing data dependencies to be explored with minimal deviation from the common work patterns of 'ggplot2' and tidy data.</i> <br>
    <img src="https://cranlogs.r-pkg.org/badges/naniar" alt="CRAN Downloads" /> 
    <img src="https://www.r-pkg.org/badges/last-release/naniar" alt="CRAN Release" /> <br>
    <a href="/packages/naniar"> more.. </a>
  </li> 

  <li style="margin: 40px;">
    <h3 class="name">missForest</h3>
    <h6 class="Category">Category: Single Imputation</h6>
    <i class="Description">The function 'missForest' in this package is used to impute missing values particularly in the case of mixed-type data. It uses a random forest trained on the observed values of a data matrix to predict the missing values. It can be used to impute continuous and/or categorical data including complex interactions and non-linear relations. It yields an out-of-bag (OOB) imputation error estimate without the need of a test set or elaborate cross-validation. It can be run in parallel to save computation time.
    </i> <br>
    <img src="https://cranlogs.r-pkg.org/badges/missForest" alt="CRAN Downloads" /> 
    <img src="https://www.r-pkg.org/badges/last-release/missForest" alt="CRAN Release" /> <br>
    <a href="/packages/missForest"> more.. </a>
  </li> 
    
  <li style="margin: 40px;">
    <h3 class="name">simputation</h3>
    <h6 class="Category">Category: Single Imputation, Meta-Package</h6>
    <i class="Description">Easy to use interfaces to a number of imputation methods that fit in the not-a-pipe operator of the 'magrittr' package.
    </i> <br>
    <img src="https://cranlogs.r-pkg.org/badges/simputation" alt="CRAN Downloads" /> 
    <img src="https://www.r-pkg.org/badges/last-release/simputation" alt="CRAN Release" /> <br>
    <a href="/packages/simputation"> more.. </a>
  </li> 
    
  <li style="margin: 40px;">
      <h3 class="name">VIM</h3>
      <h6 class="Category">Category: Single Imputation, Visualisations for Missing Data</h6>
      <i class="Description">New tools for the visualization of missing and/or imputed values are introduced, which can be used for exploring the data and the structure of the missing and/or imputed values. Depending on this structure of the missing values, the corresponding methods may help to identify the mechanism generating the missing values and allows to explore the data including missing values. In addition, the quality of imputation can be visually explored using various univariate, bivariate, multiple and multivariate plot methods. A graphical user interface available in the separate package VIMGUI allows an easy handling of the implemented plot methods.
      </i> <br>
      <img src="https://cranlogs.r-pkg.org/badges/VIM" alt="CRAN Downloads" /> 
      <img src="https://www.r-pkg.org/badges/last-release/VIM" alt="CRAN Release" /> <br>
      <a href="/packages/VIM"> more.. </a>
    </li> 

  <li style="margin: 40px;">
  <h3 class="name">primePCA</h3> 
    <h6 class="Category">Category: Principal component analysis (PCA)</h6> 
    <i class="Description"> Implements the primePCA algorithm, developed and analysed in Zhu, Z., Wang, T. and Samworth, R. J. (2019) High-dimensional principal component analysis with heterogeneous missingness (arXiv:1906.12125). Starting from the inverse probability weighted (IPW) estimator, *primePCA* iteratively projects the observed entries of the data matrix onto the column space of our current estimate to impute the missing entries, and then updates our estimate by computing the leading right singular space of the imputed data matrix. 
    </i> <br> 
    <img src="https://cranlogs.r-pkg.org/badges/primePCA" alt="CRAN Downloads" /> 
    <img src="https://www.r-pkg.org/badges/last-release/primePCA" alt="CRAN Release" /> 
    <a href="/packages/primePCA"> more.. </a> 
  </li> 
  </ul>
  </p>
</div>

Your favorite package is missing? <a href="/packages/rpkg-listitem-template.md" target="_blank">Here</a> is an explanation on how to make an entry for your package. <a href="/packages/rpkg-template.md" target="_blank">Template</a>

<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>
<script> var options = {
  valueNames: [ 'name', 'Category', 'Description' ]
};

var userList = new List('users', options);
</script>

