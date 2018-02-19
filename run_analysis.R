library(reshape2)

# *** Defining path to files:

Train.Set.Path <- "UCI HAR Dataset/train/X_train.txt"
Train.Activity.Path <- "UCI HAR Dataset/train/y_train.txt"
Train.Subject.Path <- "UCI HAR Dataset/train/subject_train.txt"
Test.Set.Path <- "UCI HAR Dataset/test/X_test.txt"
Test.Activity.Path <- "UCI HAR Dataset/test/y_test.txt"
Test.Subject.Path <- "UCI HAR Dataset/test/subject_test.txt"


# *** Loading files:

Train.Set.Raw <- read.table(Train.Set.Path, sep = "\n")
Train.Activity.Raw <- read.table(Train.Activity.Path, sep = "\n")
Train.Subject.Raw <- read.table(Train.Subject.Path, sep = "\n")
Test.Set.Raw <- read.table(Test.Set.Path, sep = "\n")
Test.Activity.Raw <- read.table(Test.Activity.Path, sep = "\n")
Test.Subject.Raw <- read.table(Test.Subject.Path, sep = "\n")

# *** Building dataframes:

getAsNumeric <- function(x,y){as.numeric(x[y])}

#Train:

Train.Set.asStr <- gsub("  ", " ", as.character(Train.Set.Raw$V1))
Train.Set.asStr <- gsub("^ ", "", as.character(Train.Set.asStr))
Train.Set.Complete <- strsplit(x =  Train.Set.asStr, split = " ")
Train.Set.Mean.X <- sapply(Train.Set.Complete, getAsNumeric, y = 1)
Train.Set.Mean.Y <- sapply(Train.Set.Complete, getAsNumeric, y = 2)
Train.Set.Mean.Z <- sapply(Train.Set.Complete, getAsNumeric, y = 3)
Train.Set.Std.X <- sapply(Train.Set.Complete, getAsNumeric, y = 4)
Train.Set.Std.Y <- sapply(Train.Set.Complete, getAsNumeric, y = 5)
Train.Set.Std.Z <- sapply(Train.Set.Complete, getAsNumeric, y = 6)

Train.Activity <- gsub("1", "WALKING", as.character(Train.Activity.Raw$V1))
Train.Activity <- gsub("2", "WALKING_UPSTAIRS", Train.Activity)
Train.Activity <- gsub("3", "WALKING_DOWNSTAIRS", Train.Activity)
Train.Activity <- gsub("4", "SITTING", Train.Activity)
Train.Activity <- gsub("5", "STANDING", Train.Activity)
Train.Activity <- gsub("6", "LAYING", Train.Activity)

Train.Subject <- Train.Subject.Raw$V1

Mean.X <- Train.Set.Mean.X
Mean.Y <- Train.Set.Mean.Y
Mean.Z <- Train.Set.Mean.Z
Std.X <- Train.Set.Std.X
Std.Y <- Train.Set.Std.Y
Std.Z <- Train.Set.Std.Z
Activity <- Train.Activity
Subject <- Train.Subject

Train <- data.frame(Subject, Activity, Mean.X, Mean.Y, Mean.Z, Std.X, Std.Y, Std.Z)

#Test:

Test.Set.asStr <- gsub("  ", " ", as.character(Test.Set.Raw$V1))
Test.Set.asStr <- gsub("^ ", "", as.character(Test.Set.asStr))
Test.Set.Complete <- strsplit(x =  Test.Set.asStr, split = " ")
Test.Set.Mean.X <- sapply(Test.Set.Complete, getAsNumeric, y = 1)
Test.Set.Mean.Y <- sapply(Test.Set.Complete, getAsNumeric, y = 2)
Test.Set.Mean.Z <- sapply(Test.Set.Complete, getAsNumeric, y = 3)
Test.Set.Std.X <- sapply(Test.Set.Complete, getAsNumeric, y = 4)
Test.Set.Std.Y <- sapply(Test.Set.Complete, getAsNumeric, y = 5)
Test.Set.Std.Z <- sapply(Test.Set.Complete, getAsNumeric, y = 6)

Test.Activity <- gsub("1", "WALKING", as.character(Test.Activity.Raw$V1))
Test.Activity <- gsub("2", "WALKING_UPSTAIRS", Test.Activity)
Test.Activity <- gsub("3", "WALKING_DOWNSTAIRS", Test.Activity)
Test.Activity <- gsub("4", "SITTING", Test.Activity)
Test.Activity <- gsub("5", "STANDING", Test.Activity)
Test.Activity <- gsub("6", "LAYING", Test.Activity)

Test.Subject <- Test.Subject.Raw$V1

Mean.X <- Test.Set.Mean.X
Mean.Y <- Test.Set.Mean.Y
Mean.Z <- Test.Set.Mean.Z
Std.X <- Test.Set.Std.X
Std.Y <- Test.Set.Std.Y
Std.Z <- Test.Set.Std.Z
Activity <- Test.Activity
Subject <- Test.Subject

Test <- data.frame(Subject, Activity, Mean.X, Mean.Y, Mean.Z, Std.X, Std.Y, Std.Z)

# *** Merging Data

DataSet <- merge(Train, Test, all = TRUE)

# *** Tidy Dataset

DataSet.Tidy.Complete <- melt(DataSet, id = c("Activity","Subject"), measure.vars = c("Mean.X","Mean.Y","Mean.Z"))
DataSet.Tidy <- dcast(DataSet.Tidy.Complete, Activity + Subject ~ variable, mean)

# *** Exporting

write.table(x = DataSet.Tidy, file = "Curso4-week4_final-tidy-data.txt", row.name=FALSE)
