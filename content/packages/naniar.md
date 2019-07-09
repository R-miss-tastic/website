---
author: Imke Mayer
date: '2019-07-01'
slug: naniar
categories: []
tags: []
description: ''
---


##### Package: 
naniar

##### Category:
Data Structures, Summaries, and Visualisations for Missing Data

##### Use-Cases:
Visualization of missing values, descriptive statistics, ...

##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/naniar)](https://cran.r-project.org/package=naniar)

##### Description:
Missing values are ubiquitous in data and need to be carefully explored and handled in the initial stages of analysis. In this vignette we describe the tools in the package naniar for exploring missing data structures with minimal deviation from the common workflows of ggplot and tidy data.

#### Last update:
[![CRAN Release](https://www.r-pkg.org/badges/last-release/naniar
)](https://cran.r-project.org/package=naniar)

##### Datasets:
- oceanbuoys
- pedestrian
- riskfactors

##### Further Information:
- Tierney, N. J., & Cook, D. H. (2018). Expanding tidy data principles to facilitate missing data exploration, visualization and assessment of imputations. arXiv preprint arXiv:1809.02264. [PDF (on arXiv)](https://arxiv.org/abs/1809.02264.pdf)
- [Vignettes](https://cran.r-project.org/web/packages/naniar/index.html)
- Related [visdat](https://cran.r-project.org/web/packages/visdat/index.html) R-package

##### Input: 
data.frame, vector

##### Example:
~~~~ 
library(naniar)

data(airquality)

print("print data set with NAs")
print(head(airquality))

## Replace "NA" values with values 10% lower 
## than the minimum value in that variable.
## This is done by calling the geom_miss_point() function
ggplot2::ggplot(airquality, 
       			ggplot2::aes(x = Solar.R, 
           		y = Ozone)) + 
  geom_miss_point()
~~~~


Here you can have a interactive look at the example:
<iframe width='100%' height='300' src='https://rdrr.io/snippets/embed/?code=library(naniar)%0A%0Adata(airquality)%0A%0Aprint(%22print%20data%20set%20with%20NAs%22)%0Aprint(head(airquality))%0A%0A%23%23%20Replace%20%E2%80%9CNA%E2%80%9D%20values%20with%20values%2010%25%20lower%20%0A%23%23%20than%20the%20minimum%20value%20in%20that%20variable.%0A%23%23%20This%20is%20done%20by%20calling%20the%20geom_miss_point()%20function%0Aggplot2%3A%3Aggplot(airquality%2C%20%0A%20%20%20%20%20%20%20%09%09%09ggplot2%3A%3Aaes(x%20%3D%20Solar.R%2C%20%0A%20%20%20%20%20%20%20%20%20%20%20%09%09y%20%3D%20Ozone))%20%2B%20%0A%20%20geom_miss_point()' frameborder='0'></iframe>

 https://rdrr.io/snippets/embedding/ 

