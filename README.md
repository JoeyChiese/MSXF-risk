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
 1) there are some different thresholds between train and test, so i make the feature engineering to do it;
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
 
 rondomForest Version
 --------------------
 * 1 it has the same data exploration and feature engineering;
 * 2 but i used the average error to get the mtry parameters and see stability of the error in the model to choose the ntree value;
 * 3 get the important vars to contrast with xgboost;
 * 4 output the test scores;
 
 Logisitc Version
 -----------------
 updating
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
