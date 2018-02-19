Code Book:

This code book explains the final tidy data set.

The dataset is made of the data in train and test, merged together in the same dataframe, and consifering that all fields have the same meaning.

The collumn names are:

"Activity" "Subject" "Mean.X" "Mean.Y" "Mean.Z"

Activity:
This is the number in the Label files (y_train and y_test) trnasformed to string like in the activity_labels.txt

Subject:
This is the number as in the subject_train.txt and subject_test.txt

Mean.X, Mean.Y and Mean.Z:
These are the mean of the three first values in each row of the X_train.txt and X_test.txt files over the Subject and Activity of each measurement.

Example of how it looks like:

"Activity" "Subject" "Mean.X" "Mean.Y" "Mean.Z"
"LAYING" 1 0.22159824394 -0.0405139534294 -0.11320355358
"LAYING" 2 0.281373403958333 -0.0181587397583333 -0.107245610416667
"LAYING" 3 0.275516852741935 -0.0189556785048387 -0.101300477506452
"LAYING" 4 0.263559214981481 -0.0150031841055556 -0.110688150314815
"LAYING" 5 0.278334325576923 -0.0183042123269231 -0.107937603673077
"LAYING" 6 0.248656520140351 -0.0102529170561404 -0.133119570368421
...
