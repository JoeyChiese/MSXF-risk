# load data
library(randomForest)
library(Hmisc)
library(timeDate)
library(fBasics)
library(ggplot2)
library(corrplot)
library(e1071)
library(gdata)


setwd("C:/Users/yunbin.jiang/Desktop/data")
original.train <- read.csv("development_sample.csv") 
original.test <- read.csv("assessment_sample.csv")

train <- original.train
test <- original.test

##feature engineering
train <- train[complete.cases(train[,"TARGET"]),] #remove the TARGET na ROW
source("feature engineering.R")

removeVars <- c("ID2")
train.data <- train[!colnames(train)%in%removeVars]
train.test <- test[!colnames(test)%in%removeVars]


train.data$TARGET <- as.character(train.data$TARGET)
train.data$TARGET <- as.factor(train.data$TARGET)

#class(train$TARGET)
##sample data
row_1 <- which(train.data$TARGET=="1")
row_0 <- which(train.data$TARGET=="0")
samp_row <- sample(row_0,length(row_1)*3)
final.data <- train.data[c(row_1,samp_row),]


#choose the best mtry
n <- length(names(final.data))
set.seed(1234)
for (i in 1:(n-1)){
 model <- randomForest(TARGET~., data = final.data, mtry = i)
 err <- mean(model$err.rate)
 print(err)
}

#mtry=18 model has the min average error 

set.seed(1234)
model <- randomForest(TARGET~., data = final.data, mtry = 18, ntree=1000)
plot(model)
#ntree=400 The error in the model is basically stable, so choose ntree=400


set.seed(1234)
fit <- randomForest(TARGET~., data = final.data,type="classification", mtry = 18, ntree=400, 
                    importance = TRUE,proximity=TRUE)
print(fit)

#prediction
pred1 <- predict(object = fit, newdata = final.data)
Freq1 <- table(pred1,final.data$TARGET)
Freq1
options(scipen = 20)
sum(diag(Freq1))/sum(Freq1)
#The prediction precision is above 90% 


#important vars
Importance <- importance(x = fit)
Importance
varImpPlot(fit)


#predict test
pred2 <- predict(object = fit, newdata = train.test)
write.csv(data.frame('ID2'=final.data[,"ID2"],'score'=pred),file='file/rondonforest.csv',row.names=F)



# predict probabilities
pred=predict(model,final.data)

#average error
err <-mean(as.numeric(pred >0.5) != final.data$TARGET)
print(paste("train-error=", err))

#KS
library(ROCR)
pred1 <- prediction(pred, final.data$TARGET)
perf <- performance(pred1,"tpr","fpr")

##KS
max(attr(perf,'y.values')[[1]]-attr(perf,'x.values')[[1]])
plot(perf)

##AUC
auc = performance(pred1,"auc")
auc = unlist(slot(auc, "y.values"))


# predict probabilities
pred=predict(model,train.test)



  