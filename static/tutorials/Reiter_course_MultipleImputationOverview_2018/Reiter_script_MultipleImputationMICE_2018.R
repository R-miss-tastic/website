### Multiple imputation of missing data with mice

## Example by Jerry Reiter for short course at Odum Institute, March 2018
## This script shows R commands for handling missing data using the mice package

#if you have not already, install the mice package with the following command (remove #)
#install.packages("mice")

#once you have mice installed, load it into memory using the command
library(mice)

#we illustrate the package with a simple data set from the mice package:
data(nhanes2)

dim(nhanes2)
summary(nhanes2)

#note that the age and hyp variables are already defined as factor variables in this dataset
#if you have a dataset with categorical variables without this pre-definition, you should make the variables factors before doing mice.
#for example, to make a variable called "var1" into a factor in some dataset called "thedata", type thedata$var1 = as.factor(thedata$var1)

#the "NA" values represent missing data

#let's look at the missing data pattern
md.pattern(nhanes2)

#let's look at some exploratory data analyses based on the complete cases
#first make the complete cases
ccnhanes2data = cc(nhanes2)
ccnhanes2data

#note that there are only 3 cases with hypertension = yes.  
#relationships will be hard to model accurately do to small sample size....
#we will use these data for illustration of the MI procedures. really we need more data to say anything meaningful about relationships among these variables.

plot(ccnhanes2data$bmi, x=ccnhanes2data$chl, xlab = "Cholesterol", ylab = "BMI", main = "Complete cases: bmi versus chl")
boxplot(ccnhanes2data$bmi ~ ccnhanes2data$age, xlab = "Age", ylab = "BMI", main = "Complete cases: bmi versus age")
boxplot(ccnhanes2data$bmi ~ ccnhanes2data$hyp, xlab = "Hypertensive", ylab = "BMI", main = "Complete cases: bmi versus hyp")

#let's create 5 multiple imputations for the missing values
#we will use normal linear regressions for continuous variables, logistic regressions for binary variables, 
#multinomial regressions for unordered categorical variables, and proportional odds models for ordered categorical variables.
#we have not discussed the last two models in this class, but they are popular models for these kinds of data.

nhanes2MI5 = mice(nhanes2, m=5, defaultMethod = c("norm", "logreg", "polyreg", "polr"))

#look at the first couple of completed datasets
d1 = complete(nhanes2MI5, 1)
d1

d2 = complete(nhanes2MI5, 2)
d2

# some imputation diagnostics
# plot imputed and observed continuous variables

stripplot(nhanes2MI5, col=c("grey",mdc(2)),pch=c(1,20))

#grey dots are observed values and red dots are imputed values
#no evidence of problematic imputations for these variables

#if you just want to see one continuous variable, say bmi, use
#stripplot(nhanes2MI5, bmi~.imp, col=c("grey",mdc(2)),pch=c(1,20))

#also can do plots by values of categorical variable, say bmi by age grouping

stripplot(nhanes2MI5, bmi~.imp|age, col=c("grey",mdc(2)),pch=c(1,20))

#also can plot all the imputations in one plot to see relationships   stripplot(nhanes2MI5, bmi~chl|age, col=c("grey",mdc(2)),pch=c(1,20))

#scatter plots of bmi and chl by age
stripplot(nhanes2MI5, bmi~chl|age, col=c("grey",mdc(2)),pch=c(1,20))

#dot plots of bmi by hyp by age 
stripplot(nhanes2MI5, bmi~hyp|age, col=c("grey",mdc(2)),pch=c(1,20))

#no obvious problems with the imputations from these plots
#also can try posterior predictive checks. let's append the data and make replicates

nhanes2ppcheck = rbind(nhanes2, nhanes2)

#check to make sure we've done what we intended
nhanes2ppcheck

#now blank every value in 3 variables with missing values
nhanes2ppcheck[26:50, 2:4] = NA
nhanes2ppcheck

#run the MI software on the completed data
nhanes2MI5ppcheck = mice(nhanes2ppcheck, m=5, defaultMethod = c("norm", "logreg", "polyreg", "polr"))

#get the completed datasets -- in the interest of time look at first two datasets
d1ppcheck = complete(nhanes2MI5ppcheck, 1)
d2ppcheck = complete(nhanes2MI5ppcheck, 2)

#let's graph histograms of bmi for each of the datasets
par(mfcol=c(2,1))
hist(d1ppcheck$bmi[1:25], xlab = "BMI", main = "BMI completed data")
hist(d1ppcheck$bmi[26:50], xlab = "BMI", main = "BMI replicated data")
 
hist(d2ppcheck$bmi[1:25], xlab = "BMI", main = "BMI completed data")
hist(d2ppcheck$bmi[26:50], xlab = "BMI", main = "BMI replicated data")
 
#also can use scatter plots to check relationship between variables

plot(d2ppcheck$bmi[1:25]~d2ppcheck$chl[1:25], ylab = "BMI", xlab = "Cholesterol", main = "BMI vs Chl completed data")
plot(d2ppcheck$bmi[26:50]~d2ppcheck$chl[26:50], ylab = "BMI", xlab = "Cholesterol", main = "BMI vs Chl replicated data")
 
#looks pretty similar!  no evidence that imputation models are poorly specified for what we want to do 

## now to estimate a regression using the completed datasets
#to do model specification, i.e., transformations, either look at the complete cases or use one of the completed datasets.
#for example, to use the first dataset d1 in a regression of bmi on age, hyp and chl, use

bmiregd1 = lm(bmi~age+hyp+chl, data = d1)

#to check residuals, you can examine the fit of the model in one or more completed datasets
#any transformations will have to apply to all the datasets, so don't be too dataset-specific in your checks.

plot(bmiregd1$residual, x = d1$chl, xlab = "Cholesterol", ylab = "Residual")
abline(0,0)
boxplot(bmiregd1$residual ~ d1$age, xlab = "Age", ylab = "Residual")
boxplot(bmiregd1$residual ~ d1$hyp, xlab = "Hypertension", ylab = "Residual")

#pretty reasonable residual plots.
#good idea to repeat for more than one completed dataset.
#if you decide transformations are needed, you might reconsider the imputation models too and fit them with transformed values.

#if you want to do multiple imputation inferences on all m=5 data sets, use the with command.
#example:  fit a linear regression of bmi on age + hyp + chl

bmiregMI5 = with(data=nhanes2MI5, lm(bmi~age+hyp+chl))
summary(bmiregMI5)

#to get the multiple imputation inferences based on the Rubin (1987) combining rules -- see the slides -- use the pool command
bmireg = pool(bmiregMI5)
summary(bmireg)

#if you want to do a nested F test (well, technically a test that is asymptotically equivalent to a nested F test), then use pool.compare 
#suppose we want to see if age is a useful predictor.  have to redo the with-age regression to have age as the last predictor

bmiregMI5 = with(data=nhanes2MI5, lm(bmi~hyp+chl+age))
bmiregMI5noage = with(data=nhanes2MI5, lm(bmi~hyp+chl))
pool.compare(bmiregMI5, bmiregMI5noage)

#you also can fit logistic regressions.  For example to predict hypertension from all the other variables, use
hyplogregMI5 = with(data=nhanes2MI5, glm(hyp~bmi+chl+age, family = binomial))
hyplogreg = pool(hyplogregMI5)
summary(hyplogreg)

#this turns out to be problematic because we have some logistic regressions with perfect predictions.  
#We do not have enough data to do a meaningful logistic regression here, unless we drop age as a predictor.  But the command structure is fine. 



