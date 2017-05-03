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
 1) calculate the train_error
 2) KS 
 3) AUC
 * 6 predict the test data ,then flag the scores>0.5 to 1
 * 7 Line merge the train and test data , then get the xgboost model result, use it to predict the test data;
 * 8 
 1) calculate the train_error, too
 2) KS 
 3) AUC
 * 9 output the test scores
 
 # Supplementary explanation
 * 1 i find DDATE of the test var have exception range :'Feb-05' and 'Jan-05', so the forecast is divided into two predictions: 
 test01 : have the exception range testdata,
 test02 : have no the exception range testdata;
 * 2 the document xgboost01 contain the test01 result, the pred01.csv.
     the document xgboost02 contain the test02 result, the pred02.csv.
 * 3 i modified the scores threshold to 0.45, when the score >0.45 TARGET=1, then column merge the train and test data to rebuild the xgboost to predict the test data.
 * 4 the document xgboost.total01 contain the test01 result, total.pred01(0.45).csv.
     the document xgboost.total02 contain the test02 result, total.pred02(0.45).csv.
 * 5 also you can get the total.pred01(0.5).csv and the total.pred02(0.5).csv
 
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
  * 8 output the predict test scores.
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
