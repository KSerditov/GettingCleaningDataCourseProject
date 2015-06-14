==================================================================
Getting and Cleaning Data Course Project Submission
==================================================================
Konstantin Serditov
https://github.com/KSerditov/GettingCleaningDataCourseProject
==================================================================

Source dataset located here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Its full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

From this dataset the second, independent tidy data set with the average of each variable for each activity and each subject was created.

The project folder includes the following files:
=========================================

- 'codebook.md': Data dictionary for the output dataset.

- 'README.md': Current file.

- 'run_analysis.R': R script which performs all transformations over initial dataset.

- 'step_5_tidy_set.txt': Resulted tidy dataset with the average of each mean or standard deviation variable for each activity and each subject.

=========================================

What run_analysis.R does:
0. Assuming there is unzipped folder "UCI HAR Dataset" in working directory.
1. Loads following files from source dataset:
	./UCI HAR Dataset/test/X_test.txt
	./UCI HAR Dataset/test/y_test.txt
	./UCI HAR Dataset/test/subject_test.txt
	./UCI HAR Dataset/train/X_train.txt
	./UCI HAR Dataset/train/y_train.txt
	./UCI HAR Dataset/train/subject_train.txt
2. Merges training and test datasets and joins it with subjects and activities data.
3. Keeps columns which contains "mean(" or "std(" in their names along with activities and subjects (and removes other columns).
4. Calculate averages for each column broken down by activities and subjects.
5. Writes output data set as 'step_5_tidy_set.txt' intu working directory.

License:
========
Use of source dataset must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Source dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
