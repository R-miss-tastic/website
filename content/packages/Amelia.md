---
author: Krystyna Grzesiak
slug: Amelia
date: '2025-04-04'
categories: []
tags: []
description: ''
---

##### Package: 
Amelia

##### Authors: 
James Honaker [aut], Gary King [aut], Matthew Blackwell [aut, cre]

##### Category:
Multiple Imputation

##### Use-Cases:
Cross-sectional survey data, High-dimensional datasets with many variables.

##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/Amelia)](https://cran.r-project.org/package=Amelia)

##### Description:
A tool that "multiply imputes" missing data in a single cross-section (such as a survey), from a time series (like variables collected for each year in a country), or from a time-series-cross-sectional data set (such as collected by years for each of several countries). Amelia II implements our bootstrapping-based algorithm that gives essentially the same answers as the standard IP or EMis approaches, is usually considerably faster than existing approaches and can handle many more variables. Unlike Amelia I and other statistically rigorous imputation software, it virtually never crashes (but please let us know if you find to the contrary!). The program also generalizes existing approaches by allowing for trends in time series across observations within a cross-sectional unit, as well as priors that allow experts to incorporate beliefs they have about the values of missing cells in their data. Amelia II also includes useful diagnostics of the fit of multiple imputation models. The program works from the R command line or via a graphical user interface that does not require users to know R.

##### Algorithms:
- impute(): Allows simple imputation (mean, median, or mode) of missing values.
- transcan(): Performs multiple imputation and transformation of missing data.
- aregImpute(): Performs multiple imputation using additive regression.
- fit.mult.impute(): Fits regression models to multiply imputed datasets.

##### Datasets:
- `africa` - Economic and Political Indictors in 6 African States,
- `freetrade` - Trade Policy and Democracy in 9 Asian States.

##### Further Information:

- Package repository: https://github.com/IQSS/Amelia

- Documentation: https://www.rdocumentation.org/packages/Amelia/versions/1.8.1

- Web-page: https://gking.harvard.edu/amelia

- GUI accessible via command `Amelia::AmeliaView()`.

##### Input: 
data.frame, matrix

##### Example:

- [Using Amelia](https://cran.r-project.org/web/packages/Amelia/vignettes/using-amelia.html)

##### Other Vignettes:
- [AmeliaView GUI Guide](https://cran.r-project.org/web/packages/Amelia/vignettes/ameliaview.html)
- [Multiple Imputation Diagnostics](https://cran.r-project.org/web/packages/Amelia/vignettes/diagnostics.html)
- [Introduction to Multiple Imputation](https://cran.r-project.org/web/packages/Amelia/vignettes/intro-mi.html)







