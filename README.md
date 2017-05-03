# MSXF-risk 
* Author: yunbin.jiang'
* EnglishName: Joey.
* Time: 2 May 2017
# Abstract  

  2017-05-01 -19:28
  model details
  --------------
*  firstly:about final_xgboost.R ,I modified the parameters;<br>
*  second:about ensemble.rar, i used the train data to build the model for predicting the test, then scores >0.5 mean target=1;
 then train + test =total.data, we get more data to train the model to predict the test pred3.csv.<br>
*  But the train_error improved a little.<br>
*  if any questions, you can contact me with wechat.<br>

  2017-05-02 -9:56
  model summary
  -------------
 # xgboost version
 -----------------
 * 1 Data exploration
 1) i found that TARGET row has one NA, so i remove it;
 2) the COMPFIELD var has 445 NA ,so i replaced the NA with -1, ohter vars have no NA;
 * 2 feature engineering
 1) there are some different thresholds between train and test, so i made the feature engineering ;
 2) because the data have be dealt with cleanly, so i don't discretize it;
 
 * 3 to sparse matrix
 * 4 xgboost model
 * 5 model assessment 
 1) calculate the train_error=0.018
 2) KS = 0.455
 3) AUC = 0.80
    1)  output pred01.csv(test01)
    2)  output pred02.csv(test02)
 * 6 predict the test data ,then flag the scores>0.5 to 1
 * 7 Line merge the train and test data , then get the xgboost model result, use it to predict the test data;
 * 8 calculate the model performance 
   1) calculate the train_error= 0.014
   2) KS = 0.56
   3) AUC = 0.86
 * 9 output the test scores: total.pred01(0.5).csv;
 * 10 predict the test data ,then flag the scores>0.45 to 1,Line merge the train and test data to rebuild the model
   1) calculate the train_error= 0.0138
   2) KS = 0.74
   3) AUC = 0.934
 * 11 output the test scores: total.pred01(0.45).csv;
 * 12 next step :
   1) CV can optimize the xgboost parameters, the prediction will be better.
 # Supplementary explanation
 * 1 i find DDATE of the test var have exception range :'Feb-05' and 'Jan-05', so the forecast is divided into two predictions: 
   1)  test01 : have the exception range testdata,
   2)  test02 : have no the exception range testdata;
 * 2 the document description
    1)  the document xgboost01 contain the test01 result, the pred01.csv.
    2)  the document xgboost02 contain the test02 result, the pred02.csv.
    3)  the document xgboost.total01 contain the test01 result
         total.pred01(0.45).csv，total.pred01(0.5).csv (test01).
    4)  the document xgboost.total02 contain the test02 result
         total.pred02(0.45).csv，the total.pred02(0.5).csv (test02).

 rondomForest Version
 --------------------
 * 1 it has the same data exploration and feature engineering;
 * 2 but i used the average error to get the mtry parameters and see stability of the error in the model to choose the ntree value;
 * 3 get the important vars to contrast with xgboost;
 * 4 output the test scores;
 
 Logisitc Version
 -----------------
* 1 it has the same data exploration and feature engineering;
* 2 delate the constant vars or the minimal variance one, did't find the strong correlation vars or the multiple collinearity vars;
* 3 choose the IV>0.02 vars
* 4 build the logistic model
* 5 calculate the AUC= 0.782
* 6 then stepwise, get the stepwise vars and rebuild the model;
* 7 get the new AUC = 0.782
* 8 output the predict test scores
     1) LRpred01.csv is the test01.result
     2) LRpred02.csv is the test02 result
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
