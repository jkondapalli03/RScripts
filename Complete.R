complete <- function(directory , id = 1:332)
{
  count <- 1
  while(count <= length(id))
  {
    filenames <- paste(directory,"\\",formatC(id[count], width = 3, flag = '0') ,".csv",sep="")
    temp_dataset <- read.table(filenames , header=TRUE, sep=",")
    nobs <- sum(complete.cases(temp_dataset))
    
    if (exists("dataset"))
    {
      temp_dataset <-data.frame(id[count], nobs)
      dataset<-rbind(dataset, temp_dataset)
      rm(temp_dataset)
    }
    
    if (!exists("dataset"))
    {
      dataset <- data.frame(id[count],nobs)
    }
    
    count <- count + 1
  }
  x <- dataset
  colnames(x) <- c("id", "nobs")
  x
}
