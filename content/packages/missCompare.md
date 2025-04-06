---
author: Krystyna Grzesiak
slug: missCompare
date: '2025-04-04'
categories: []
tags: []
description: ''
---

##### Package: 
missCompare

##### Authors: 
Tibor V. Varga [aut, cre], David Westergaard [aut]

##### Category:
Single and Multiple Imputation

##### Use-Cases:
Imputation, benchmarking imputation algorithms


##### Popularity:
[![CRAN Downloads](https://cranlogs.r-pkg.org/badges/missCompare)](https://cran.r-project.org/package=missCompare)

##### Description:

Offers a convenient pipeline to test and compare various missing data imputation algorithms on simulated and real data. These include simpler methods, such as mean and median imputation and random replacement, but also include more sophisticated algorithms already implemented in popular R packages, such as 'mi', described by Su et al. (2011) <doi:10.18637/jss.v045.i02>; 'mice', described by van Buuren and Groothuis-Oudshoorn (2011) <doi:10.18637/jss.v045.i03>; 'missForest', described by Stekhoven and Buhlmann (2012) <doi:10.1093/bioinformatics/btr597>; 'missMDA', described by Josse and Husson (2016) <doi:10.18637/jss.v070.i01>; and 'pcaMethods', described by Stacklies et al. (2007) <doi:10.1093/bioinformatics/btm069>. The central assumption behind 'missCompare' is that structurally different datasets (e.g. larger datasets with a large number of correlated variables vs. smaller datasets with non correlated variables) will benefit differently from different missing data imputation algorithms. 'missCompare' takes measurements of your dataset and sets up a sandbox to try a curated list of standard and sophisticated missing data imputation algorithms and compares them assuming custom missingness patterns. 'missCompare' will also impute your real-life dataset for you after the selection of the best performing algorithm in the simulations. The package also provides various post-imputation diagnostics and visualizations to help you assess imputation performance.



##### Algorithms for imputation:

- `impute_data()` -  function with `sel_method` parameter specifying one of the methods: `1`	random replacement, `2`	median imputation, `3`	mean imputation, `4`	missMDA Regularized, `5`	missMDA EM, `6`	pcaMethods PPCA, `7`	pcaMethods svdImpute, `8`	pcaMethods BPCA, `9`	pcaMethods NIPALS,  `10`	pcaMethods NLPCA, `11`	mice mixed,  `12`	mi Bayesian, `13`	Amelia II, `14`	missForest, `15`	Hmisc aregImpute, `16`	VIM kNN.

- `post_imp_diag()` - will give an informative assessment on how the imputation changed the data structure (e.g. variable means, distributions, clusters, correlations)

##### Algorithms for amputation:

- `all_patterns()` – spikes in missingness using MCAR, MAR, MNAR (default) and MAP (optional) patterns,
- `MAR()` - spikes in missingness using missing-at-random (MAR) pattern,
- `MNAR()` - spikes in missingness using missing-not-at-random (MNAR) pattern,
- `MAP()` - spikes in missingness using missing-at-assumed (MAP) pattern.


##### Datasets:

- `clindata_miss` - clinical dataset with missingness

##### Further Information:

- Package repository: https://github.com/Tirgit/missCompare

- Documentation: https://www.rdocumentation.org/packages/missCompare/versions/1.0.3/topics/missCompare

##### Input: 
data.frame

##### Example:

You can find a nice vignette with example usage [here](https://cran.r-project.org/web/packages/missCompare/vignettes/misscompare.html)
