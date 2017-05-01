#Title:'xgboost model'
#Author:'yunbin.jiang', EnglishName:Joey.
#Date: '30 April 2017'

#load packages
library(Hmisc)
library(timeDate)
library(fBasics)
library(ggplot2)
library(corrplot)
library(e1071)
library(gdata)
library(Matrix)
library(xgboost)


setwd("C:/Users/yunbin.jiang/Desktop/data")
original.train <- read.csv("development_sample.csv") 
original.test <- read.csv("assessment_sample.csv")

train <- original.train
test <- original.test

##feature engineering
train <- train[complete.cases(train[,"TARGET"]),] #去掉target中有NA的行
source("feature engineering.R")

removeVars <- c("ID2")
train.data <- train[!colnames(train)%in%removeVars]
train.test <- test[!colnames(test)%in%removeVars]
#dim(train.dada)

describe(train.data)  #data describe
#sum(is.na(train.data))  # sum NA
cols <- unlist(sapply(train.data,class))
unique(cols)
fn.fac=names(cols[cols=="factor"])
fn.int=names(cols[cols=="integer"])



# create dummy variables
train_x<-subset(train.data,select = -TARGET)
train_y<-as.vector(subset(train.data,select = TARGET))

test_x<-train.test

sparse_train_x<- sparse.model.matrix(~.-1, data = train_x)
sparse_test_x<-sparse.model.matrix(~.-1, data = test_x)

dtrain=xgb.DMatrix(sparse_train_x,label=train_y$TARGET)
dtest= xgb.DMatrix(sparse_test_x)

# fit xgboost model
model=xgb.train(booster='gbtree',
                objective='binary:logistic',
                scale_pos_weight=8.7,
                gamma=0,
                lambda=700,
                subsample=0.7,
                colsample_bytree=0.30,
                min_child_weight=5,
                max_depth=8,
                eta=0.02,
                data=dtrain,
                nrounds=1000,
                metrics='auc',
                nthread=8)

# predict probabilities
pred=predict(model,dtest)

write.csv(data.frame('uid'=test[,"ID2"],'score'=pred),file='pred2.csv',row.names=F)
#average error

err <-mean(as.numeric(pred >0.5) != train.data$TARGET)
print(paste("train-error=", err))

# save model to binary local file
xgb.save(model, "xgboost.model")

# load binary model to R
bst2 <- xgb.load("xgboost.model")
pred2 <- predict(bst2, test$data)

#View feature importance/influence fromthe learnt model
importance_matrix <- xgb.importance(model = model)
print(importance_matrix)
xgb.plot.importance(importance_matrix = importance_matrix)     
