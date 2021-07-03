library(ISLR)
rm(list = ls())
View(Auto)
names(Auto)
dim(Auto)
which(is.na(Auto) == T)
attach(Auto)
pairs(Auto)

plot(displacement, horsepower)

#### Applied 

## 8. College.csv

College <- read.csv("/Users/srahman/Downloads/College.csv", row.names = 1)
View(College)

names(College)[1] <- "College"
names(College)

summary(College)
attach(College)

pairs(College[,1:10])
plot(Top10perc, Top25perc)

boxplot(Outstate ~ Private)

Elite <- rep("No", nrow(College))
Elite[Top10perc > 50] <- "Yes"
Elite <- as.factor(Elite)
College <- data.frame(College, Elite)

summary(Elite)
boxplot(Outstate ~ Elite, col = c("yellow", "lavender"))

par(mfrow = c(2,2))
hist(Outstate)
hist(Top10perc)
hist(Top25perc)
hist(Grad.Rate)


###. 9. Auto data 

names(Auto)
summary(Auto)
pairs(Auto)

## 10. Boston data 
library(MASS)
dim(Boston)

## b) Make some pairwise scatterplots of the predictors in this data. 
pairs(Boston)
names(Boston)
?Boston
attach(Boston)


###c) Predictors associated with per capita crime rate 

abs(cor(Boston)[1,])

plot(crim, tax)


## d) High crime rates, tax areas and ptratios. 
par(mfrow = c(1,1))
D <- data.frame(crim, tax, ptratio)
boxplot(scale(D, center = T, scale = T))

sum(crim > 1)

##e) num of suburbs in the datasets bound the Charles river
sum(chas == 1)

##f) Which suburb of Boston has lowest median value of owner occupied homes? 
## What are the values of the other predictors for that suburb? 
## How do those values compared to the overall ranges for those predictors?

which.min(medv)
Boston[which.min(medv), ]


hist(crim)
points(Boston[which.min(medv), ], pch = 19, col = "red")

## plot()
## contour() 3-D
## image()   heatmap


