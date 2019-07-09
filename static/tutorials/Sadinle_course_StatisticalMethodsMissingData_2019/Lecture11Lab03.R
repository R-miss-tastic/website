#### Statistical Methods for Analysis with Missing Data
#### Lecture 11: R session 3
#### Mauricio Sadinle
#### Department of Biostatistics
#### University of Washington

rm(list=ls())


### Part 1: Gibbs Sampling
## Sampling from Bhattacharyya's Distribution

# Specify some parameters M for this distribution.
# Note that M[1,1] is m00 in the slides of Lecture 9,
#   so this is the proportionality constant,
#   which is not needed for Gibbs sampling

M <- matrix(
  c(   0, 4, -1/2,
       4, 0,    0,
    -1/2, 0, -1/2 ), 3, 3, byrow = TRUE)


# Contour plots of the density (up to a proportionality constant)

propto_fXY <- function(x,y) exp( t(c(1, x, x^2)) %*% M %*% c(1, y, y^2) )

xgrid <- seq(-1, 7, length.out = 100)

fval <- outer(xgrid, xgrid, Vectorize(propto_fXY))

contour(xgrid, xgrid, fval, nlevels=10, labels="")


# Function that implements the Gibbs sampler for
#   the Bhattacharyya's distribution
# Input:
#   M: parameters, M[1,1] ignored
#   niter: number of required iterations of Gibbs sampler
#   init: starting value of Gibbs sample, (0,0) by default

Gibbs_Bhatta <- function(M, niter, init=c(0,0)) {

  draws <- matrix(nrow = niter, ncol = 2)

  draws[1, ] <- init
  
  x <- init[1]
  y <- init[2]

  for (i in 2:niter) {
    
    # Draw new X given previous Y 
    
    # Var(X|y)
    varX_y <- -0.5/(M[3,1] + M[3,2]*y + M[3,3]*y^2) 
    
    # E(X|y)
    mX_y <- varX_y*(M[2,1] + M[2,2]*y + M[2,3]*y^2) 
    
    # X|y ~ Normal( mX_y, varX_y )
    x <- rnorm(1, mX_y, sqrt(varX_y))
    

    # Draw new Y given previous X

    # Var(Y|x)
    varY_x <- -0.5/(M[1,3] + M[2,3]*x + M[3,3]*x^2)
    
    # E(Y|x)
    mY_x <- varY_x*(M[1,2] + M[2,2]*x + M[3,2]*x^2)

    # Y|x ~ Normal( mY_x, varY_x )
    y <- rnorm(1, mY_x, sqrt(varY_x))
    
    draws[i, ] <- c(x, y)
  }
  
  draws
}

niter <- 1000
set.seed(132)
Gibbs_draws <- Gibbs_Bhatta(M, niter, init=c(7,7))
points(Gibbs_draws, col="blue")

# Trace plots
plot(Gibbs_draws[,1])
plot(Gibbs_draws[,2])

# High density regions reached very quickly
#   Take the first few iterations as "burn-in" (discard them)


# Just for fun, let's check the evolution of the Gibbs sampler

contour(xgrid, xgrid, fval, nlevels=10, labels="")

for(t in 2:50){
  Sys.sleep(2/t)
  # Change in y
  points(x=Gibbs_draws[c(t-1,t),1], y=Gibbs_draws[c(t-1,t-1),2], type="l", col="red")
  Sys.sleep(2/t)
  # Change in x
  points(x=Gibbs_draws[c(t,t),1], y=Gibbs_draws[c(t-1,t),2], type="l", col="red")
  Sys.sleep(1)
  # Re-draw points sampled thus far
  contour(xgrid, xgrid, fval, nlevels=10, labels="")
  points(x=Gibbs_draws[1:t,1], y=Gibbs_draws[1:t,2], col="red")
}



### Part 2: Proper Multiple Imputation Under Multivariate Normal
## The 'norm' package in R
## Based on https://cran.r-project.org/web/packages/norm/norm.pdf

#install.packages("norm")
library(norm)

# Toy data in the 'norm' package
data(mdata)
head(mdata)
dim(mdata)

# Preliminary manipulations required by package
s  <-  prelim.norm(mdata)


# Remember that proper multiple imputation requires 
# a) sampling from the posterior of the model parameters given observed data
# b) sampling imputed data from dist. of missing data given model param. and obs. data
# where a) can be done via Data Augmentation

# Data Augmentation requires starting value, in this case
#   taken to be result of EM algorithm
thetahat <- em.norm(s)

# Data Augmentation 
rngseed(1234567)   #set random number generator seed
theta <- da.norm(s, start=thetahat,
                 steps=100,     # number of iteration of DA
                 showits=TRUE)  # print iteration numbers

getparam.norm(s, theta) # returns a list of parameters on the original scale

# Get one imputation based on 'theta'
mdata_imp <- imp.norm(s, theta, mdata)
mdata_imp


# Note that the 'da.norm' function only outputs the value of the last iteration.
#   We could obtain the iterations of the DA algorithm as follows

niter <- 100
theta_chain <- matrix(NA,niter,length(theta))
theta_chain[1,] <- thetahat
                              
for (iter in 2:niter){
  theta_chain[iter,] <- da.norm(s, 
                                start=theta_chain[iter-1,],
                                steps=1)
}

# Example of trace plot 
plot(theta_chain[,20])

# Note that parameters need to be transformed back
#   to original scale using 'getparam.norm'


# Let's now obtain m completed datasets
m <- 50
MI_data <- list()
for(ds in 1:m){
  theta <- da.norm(s, start=thetahat,
                   steps=100,     # number of iteration of DA
                   showits=FALSE)  # print iteration numbers
  
  # Get one imputation based on 'theta'
  mdata_imp <- imp.norm(s, theta, mdata)
  MI_data[[ds]] <- mdata_imp
}

# Let's say we care about the normal linear model: inc ~ ageh + agew + edu
MI_models <- lapply(MI_data, 
       function(x) 
         lm(formula=inc~ageh+agew+edu, data=as.data.frame(x))
       )

# Extract MLEs with 'coef'
MLEs <- t(sapply(MI_models, coef))

# Extract estimated covariances of MLEs with 'vcov'
estVars <- t(sapply(MI_models, vcov))

# Rubin's MI point estimate
point_est <- colMeans(MLEs)

# Rubin's MI covariance estimate
var_ests <- var(MLEs)
mean_estVars <- colMeans(estVars)
est_vcov <- mean_estVars + (1+1/m)*as.numeric(var_ests)
est_vcov <- matrix(est_vcov , 4, 4)


# Final comment: even though this approach relies on multivariate normality, 
#   it is fairly popular.  For example, in Harel et al (2018, AJE) they argue
#   that violations of normality might not be too much of a concern in many
#   cases, but indicate that MICE might be a better choice if one cares about
#   imputed values being in the appropriate range. 
# See: dx.doi.org/10.1093/aje/kwx349



### Part 3: Multivariate Imputation by Chained Equations
## The 'mice' package in R
## Based on  van Buuren and Groothuis-Oudshoorn (2011)
## https://www.jstatsoft.org/article/view/v045i03/v45i03.pdf


#install.packages("mice")
library(mice)

# Toy data from the National Health and Nutrition Examination Survey
data(nhanes)
dim(nhanes)
head(nhanes)
str(nhanes)

nhanes$age <- as.factor(nhanes$age)
nhanes$hyp <- as.factor(nhanes$hyp)

# Summarize response patterns 
md.pattern(nhanes)
#   1st column: number of rows with that response patt.
#   Last colmn: number of missing entries in that patt.
#   Last row: number of rows with missingness in that col.


# Creating imputations
imp <- mice(nhanes, 
            m = 5, # default number of imputations
            method = c("","norm","logreg","norm"), 
            maxit = 50, # iterations per run
            seed = 23109)

# method(s): none (""), normal linear model ("norm"), logistic regression ("logreg")
#   other methods are available, see ?mice

class(imp) # mids: multiply imputed dataset

print(imp)

# PredictorMatrix: rows correspond to incomplete target variables.
#   Ones indicate the column variables used as a predictors
#   to impute the row variable.  Can be changed with 
#   'predictorMatrix' argument in mice()


# Imputations are stored on a per-variable basis 
#   rows: observations with missingness in that column
#   columns: separate imputations
imp$imp

# Monitor convergence of the pseudo-Gibbs sampler
plot(imp)

# Obtain the different completed datasets
# First one:
complete(imp,1)
# Third one:
complete(imp,3)


# How to analyze your multiply imputed datasets?

# 'with' each completed dataset, we want to run
#   a linear regression, for example
fit <- with(imp, lm(chl ~ age + bmi))

class(fit) # mira: multiply imputed repeated analysis

# The results of the different analyses
print(fit)

# Let's combine them using Rubin's rules
pool_fit <- pool(fit)

class(pool_fit) # mipo: multiple imputed pooled outcomes

round(summary(pool_fit), 2)

# fmi: fraction of missing information as defined in Rubin (1987, p. 93) 
# lambda: proportion of the total variance attributable to the missing data


# Note that m=5 leads to too much Monte Carlo error, but we can use a larger m
imp50 <- mice(nhanes, m = 50, 
              method = c("","norm","logreg","norm"), 
              maxit = 100, seed = 23109, print=FALSE)
fit <- with(imp50, lm(chl ~ age + bmi))
round(summary(pool(fit)), 2)


# Issues not covered here:
#   - Functions of variables: interactions, polinomial terms
#   - Selecting predictors for each model
# See van Buuren and Groothuis-Oudshoorn (2011) for details.

# Regarding the unrelated conditional models used in MICE:
# "It is not yet clear what the consequences of incompatibility 
#    are on the quality of the imputations" (van Buuren and Groothuis-Oudshoorn, 2011)

# Other MICE-related references
#   - The 'mi' R package: http://www.stat.columbia.edu/~gelman/research/published/mipaper.pdf
#   - Raghunathan et al (2001): https://www150.statcan.gc.ca/n1/en/pub/12-001-x/2001001/article/5857-eng.pdf?st=6HKI46qF 
