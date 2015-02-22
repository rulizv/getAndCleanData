# getAndCleandData

This repository contains the code for a the Course Project of Get and Clean Data

The Samsung data should be in the Home Directory of R. The original zip should be expanded there and the names of the structure should be left as is.

To run the R script just have to load it into R Studio (or R) and load the source file the run the function r<-run_analysis()

This should produce a file the local directory named result.txt and should leave also a variable r in the running environment. 

The result could be checked using View(r) 

No other transformations are required.

Brief description of what the script does:


There is only one function in the script. It should work as long as the Samsung directory had been expandend from the zip file in the local directory and the directory structure had been left as is

First for each set of data, test and train, data_frames are loaded from the files into data frames. 

A subset of the numeric variables need to be identified by identifyin columns with mean() and std(). This is done by matching a regular expression against all the features names identifying the corresponding column orders. 

Using this the data.frame with the numeric observations is subsseted using only the needed columns. The names of those columns are also changed to reflect meaningful names that are the complete variable name with the description.

After that, the data.frames are joined and merged. 

Finally, averages of all variables are computed using the aggregate function. 

c) Rulizv
