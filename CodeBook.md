CodeBook
Description of the variables contained in tidy.txt
Read data and load labels and features
filename: name of downloaded raw dataset
activityLabels: load the activity labels
features: load the features
Extract only mean() and std()
featuresWant: extracts only the features with Mean or Standard Deviation calculations
Change column labels of data set
featuresWant.names: a vector of 'clean' feature names
Adding Subject and Activity to the data set
trainActivities: loads the train activities from the Y_train.txt file
trainSubjects: loads the train subjects from the subject_train.txt file
train: loads the featuresWant dataset into an initial table called 'train', and then binds the trainActivities and trainSubjects with the original 'train' to create a new 'train' table
testActivities: loads the test activities from the Y_test.txt file
testSubjects: loads the test subjects from the subject_test.txt file
test: loads the featuresWant dataset into an initial table called 'test', and then binds the testActivities and testSubjects with the original 'test' to create a new 'test' table
Output tidy data
allData: merges the 'train' and 'test' tables together
allDataMelted: melts the (wide) 'allData' data frame into a long-format data frame under 'subject' and 'activity'
allDataMean: takes the long-format of allDataMelted and casts it into a wide-format data frame under 'subject', 'activity' and the mean variables
