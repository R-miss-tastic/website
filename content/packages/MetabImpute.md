---
author: Krystyna Grzesiak
slug: MetabImpute
categories: []
tags: []
description: ''
---

##### Package: 
MetabImpute

##### Authors:
Tarek Firzli, Trenton Davis, Emily Higgins.

##### Category:
Single and Multiple Imputation, Left-Censored Missing Data, Metabolomics

##### Use-Cases:
Single imputation, Metabolomics, Imputation with Biological Replicates

##### Description:
A package to evaluate missing data, simulate data matrices and missingness, evaluate multiple imputation methods and return statistics on these and finally methods to impute utilizing multiple standard imputation approaches. Novel imputation methodologies which utilize an imputation approach with data that uses biological or technical replication are also included. ICC evaluation methods are included specifically included to suit researchers working with data with biological or technical replicates. Source code was written by the authors with code copied and modified from the following GitHub packages: https://github.com/Tirgit/missCompare, https://github.com/WandeRum/GSimp (Wei, R., Wang, J., Jia, E., Chen, T., Ni, Y., & Jia, W. (2017). GSimp: A Gibbs sampler based left-censored missing value imputation approach for metabolomics studies. PLOS Computational Biology) https://github.com/juuussi/impute-metabo Kokla, M., Virtanen, J., Kolehmainen, M. et al. Random forest-based imputation outperforms other methods for imputing LC-MS metabolomics data: a comparative study. BMC Bioinformatics 20, 492 (2019). https://doi.org/10.1186/s12859-019-3110-0


##### Algorithms for Imputation:

- `Impute()` - contains different imputation methods, including `RF`, `BPCA`, `QRILC`, `GSIMP`, `RHM`,`RMEAN`, `RMEDIAN`, `RMIN`, `RZERO`, `RRF`, `RGSIMP`, `RQRILC`, `RBPCA`, `min`, `halfmin`, `mean`, `median`, `zero`.
- `imputeMulti()` – Perform multiple imputations,  
- `multi_impute()` – Multiple imputation procedure (from WandeRum/GSimp),  
- `GS_impute()` – GSimp-based imputation (from WandeRum/GSimp),  
- `single_impute_iters()` – Iterative single imputation (from WandeRum/GSimp),  

##### Algorithms for Amputation:

- `simulate_missingness()` – Create missingness patterns (MCAR, MNAR, MAR) in simulated data,  


##### Other Algorithms:

- `binaryMatrix()` – Create a binary matrix indicating missing values,  
- `cbind_abind()` – Parallel combination of arrays (from WandeRum/GSimp),  
- `check.miss()` – Check percent missingness (from juuussi/impute-metabo),  
- `correlationMatrix()` – Return correlation and NA-correlation matrices,  
- `detect.MCAR.MNAR.MAR()` – Detect missingness mechanisms (from juuussi/impute-metabo),  
- `detect.miss.MNAR.MAR()` – Identify dependencies in missingness using correlation with missingness indicators (from juuussi/impute-metabo),  
- `detect_missingness_type()` – Return vector indicating type of missingness per column (from juuussi/impute-metabo),  
- `missingProportions()` – Calculate proportions of missing data,  
- `plotResults()` – Plot results from simulations or imputations,  

##### Algorrithms for Data Generation:

- `simulate()` – Simulate datasets with similar correlation structure (based on missCompare),  
- `rnorm_trunc()` – Generate truncated normal values (from WandeRum/GSimp),  

##### Further Information:

- R package: https://github.com/BeanLabASU/metabimpute

##### Input: 
matrix


