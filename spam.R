## Fundamentals of Text Analytics 

## Write a program that reads in a text file, and outputs the top 10 most occuring words in that file.
## Text mining, text document, natural language processing, text analytics. 
## The subject is very very broad. 
## This is useful in industry 
## Clustering and Predictive Classification Models 
## Know 20% of the useful models that is used in 80% of the projects.
## Decision trees ensembles : Random Forest Algorithms (Relatively simple and relatively powerful)
## Or SVMachine

## We will use spam.csv and copy in the csv file


## Install all required packages 

install.packages(c("caret", "randomForest", "quanteda", "irlba"))
library(caret)
library(randomForest)
library(quanteda)
library(irlba)

spam.raw <- read.csv("spam.csv", stringsAsFactors = FALSE)
View(spam.raw)
spam.raw <- spam.raw[ , 1:2] 
names(spam.raw) <- c("Label", "Text")
View(spam.raw)

#Check data to see if there are missing values. 

length(which(!complete.cases(spam.raw)))

## Convert our class label into a factor 
## Ditribution of Labels 

spam.raw$Label <- as.factor(spam.raw$Label)   ## helpful for plotting
table(spam.raw$Label)/nrow(spam.raw)

## 
spam.raw$Textlength <- nchar(spam.raw$Text)

len = NULL 
for (i in 1:nrow(spam.raw)){
        if (i != 6)
            len = c(len, nchar(spam.raw$Text[i]))
}

## demo 

mytext = c("This","is","a","test","for","count","of","the","words","The","words","have","been","written","very","randomly","so","that","the","test","can","be","for","checking","the","count")
table(mytext)
sort(table(mytext), decreasing = T)[1:10]

### Spliting the text into work is called "tokenization" : seq of words











     