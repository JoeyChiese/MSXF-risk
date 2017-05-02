# MSXF-risk 
* Author: yunbin.jiang'
* EnglishName: Joey.
* Time: 2 May 2017
# Abstract
2017-04-30 -21:28
-----------------
*  Because all my company accounts have been blocked, so i just used my poor computer to run the model, thanks for the xgboost;
 I planned to run the logistic ,rondomforest and xgboost, but randomforest had maked my computer collapsed,<br>
 so wo give up the LR and RF, RF code i can send to you for your info.the model parameters I did not adjust well,need time to do feature engineering and test the model affect.<br>
*  This work is very important for me; but this holiday I still have a lot of things to deal with, just like :take my girlfriend to see my parents and my brother got married,i have to be the Bestman because I had promised him two months ago and so on ,so i didn't have plenty time to train my model ,if more time ,i will do it better. <br>
*  Tonight i try my best to send your my logistic code, need to sample the data, otherwise my computer can not run,but this will ,
but this will affect the model effect.so many work we can do ,but my computer didn't work better.<br>
*  Now i must go to the wedding scene.<br>
      
      
  2017-05-01 -19:28
  model details
  --------------
  firstly:about final_xgboost.R ,I modified the parameters;<br>
  second:about ensemble.rar, i used the train data to build the model for predicting the test, then scores >0.5 mean target=1;
  then train + test =total.data, we get more data to train the model to predict the test pred3.csv.<br>
  But the train_error improved a little.<br>
