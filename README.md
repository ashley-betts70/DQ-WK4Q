# DQ-WK4Q
## Coursera Data Quality Week 4 Quiz

The function to perform the summarising analysis can be found in `run_analysis.R`.

A brief description of these functions folllows:

`build.new.data.set` is the primary function to build the new dataset which is the mean of each feature summarised by Activity and Subject. By default it will search for the base dataset in a subdirectory "UCI HAR Dataset". This can be overridden using the base.dir parameter. It assumes the dataset directory structure is the same as provided in the Quiz zip file.  
`build.base.data.set` is a wrapper function to supply directory name and reconstruct the data from both the train and test datasets.  
`combine.data.sets` takes base directory name and name of dataset to combine (test or train)  

To build the new summarising data set you can use:  
`new_ds <- build.new.data.set()`  
or if the base dataset is not in the defaulted directory or "UCI HAR Dataset":  
`new_ds <- build.new.data.set("Other subdirectory")`