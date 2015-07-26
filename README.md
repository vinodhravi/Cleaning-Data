tidydata
========

tidy data repository for Data science specialization
===============================================================================

As part of the asssesment the R script to convert the given data into tidy data was developed. The R script run_analysis.R is used to perform this activity. 

Actions performed by the script
=========================================================
Read the test and training datasets and combine them into a single dataset.Please note that the files need to be placed in the current working directory. 
Extarcts only the fields that have mean() or std() in their name.Create a dataset by binding these columns along with the activity and subject columns.

Map the activities to their descriptions and label them.

Load the package "reshape2" and "plyr"

Melt the dataset based on the subject and activity combination

Cast the melted dataset using dcast and calculate the mean of each variables based on subject and activity.

write the casted dataset into the text file tidydata.txt
===========================================================================================

Assumptions 
Internals Signals data not considered.







