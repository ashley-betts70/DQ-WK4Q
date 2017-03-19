library(dplyr)
library(data.table)

# Base directory is "UCI HAR Dataset" in the developers sandpit.
build.new.data.set <- function(base.dir="UCI HAR Dataset") {
  comb_ds <- build.base.data.set(base.dir)
  return(comb_ds %>% group_by(Activity,Subject) %>% summarise_each(funs(mean)))
}

build.base.data.set <- function(base.dir) {
  test_ds <- combine.data.sets(base.dir, "test")
  train_ds <- combine.data.sets(base.dir, "train")
  comb_ds <- rbind(test_ds,train_ds)
  req_cols <- c(match("Subject",names(comb_ds)),match("Activity",names(comb_ds)), grep(pattern = "(-mean\\(|-std\\()", x = names(comb_ds)))
  return (comb_ds[req_cols])
}

combine.data.sets <- function(base.dir,name.of.set) {
  dir.name = paste(base.dir,name.of.set,sep="/")
  
  features_ds <- read.table(paste(base.dir,"/features.txt",sep=""))
  activitynames_ds <- read.table(paste(base.dir,"/activity_labels.txt",sep=""))
  subject_ds <- read.table(paste(dir.name,"/",gsub("set",name.of.set,"subject_set.txt"),sep=""))
  feature_ds <- read.table(paste(dir.name,"/",gsub("set",name.of.set,"X_set.txt"),sep=""))
  activity_ds <- read.table(paste(dir.name,"/",gsub("set",name.of.set,"y_set.txt"),sep=""))
  
  activity_map <- activitynames_ds$V2
  names(activity_map) <- activitynames_ds$V1
  activity_ds$V1 <- activity_map[activity_ds$V1]
  
  names(subject_ds) <- "Subject"
  names(feature_ds) <- features_ds$V2
  names(activity_ds) <- "Activity"
  
  result_ds <- cbind(subject_ds,activity_ds,feature_ds)
  
  return(result_ds)
}
