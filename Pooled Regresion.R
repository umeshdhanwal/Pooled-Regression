library("plm")

## example of unobserved heterogeneity

x1 <- rnorm(100,1,1)
x2 <- rnorm(100,2,1)

e1 <- rnorm(100,0,0.8)
e2 <- rnorm(100,0,0.8)

y1 <- 0 - x1 + e1
y2 <- 5 - x2 + e2

x <- append(x1,x2)
y <- append(y1,y2)

plot(y~x)

reg.pooled <- lm(y~x)
reg.1 <- lm(y1~x1)
reg.2 <- lm(y2~x2)

abline(reg.pooled)
abline(reg.1, col="red")
abline(reg.2, col="red")

## Basic Panel Data models in R ##

library(foreign)

BESData <- read.dta("bes.dta",  convert.factors=FALSE)

install.packages("plm")
library(plm)

pdim(BESData, index=c("serialno", "year"))

## Using the plm package ##
##Pooled Regression
pmodel1 <- plm(right ~ manual + age + male + price + tory + labour, data=BESData, index=c("serialno", "year"), na.action=na.omit, model="pooling")
summary(pmodel1)