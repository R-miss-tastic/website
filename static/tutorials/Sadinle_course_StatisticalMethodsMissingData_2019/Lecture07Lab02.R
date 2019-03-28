#### Statistical Methods for Analysis with Missing Data
#### Lecture 7: R session 2
#### Mauricio Sadinle
#### Department of Biostatistics
#### University of Washington


### Part 1: Multinomial Example
## Simple example of the EM algorithm


# Clean your environment
rm(list=ls())

# Set a seed so you can reproduce all the results
set.seed(345)


## Generate data for two binary variables

# Sample size
n <- 1000

# True probabilities (pi11, pi21, pi12, pi22)
true_prob <- c(.4,.2,.1,.3)

# True odds ratio
oddsr <- function(vec){ 
  vec <- as.vector(vec)
  vec[1]*vec[4]/(vec[2]*vec[3])
  }
(true_oddsr <- oddsr(true_prob))

# Sample space
cells <- expand.grid(Z1=1:2,Z2=1:2)

# Select a sample 
cell_sample <- sample(nrow(cells), n, replace = TRUE, true_prob)
full_data <- cells[cell_sample,]

# Full data odds ratio
fulldata_table <- table(full_data)
(fulldata_oddsr <- oddsr(fulldata_table))

# Generate missingness
obs_data <- full_data
p_mis1 <- .5
mis_inds1 <- runif(n) < p_mis1
p_mis2_mis1 <- .5
p_mis2_obs1 <- .7
mis_inds2 <- runif(n) < (p_mis2_mis1*mis_inds1 + p_mis2_obs1*!mis_inds1)
obs_data[cbind(mis_inds1,mis_inds2)] <- NA


## EM algorithm under MAR
EM <- function(obs_data, init=NULL, tol=1e-10){
    
  obs_counts <- table(obs_data, useNA="always")
  
  locNA <- dim(obs_counts)  
  
  n11kl <- obs_counts[-locNA[1],-locNA[2]  ]
    
  n10kp <- obs_counts[-locNA[1],locNA[2]]  
  
  n01pl <- obs_counts[locNA[1],-locNA[2]]  
    
  n00pp <- obs_counts[locNA[1],locNA[2]]  
    
  # Starting point for EM  
  if(is.null(init)){
    prob_t <- matrix(c(.25,.25,.25,.25),2,2) 
  }else{  
    prob_t <- init  
  }  
    
  eps <- 1  
  iter <- 0  
    
  while(eps > tol){  
    prob_kp_t <- rowSums(prob_t)  
    prob_pl_t <- colSums(prob_t)  
      
    n_t <- n11kl +   
      outer(n10kp/prob_kp_t, n01pl/prob_pl_t, "+")*prob_t + 
      n00pp*prob_t  
      
    prob_tp1 <- n_t/n  
    eps <- max(abs(prob_tp1 - prob_t))  
    prob_t <- prob_tp1  
    iter <- iter+1  
  }  
    
  return(list(iter=iter, estprob=prob_t))  
}  

# Results of EM
EM_res <- EM(obs_data)
EM_res$iter


# Compare with complete cases
CC <- obs_data[complete.cases(obs_data),]
# CC estimated probabilities 
CC_prob <- table(CC)/nrow(CC)
# CC odds ratio
CC_oddsr <- oddsr(CC_prob)


# Comparison
round(EM_res$estprob,3)
round(CC_prob,3)
matrix(true_prob,2,2)

oddsr(EM_res$estprob)
CC_oddsr
true_oddsr


## HW2: under this setup, run simulation study to compare
##      estimators based on EM vs CC for the probabilities
##      and for the odds ratio


### Part 2: Estimating Variability via the Bootstrap

# We'll work with the obs_data constructed above
head(obs_data)
n <- nrow(obs_data)

# Selecting a single bootstrap sample is easy!
one_boot_indices <- sample(n,n,replace=TRUE)
one_boot_sample <- obs_data[one_boot_indices,]
head(one_boot_sample)

# EM algorithm applied to bootstrap sample
EM(one_boot_sample)

## Now select number of bootstrap replicates
nboot <- 500

# Select indices of all bootstrap samples
boot_indices <- replicate(nboot, sample(n,n,replace=TRUE))
dim(boot_indices)

# For each bootstrap sample, we need to run EM 
boot_probs <- apply(boot_indices, 2, 
                    function(x) as.vector( EM( obs_data[x,] )$estprob )
                    )
dim(boot_probs)

# 95% bootstrap confidence intervals for each probability
apply(boot_probs, 1, quantile, probs=c(.025,.975))
true_prob

# 95% bootstrap confidence intervals for odds ratio
boot_ORs <- apply(boot_probs,2,oddsr)
quantile(boot_ORs, probs=c(.025,.975))
true_oddsr

hist(boot_ORs,50)

### THE END