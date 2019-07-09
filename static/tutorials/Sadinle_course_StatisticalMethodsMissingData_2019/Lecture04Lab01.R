#### Statistical Methods for Analysis with Missing Data
#### Lecture 4: R session 1
#### Mauricio Sadinle
#### Department of Biostatistics
#### University of Washington


### Previous Lecture
## - Complete-case analyses are wasteful and potentially invalid unless MCAR
## - Available-case analyses make a better use of the available data but
##   still requires MCAR (possibly weaker assumptions depending on model)
## - Imputation methods might be valid for some quantities under MCAR
##   but variances are underestimated => overconfidence in your results!


### Today's Lecture: R session 1
## - Vanilla simulation study for mean imputation
## - Hot-Deck imputation methods in R


### Part 1: Simulation Exploration for Mean Imputation
## We'll show that mean imputation under MCAR leads to:
## - Distortion of associations
## - Overconfidence in results

# Clean your environment
rm(list=ls())

# Set a seed so you can reproduce all the results
set.seed(345)


## First, we generate one dataset and compute our estimates on it

# We start generating fully observed data

# Sample size
n <- 1000

# x1 
x1 <- rnorm(n)

# x2|x1 
betax2_x1 <- c(0,0)
x2 <- rnorm(n, mean = betax2_x1[1] + betax2_x1[2]*x1)

# x3|(x1,x2) 
betax3_x1x2 <- c(0,1,2)
x3 <- rnorm(n, mean = betax3_x1x2[1] + betax3_x1x2[2]*x1 + betax3_x1x2[3]*x2)

# The full data 
full_data <- data.frame(x1=x1, x2=x2, x3=x3)
pairs(full_data)

# Now generate missing data under MCAR,
#  response indicators are independent with prob of missingness p_mis

obs_data <- full_data

p_mis <- .1

mis_inds <- replicate(3, runif(n) < p_mis)

obs_data[mis_inds] <- NA

View(obs_data)

# Estimated means with observed data in each column
mu1 <- colMeans(obs_data, na.rm=TRUE)

# Mean imputation
imp_data <- mapply(
  function(clmn, obsmean){
    clmn[is.na(clmn)] <- obsmean 
    return(clmn)
    }, 
  obs_data, mu1)

class(imp_data)

imp_data <- as.data.frame(imp_data)

# What happens with regression coefficients?

# True values
betax3_x1x2

# Regress x3 on x1 and x2 based on the imputed data
lm_impdata <- lm(x3 ~ x1 + x2, data=imp_data)

# Regress x3 on x1 and x2 based on the complete cases
lm_cc <- lm(x3 ~ x1 + x2, data=obs_data) 
# same as using data=obs_data[complete.cases(obs_data),]

# Estimates based on imputed data
lm_impdata$coefficients

# Estimates based on complete cases
lm_cc$coefficients

# How about means?

# Mean imputation estimator of the mean of x3, mu_mimp
mean(imp_data$x3)

# And its naively estimated variance, var_naive_mimp
var(imp_data$x3)/n

# Compare with estimated variance based on observed values
var(obs_data$x3, na.rm=TRUE)/sum(!is.na(obs_data$x3))

# But these are results for a single realization of the data.
# We care about properties of these estimators over repeated sampling!


## Actual simulation study

# Sample size
n <- 1000

# Number of repetitions
reps <- 1000

# True betas 
betax2_x1 <- c(1,2)
betax3_x1x2 <- c(0, 1, 2)

# Missing data generated under MCAR, 
#  response indicators independent with prob of missingness p_mis
p_mis <- .1

# Matrices to store simulation results:
#  - three betas under mean imputation, three betas from complete cases
regression_results <- matrix(NA,reps,6)
#  - mean of x3, naive variance of mean, complete case var of mean
mean_results <- matrix(NA,reps,3)

colnames(regression_results) <- c("beta0_imp","beta1_imp","beta2_imp",
                                  "beta0_cc","beta1_cc","beta2_cc")

colnames(mean_results) <- c("mu_mimp","var_naive_mimp","var_ac")

for(rep in 1:reps){
  x1 <- rnorm(n)
  x2 <- rnorm(n, mean = betax2_x1[1] + betax2_x1[2]*x1)
  x3 <- rnorm(n, mean = betax3_x1x2[1] + betax3_x1x2[2]*x1 + betax3_x1x2[3]*x2)
  
  # The full data 
  full_data <- data.frame(x1=x1, x2=x2, x3=x3)
  
  # Now generate missing data under MCAR
  obs_data <- full_data
  mis_inds <- replicate(3, runif(n) < p_mis)
  obs_data[mis_inds] <- NA
  
  # Estimated means with observed data in each column
  mu1 <- colMeans(obs_data, na.rm=TRUE)
  # Mean imputation
  imp_data <- mapply(
    function(clmn, obsmean){
      clmn[is.na(clmn)] <- obsmean 
      clmn
    }, 
    obs_data, 
    mu1)
  
  imp_data <- as.data.frame(imp_data)
  
  # Regress x3 on x1 and x2 based on the imputed data
  lm_impdata <- lm(x3 ~ x1 + x2, data=imp_data)
  
  # Regress x3 on x1 and x2 based on the complete cases
  lm_cc <- lm(x3 ~ x1 + x2, data=obs_data)
  
  # Store beta estimates based on imputed data and complete cases
  regression_results[rep,] <- c(lm_impdata$coefficients, lm_cc$coefficients)
  
  # Mean imputation estimator of the mean of x3
  mu_mimp <- mean(imp_data$x3)

  # And its naively estimated variance
  var_naive_mimp <- var(imp_data$x3)/n

  # Compare with estimated variance based on obs values
  var_ac <- var(obs_data$x3, na.rm=TRUE)/sum(!is.na(obs_data$x3))
  
  mean_results[rep,] <- c(mu_mimp,var_naive_mimp,var_ac)
}

regression_results <- as.data.frame(regression_results)
mean_results <- as.data.frame(mean_results)

# mean imputation vs complete cases for beta0
summary(regression_results$beta0_imp)
summary(regression_results$beta0_cc)
betax3_x1x2[1]

# mean imputation vs complete cases for beta1
summary(regression_results$beta1_imp)
summary(regression_results$beta1_cc)
betax3_x1x2[2]

# mean imputation vs complete cases for beta2
summary(regression_results$beta2_imp)
summary(regression_results$beta2_cc)
betax3_x1x2[3]


# Let's put this in a format that facilitates plotting
beta1_results <- data.frame(
  val = c(regression_results$beta1_imp, regression_results$beta1_cc),
  method = c(rep("MeanImp",reps), rep("CC",reps)) )

beta2_results <- data.frame(
  val = c(regression_results$beta2_imp, regression_results$beta2_cc),
  method = c(rep("MeanImp",reps), rep("CC",reps)) )


# Let's create a plot
pdf("Lecture04_Simulation_betas.pdf",10,5)
par(mfrow=c(1,2))
boxplot(val~method, data=beta1_results, col=c("lightblue","pink"), main=expression(beta[1]))
abline(h=betax3_x1x2[2], col="red", lwd=4)
boxplot(val~method, data=beta2_results, col=c("lightblue","pink"), main=expression(beta[2]))
abline(h=betax3_x1x2[3], col="red", lwd=4)
dev.off()

# Check out the file
system(paste0('open "', getwd(), '/Lecture04_Simulation_betas.pdf"'))


# Results for the mean

# Simulation variance of mu_mimp (approximates true variance of mu_mimp)
var(mean_results$mu_mimp)
# Distribution of naively estimated variances
summary(mean_results$var_naive_mimp)
# Distribution of estimated variances from complete cases
summary(mean_results$var_ac)


# Let's put this in a format that's easy for plotting
mean3_results <- data.frame(
  val = c(mean_results$var_naive_mimp, mean_results$var_ac),
  method = c(rep("Naive var",reps), rep("AC var",reps)) )

# Let's create a plot
pdf("Lecture04_Simulation_estvarmean.pdf",5,5)
boxplot(val~method, data=mean3_results, col=c("lightblue","pink"), 
        main="Distribution of estimators of variance of mean")
abline(h=var(mean_results$mu_mimp), col="red", lwd=4)
dev.off()

# Check out the file
system(paste0('open "', getwd(), '/Lecture04_Simulation_estvarmean.pdf"'))


# Now it's your turn: re-run the simulation study using different values of 'betax2_x1'.
#  What is the impact on the estimation of 'betax3_x1x2'?




### Part 2: Hot-deck Methods with the VIM Package in R
## We'll show how to use
## - Traditional hot-deck method
## - k Nearest Neighbors method
## Source: 
## A. Kowarik and M. Templ.  Imputation with the R package VIM.
##     Journal of Statistical Software, 74(7):1-16, 2016.
##     https://www.jstatsoft.org/article/view/v074i07


install.packages("VIM")
install.packages("simFrame")
library("VIM")
data("eusilcP", package = "simFrame")

dim(eusilcP)
head(eusilcP)

# Create a smaller dataset
eusilcP1 <- eusilcP[eusilcP$age > 15 & eusilcP$age < 65, 
                    c("region", "gender", "hsize", "age", "eqIncome", "ecoStat",
                      "citizenship", "py010n", "py050n", "py090n")]

# Generate missing data for  "ecoStat", "citizenship", "py010n", "py050n", "py090n"
p_mis <- .1
eusilcP1[, c("ecoStat", "citizenship", "py010n", "py050n", "py090n")] <- 
  lapply(eusilcP1[, c("ecoStat", "citizenship", "py010n", "py050n", "py090n")], 
         function(x){ 
           x[runif(n) < p_mis] <- NA 
           x } )

View(eusilcP1)


## Traditional Hot-Deck imputation
# Sequential hot-deck imputation: the dataset is sorted according to some variables, 
# and missing values are imputed sequentially, that is, line by line

# The 'hotdeck' function
# - data: data frame or matrix, which contains the observed data 
# - variable: vector of variable names to be imputed.  All by default
# - ord_var: vector of variable names for sorting the rows
# - domain_var: vector of variable names for building domains and to impute within

system.time(
  eusilcP1_impHD <- VIM::hotdeck(eusilcP1, ord_var = c("eqIncome", "age", "hsize"), 
                            domain_var = c("region", "gender"))
)
View(eusilcP1_impHD)

# The variables used for 'ord_var' have to be fully observed!
system.time(
  eusilcP1_impHD2 <- VIM::hotdeck(eusilcP1, ord_var = c("ecoStat", "citizenship", "py010n", "py050n", "py090n"), 
                             domain_var = c("region", "gender"))
)
View(eusilcP1_impHD2)

# Andridge & Little (2010, Int. Stat. Rev.):
#  - General patterns of missingness are difficult to deal with
# If you have missing data in all of your variables, how do you sort?


## k Nearest Neighbors imputation
# Aggregation of the k nearest neighbors is used to imputed value. 
# The kind of aggregation and distance depends on the type of the variable.

# The 'kNN' function
# - dist_var: vector of variable names to be used for calculating the distances
# - weights: numeric vector containing a weight for each distance variable 
# - numFun: function for aggregating the k nearest neighbors for numerical variables
# - catFun: function for aggregating the k nearest neighbors for categorical variables, 

## DON'T RUN YET, try on a subset first!
#system.time(
#  eusilcP1_impNN <-  VIM::kNN(eusilcP1, 
#                         dist_var = c("eqIncome", "age", "hsize", "region", "gender"), 
#                         k = 1))
## In my laptop this took 276.51/60=4.6 minutes 
#View(eusilcP1_impNN)


### Summary
## Main take-aways from today's lecture:
# - Clear evidence of mean imputation being dangerous
# - Single imputation leads to overconfidence
# - Readily available software for variants of hot-deck imputation
## Next lecture:
# - Likelihood-based methods
# - How did Rubin come up with the MAR assumption??