---
author: Steffen Moritz
date: '2019-07-10'
slug: mice
categories: []
tags: []
description: ''
---


##### Package: 
mice

##### Category:
Multiple Imputation

##### Use-Cases:
Multiple imputation for mixes of continuous, binary, unordered categorical and ordered categorical data, Inspect the missing data, Generate simulated incomplete data

##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/mice)](https://cran.r-project.org/package=mice)

##### Description:
Multiple imputation using Fully Conditional Specification (FCS) implemented by the MICE algorithm as described in Van Buuren and Groothuis-Oudshoorn (2011) <doi:10.18637/jss.v045.i03>. Each variable has its own imputation model. Built-in imputation models are provided for continuous data (predictive mean matching, normal), binary data (logistic regression), unordered categorical data (polytomous logistic regression) and ordered categorical data (proportional odds). MICE can also impute continuous two-level data (normal model, pan, second-level variables). Passive imputation can be used to maintain consistency between variables. Various diagnostic plots are available to inspect the quality of the imputations.

#### Last update:
[![CRAN Release](https://www.r-pkg.org/badges/last-release/mice
)](https://cran.r-project.org/package=mice)

##### Algorithms:
- pmm	Predictive mean matching
- midastouch	Weighted predictive mean matching
- sample	Random sample from observed values
- cart	Classification and regression trees
- rf	Random forest imputations
- mean	Unconditional mean imputation
- norm	Bayesian linear regression
- norm.nob	Linear regression ignoring model error
- norm.boot	Linear regression using bootstrap
- norm.predict	Linear regression, predicted values
- quadratic	Imputation of quadratic terms
- ri	Random indicator for nonignorable data
- logreg	Logistic regression
- logreg.boot	Logistic regression with bootstrap
- polr	Proportional odds model
- polyreg	Polytomous logistic regression
- lda	Linear discriminant analysis
- 2l.norm	Level-1 normal heteroscedastic
- 2l.lmer	Level-1 normal homoscedastic, lmer
- 2l.pan	Level-1 normal homoscedastic, pan
- 2l.bin	Level-1 logistic, glmer
- 2lonly.mean	Level-2 class mean
- 2lonly.norm	Level-2 class normal
- 2lonly.pmm	Level-2 class predictive mean matching


##### Datasets:
- boys	(Growth of Dutch boys)
- brandsma (Brandsma school data, Snijders and Bosker, 2012)
- employee (Employee selection data)
- fdd	(SE Fireworks disaster data)
- fdgs	(Fifth Dutch growth study,2009)
- leiden85	(Leiden 85+ study)
- mammalsleep	(Mammal sleep data)
- mgg	(Self-reported and measured BMI)
- nhanes (NHANES example - all variables numerical)
- pattern	(Datasets with various missing data patterns)
- pattern1	(Datasets with various missing data patterns)
- pattern2	(Datasets with various missing data patterns)
- pattern3	(Datasets with various missing data patterns)
- pattern4	(Datasets with various missing data patterns)
- popmis	(Hox pupil popularity data with missing popularity scores)
- pops	(Project on preterm and small for gestational age infants)
- potthoffroy	(Potthoff-Roy data)
- selfreport	(Self-reported and measured BMI)
- sleep	Mammal (sleep data)
- tbc	Terneuzen (birth cohort)
- walking	Walking (disability data)
- windspeed	(Subset of Irish wind speed data)

##### Further Information:
- van Buuren, S., Groothuis-Oudshoorn, K. (2011). mice: Multivariate Imputation by Chained Equations in R. Journal of Statistical Software, 45(3), 1–67.

- Van Buuren, S. (2018). Flexible Imputation of Missing Data. Second Edition. Chapman & Hall/CRC. Boca Raton, FL.

- https://datascienceplus.com/imputing-missing-data-with-r-mice-package/

##### Input: 
data.frame

##### Example:
~~~~ 
# classic MICE/multiple imputation workflow
library("mice")

#Perform imputation - create multiple imputed datasets
imp <- mice(nhanes, maxit = 2, m = 2)

# Fit a lm model on each of the datasets
fit <- with(data = imp, exp = lm(bmi ~ hyp + chl))

# Pool the models/results
summary(pool(fit))
~~~~


Here you can have a interactive look at the example:
<iframe width='100%' height='800' src='https://rdrr.io/snippets/embed/?code=%23%20classic%20MICE%2Fmultiple%20imputation%20workflow%0Alibrary(%22mice%22)%0A%0A%23Perform%20imputation%20-%20create%20multiple%20imputed%20datasets%0Aimp%20%3C-%20mice(nhanes%2C%20maxit%20%3D%202%2C%20m%20%3D%202)%0A%0A%23%20Fit%20a%20lm%20model%20on%20each%20of%20the%20datasets%0Afit%20%3C-%20with(data%20%3D%20imp%2C%20exp%20%3D%20lm(bmi%20~%20hyp%20%2B%20chl))%0A%0A%23%20Pool%20the%20models%2Fresults%0Asummary(pool(fit))' frameborder='0'></iframe>

 https://rdrr.io/snippets/embedding/ 

