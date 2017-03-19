# DQ-WK4Q
Coursera Data Quality Week 4 Quiz

run_analysis.R

`build.new.data.set` is a wrapper function to build the new dataset which is the mean of each feature summarised by Activity and Subject.
`build.base.data.set` is a wrapper function to supply directory name and reconstruct the data from both the train and test datasets.
`combine.data.sets` takes base directory name and name of dataset to combine (test or train)

`new_ds <- build.new.data.set("UCI HAR Dataset")`