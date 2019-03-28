#### Statistical Methods for Analysis with Missing Data
#### Lecture 14: R session 4
#### Mauricio Sadinle
#### Department of Biostatistics
#### University of Washington


### Previous Lecture
##  Very broad introduction to
##  - Estimating equations
##  - Generalized estimating equations
##  - Weighted generalized estimating equations (under dropout)


### Today's Lecture: R session 4
##  - The 'wgeesel' R package


## For the set-up of this session, see 'Lecture14wgeesel.pdf'



### Part 1: Code from the 'wgeesel' Tutorial

rm(list=ls())

#install.packages("wgeesel")
library(wgeesel)

data(imps)

dim(imps)

head(imps)

?imps

## IMPS item 79, severity of illness
# 1 = normal
# 2 = borderline mentally ill
# 3 = mildly ill
# 4 = moderately ill
# 5 = markedly ill
# 6 = severely ill
# 7 = among the most extremely ill

library(mice) # just for 'md.pattern' function

md.pattern(imps)

table(imps$R, imps$Week)

head( imps[is.na(imps$IMPS79),] )

imps_new <- imps
imps_new$subject <- imps$ID
imps_new$lag1y <- ylag(imps$ID,imps$Y,1) #create lagged y(t-1)
imps_new$lag2y <- ylag(imps$ID,imps$Y,2,na=F) #create lagged y(t-2)I(t>2)
imps_new$lag3y <- ylag(imps$ID,imps$Y,3,na=F) #create lagged y(t-3)I(t>3)

fit <- wgee(model = Y~Time+Sex+Drug+Time:Sex+Sex:Drug+Drug:Time,
            data = imps_new,
            id = imps_new$ID,
            family="binomial",
            corstr ="ar1",
            scale = NULL,
            mismodel = R~Drug+Time+Sex+lag1y+lag2y+lag3y)

summary(fit)

summary(fit$mis_fit)

QICW.gee(fit)



### Part 2: Time-Specific Response Models using 'wgeesel'

imps_new2 <- imps_new
imps_new2$Week <- as.factor(imps_new2$Week)

fit2 <- wgee(model = Y ~ Week + Week:Sex + Week:Drug, 
            data = imps_new2,
            id = imps_new$ID,
            family="binomial",
            corstr ="ar1",
            scale = NULL,
            mismodel = R~Drug+Time+Sex+lag1y+lag2y+lag3y)

summary(fit2)

summary(fit2$mis_fit)


### Summary
## Main take-aways from today's lecture:
# - The 'wgeesel' R package is currently the most 
#   comprehensive implementation of WGEEs in R
## Next lecture:
# - Identifiability, nonignorable missing data 