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
train <- train[complete.cases(train[,"TARGET"]),] #去掉target中有NA的行
#run featrue engineering code

###统一train and test 阈值
#for (f in names(train)[3:65]) {
 # if (length(names(table(train[,f])))!=length(names(table(test[,f])))) {
 #   levels <- names(table(train[,f]))
 #   test[,f] <- factor(test[,f], levels=levels)
    
#  }
#}

train$TARGET <- as.character(train$TARGET)
train$TARGET <- as.factor(train$TARGET)

#train.data_1 <- na.omit(train.data) 去掉有NA的行

#train_impute <- rfImpute(TARGET~., data = train.data_1)
#describe(train.data_1)  #data describe
#sum(is.na(train.data_1))  # sum NA
#cols <- unlist(sapply(train.data_1,class))
#unique(cols)
#fn.fac=names(cols[cols=="factor"])
#fn.int=names(cols[cols=="integer"])

##抽样
row_1 <- which(train$TARGET=="1")
row_0 <- which(train$TARGET=="0")
samp_row <- sample(row_0,length(row_1)*3)
final.data <- train.data[c(row_1,samp_row),]


##
removeVars <- c("ID2")
train.data <- train[!colnames(final.data)%in%removeVars]
train.test <- test[!colnames(test)%in%removeVars]
cols <- unlist(sapply(final.data,class))
unique(cols)

fn.fac=names(cols[cols=="factor"])
fn.int=names(cols[cols=="integer"])
#fn.num=names(cols[cols=="numeric"])
#fn.cha=names(cols[cols=="character"])
class(final.data$TARGET)

#选取随机森林mtry值
n <- length(names(train.data))
set.seed(1234)
for (i in 1:(n-1)){
 model <- randomForest(TARGET~., data = train.data, mtry = i)
 err <- mean(model$err.rate)
 print(err)
}

#mtry=8
#选取ntree值
set.seed(1234)
model <- randomForest(TARGET~., data = train.data, mtry = 21, ntree=1000)
plot(model)
#ntree=400


set.seed(1234)
fit <- randomForest(TARGET~., data = train.data,type="classification", mtry = 21, ntree=400, 
                    importance = TRUE,proximity=TRUE)
print(fit)

#原数据集模型的准确率分析
pred1 <- predict(object = fit, newdata = train.data)
Freq1 <- table(pred1,train.data$TARGET)
Freq1
options()
sum(diag(Freq1))/sum(Freq1)
#模型的预测精度在90%以上


#变量重要性
Importance <- importance(x = fit)
Importance
varImpPlot(fit)


#新数据集的预测情况
pred2 <- predict(object = fit, newdata = train.test)
write.csv(data.frame('uid'=final.data[,"ID2"],'score'=pred),file='file/rondonforest.csv',row.names=F)




  