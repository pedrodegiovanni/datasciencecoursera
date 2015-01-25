---
title: "Readme"
author: "Pedro Degiovanni"
date: "Sunday, January 25, 2015"
output: html_document
---

The script run_analysis.R transforms the raw data from the Human Activity Recognition Using Smartphones Data Set into a tidy dataset. For it to work the package "dplyr" should be installed and the folder "UCI HAR Dataset" (or one with the same structure) should be the working directory.

Lines 1 through 16 merge the training and test datasets and sets the column names.

Lines 18 and 19 extract only the measurements of mean and standart deviation for each measurement using the function grep() two times: first it extracts only the variables that include the string "mean" or "sd" and then removes those which include the string "Freq" in order to dispose with the variable "meanFreq".

Lines 21 and 22 transforms the activity codes into a factors and labels them with descriptive names.

Lines 24 to 32 transform the variable names removing horizontal dashes and parenthesis and replacing "t" and "f" for "Time" and "Freq. The explanation of these variables can be found on the file "features_info.txt"

Lines 35 and 36 summarize the data taking the mean of each variable for each subject and activity using the function "summarise_each".

Finally, line 38 creates the data set "tidy_data_set.txt"

A description of the variables can be found on the file "Codebook.md"
 
