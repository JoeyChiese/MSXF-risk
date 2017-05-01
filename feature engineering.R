
#handle missing data and feature angineering
#table(train$COMPFIELD)
train$COMPFIELD[is.na(train$COMPFIELD)] <- -1
test$COMPFIELD[is.na(test$COMPFIELD)] <- -1

train$MNTH_SINCE_LAST_APP_R<- as.factor(ifelse(train$MNTH_SINCE_LAST_APP_R== "6-12","6-12",
                                    ifelse(train$MNTH_SINCE_LAST_APP_R== "5","5",
                                           ifelse(train$MNTH_SINCE_LAST_APP_R== "4","4",
                                                  ifelse(train$MNTH_SINCE_LAST_APP_R== "3","3",
                                                         ifelse(train$MNTH_SINCE_LAST_APP_R== "2","2",
                                                                ifelse(train$MNTH_SINCE_LAST_APP_R== "1","1",  
                                                                       ifelse(train$MNTH_SINCE_LAST_APP_R== ">=12",">=12","-1"))))))))    
test$MNTH_SINCE_LAST_APP_R<- as.factor(ifelse(test$MNTH_SINCE_LAST_APP_R== "6-12","6-12",
                                     ifelse(test$MNTH_SINCE_LAST_APP_R== "5","5",
                                            ifelse(test$MNTH_SINCE_LAST_APP_R== "4","4",
                                                   ifelse(test$MNTH_SINCE_LAST_APP_R== "3","3",
                                                          ifelse(test$MNTH_SINCE_LAST_APP_R== "2","2",
                                                                 ifelse(test$MNTH_SINCE_LAST_APP_R== "1","1",  
                                                                        ifelse(test$MNTH_SINCE_LAST_APP_R== ">=12",">=12","-1"))))))))     




train$COMPSTAFFQNTY<- as.factor(ifelse(train$COMPSTAFFQNTY==">50", ">50",
                             ifelse(train$COMPSTAFFQNTY== "1","1",
                                    ifelse(train$COMPSTAFFQNTY== "2-50","2-50","-1"))))
test$COMPSTAFFQNTY<- as.factor(ifelse(test$COMPSTAFFQNTY==">50", ">50",
                            ifelse(test$COMPSTAFFQNTY== "1","1",
                                   ifelse(test$COMPSTAFFQNTY== "2-50","2-50","-1"))))


train$APPWPERIOD_R2<- as.factor(ifelse(train$APPWPERIOD_R2=="4-5", "4-5",
                             ifelse(train$APPWPERIOD_R2== "2-3","2-3",
                                    ifelse(train$APPWPERIOD_R2== "1","1",
                                           ifelse(train$APPWPERIOD_R2== "0","0",
                                                  ifelse(train$APPWPERIOD_R2== ">5",">5", "-1"))))))
test$APPWPERIOD_R2<- as.factor(ifelse(test$APPWPERIOD_R2=="4-5", "4-5",
                            ifelse(test$APPWPERIOD_R2== "2-3","2-3",
                                   ifelse(test$APPWPERIOD_R2== "1","1",
                                          ifelse(test$APPWPERIOD_R2== "0","0",
                                                 ifelse(test$APPWPERIOD_R2== ">5",">5", "-1"))))))


train$APPCHILDQNTY<- as.factor(ifelse(train$APPCHILDQNTY=="9", "9",
                            ifelse(train$APPCHILDQNTY== "8","8",
                                   ifelse(train$APPCHILDQNTY== "13","13",
                                          ifelse(train$APPCHILDQNTY== "11","11",
                                                 ifelse(train$APPCHILDQNTY== "10","10", 
                                                        ifelse(train$APPCHILDQNTY== "1-3","1-3",
                                                               ifelse(train$APPCHILDQNTY== "0","0", 
                                                                      ifelse(train$APPCHILDQNTY== ">3",">3","-1")))))))))
test$APPCHILDQNTY<- as.factor(ifelse(test$APPCHILDQNTY=="9", "9",
                           ifelse(test$APPCHILDQNTY== "8","8",
                                  ifelse(test$APPCHILDQNTY== "13","13",
                                         ifelse(test$APPCHILDQNTY== "11","11",
                                                ifelse(test$APPCHILDQNTY== "10","10", 
                                                       ifelse(test$APPCHILDQNTY== "1-3","1-3",
                                                              ifelse(test$APPCHILDQNTY== "0","0", 
                                                                     ifelse(test$APPCHILDQNTY== ">3",">3","-1")))))))))




train$DIF_INCOME_LAST_180DAY_R<- as.factor(ifelse(train$DIF_INCOME_LAST_180DAY_R=="500-1000", "500-1000",
                                        ifelse(train$DIF_INCOME_LAST_180DAY_R=="1000-5000","1000-5000",
                                               ifelse(train$DIF_INCOME_LAST_180DAY_R=="100-500","100-500",
                                                      ifelse(train$DIF_INCOME_LAST_180DAY_R=="0-100","0-100", 
                                                             ifelse(train$DIF_INCOME_LAST_180DAY_R=="0","0",  
                                                                    ifelse(train$DIF_INCOME_LAST_180DAY_R==">5000",">5000","-1")))))))
test$DIF_INCOME_LAST_180DAY_R<- as.factor(ifelse(test$DIF_INCOME_LAST_180DAY_R=="500-1000", "500-1000",
                                        ifelse(test$DIF_INCOME_LAST_180DAY_R=="1000-5000","1000-5000",
                                               ifelse(test$DIF_INCOME_LAST_180DAY_R=="100-500","100-500",
                                                      ifelse(test$DIF_INCOME_LAST_180DAY_R=="0-100","0-100", 
                                                             ifelse(test$DIF_INCOME_LAST_180DAY_R=="0","0",  
                                                                    ifelse(test$DIF_INCOME_LAST_180DAY_R==">5000",">5000","-1")))))))


train$DIF_RESPERIOD_LAST_180DAY_R<- as.factor(ifelse(train$DIF_RESPERIOD_LAST_180DAY_R=="0-5", "0-5",
                             ifelse(train$DIF_RESPERIOD_LAST_180DAY_R== "0","0",
                                    ifelse(train$DIF_RESPERIOD_LAST_180DAY_R== ">5",">5","-1"))))
test$DIF_RESPERIOD_LAST_180DAY_R<- as.factor(ifelse(test$DIF_RESPERIOD_LAST_180DAY_R=="0-5", "0-5",
                                           ifelse(test$DIF_RESPERIOD_LAST_180DAY_R== "0","0",
                                                  ifelse(test$DIF_RESPERIOD_LAST_180DAY_R== ">5",">5","-1"))))

train$DIF_PERIOD_LAST_180DAY_R<- as.factor(ifelse(train$DIF_PERIOD_LAST_180DAY_R=="1-3", "1-3",
                                           ifelse(train$DIF_PERIOD_LAST_180DAY_R== "0-1","0-1",
                                                  ifelse(train$DIF_PERIOD_LAST_180DAY_R== "0","0",
                                                         ifelse(train$DIF_PERIOD_LAST_180DAY_R== ">3",">3", "-1")))))
test$DIF_PERIOD_LAST_180DAY_R<- as.factor(ifelse(test$DIF_PERIOD_LAST_180DAY_R=="1-3", "1-3",
                                        ifelse(test$DIF_PERIOD_LAST_180DAY_R== "0-1","0-1",
                                               ifelse(test$DIF_PERIOD_LAST_180DAY_R== "0","0",
                                                      ifelse(test$DIF_PERIOD_LAST_180DAY_R== ">3",">3", "-1")))))

train$PC_ACTIVE<- as.factor(ifelse(train$PC_ACTIVE=="1", "1",
                                ifelse(train$PC_ACTIVE== ">1",">1","-1")))
test$PC_ACTIVE<- as.factor(ifelse(test$PC_ACTIVE=="1", "1",
                         ifelse(test$PC_ACTIVE== ">1",">1","-1")))


train$DAYS_FROM_LAST_PAPER_RANGE<- as.factor(ifelse(train$DAYS_FROM_LAST_PAPER_RANGE=="1", "1",
                         ifelse(train$DAYS_FROM_LAST_PAPER_RANGE== ">1",">1",
                                ifelse(train$DAYS_FROM_LAST_PAPER_RANGE== "0","0", "-1"))))
test$DAYS_FROM_LAST_PAPER_RANGE<- as.factor(ifelse(test$DAYS_FROM_LAST_PAPER_RANGE=="1", "1",
                                          ifelse(test$DAYS_FROM_LAST_PAPER_RANGE== ">1",">1",
                                                 ifelse(test$DAYS_FROM_LAST_PAPER_RANGE== "0","0", "-1"))))


train$FIRST_DEALNO_LAG<- as.factor(ifelse(train$FIRST_DEALNO_LAG=="6", "6",
                                          ifelse(train$FIRST_DEALNO_LAG== "5","5",
                                                 ifelse(train$FIRST_DEALNO_LAG== "4","4", 
                                                        ifelse(train$FIRST_DEALNO_LAG== "3","3", 
                                                               ifelse(train$FIRST_DEALNO_LAG== "2","2",
                                                                      ifelse(train$FIRST_DEALNO_LAG== "1","1",
                                                                             ifelse(train$FIRST_DEALNO_LAG== "0","0", "-1"))))))))
test$FIRST_DEALNO_LAG<- as.factor(ifelse(test$FIRST_DEALNO_LAG=="6", "6",
                                ifelse(test$FIRST_DEALNO_LAG== "5","5",
                                       ifelse(test$FIRST_DEALNO_LAG== "4","4", 
                                              ifelse(test$FIRST_DEALNO_LAG== "3","3", 
                                                     ifelse(test$FIRST_DEALNO_LAG== "2","2",
                                                            ifelse(test$FIRST_DEALNO_LAG== "1","1",
                                                                   ifelse(test$FIRST_DEALNO_LAG== "0","0", "-1"))))))))



# int variables to factor
train$WEEK_DAY <- factor(train$WEEK_DAY,levels=c("1","2","3","4","5","6","7"))
train$APPFAMILYSTATUS <- factor(train$APPFAMILYSTATUS,levels=c("1","2","3","4","5"))
train$COMPFIELD <- factor(train$COMPFIELD,levels=c("-1","1","2","3","4","5","6","7","8","9","10","11","12"))


test$WEEK_DAY <- factor(test$WEEK_DAY,levels=c("1","2","3","4","5","6","7"))
test$APPFAMILYSTATUS <- factor(test$APPFAMILYSTATUS,levels=c("1","2","3","4","5"))
test$COMPFIELD <- factor(test$COMPFIELD,levels=c("-1","1","2","3","4","5","6","7","8","9","10","11","12"))




#names(table(train$FIRST_DEALNO_LAG))
#names(table(test$FIRST_DEALNO_LAG))


#need handle vars
#COMPSTAFFQNTY,APPWPERIOD_R2,APPCHILDQNTY,MNTH_SINCE_LAST_APP_R,DIF_INCOME_LAST_180DAY_R,
#DIF_RESPERIOD_LAST_180DAY_R,DIF_PERIOD_LAST_180DAY_R,PC_ACTIVE,DAYS_FROM_LAST_PAPER_RANGE,
#FIRST_DEALNO_LAG
#data info
#describe(train)
