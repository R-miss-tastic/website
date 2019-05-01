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

<p align="justify"><i>You can also contribute on your own to this page and provide a short introduction to a missing data package. Take a look at AAA on how to do this. We are very happy about all contributions.</i></p>




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
      <h3 class="name">imputeTS</h3>
      <h6 class="Category">Category: Time-Series Imputation</h6>
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
      <a href="/packages/imputeTS"> more.. </a>
    </li> 
    

    <li style="margin: 40px;">
      <h3 class="name">missForest</h3>
      <h6 class="Category">Category: Single Imputation</h6>
      <i class="Description">The function 'missForest' in this package is used to impute missing values particularly in the case of mixed-type data. It uses a random forest trained on the observed values of a data matrix to predict the missing values. It can be used to impute continuous and/or categorical data including complex interactions and non-linear relations. It yields an out-of-bag (OOB) imputation error estimate without the need of a test set or elaborate cross-validation. It can be run in parallel to save computation time.
      </i> <br>
      <img src="https://cranlogs.r-pkg.org/badges/missForest" alt="CRAN Downloads" /> 
      <img src="https://www.r-pkg.org/badges/last-release/missForest" alt="CRAN Release" /> <br>
      <a href="/packages/imputeTS"> more.. </a>
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

