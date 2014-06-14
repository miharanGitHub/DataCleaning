This repository contains script called run_analysis.R which creates a tidy data set from the data sets, which are collected from the accelerometers from the Samsung Galaxy S smartphone. It also contains the CodeBook.md file which is a description of the variables in the tidy data set.

The run_analysis.R script can be run as long as the Galaxy data sets are in the working directory. First it reads all necessary files. 

Then it creates the vectors with clear and understandable activity labels which correspond to the activities in the y_tran and y_test.

Then it finds indices for the measurements in the features data set, which correspond only to "mean" and "std" measurements and not "meanFreq" for example, and create a vector which contains only desired features. The same indices are used to select the desired measurements from the main data sets X_train and X_test, so the smaller data set are created. 
 
Then variables in the smaller data set are named with understandable names.

After that the subjects and activities are added to the training and test data sets with cbind() function and the sets are combined together by rbind() function. 

Finally the averages for measurements for correspondent subjects and activities are calculated by using melt() and dcast() functions.  

This is it!
