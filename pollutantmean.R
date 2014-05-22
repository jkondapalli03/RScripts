pollutantmean <- function(directory , pollutant, id = 1:332)
{
  filenames <- paste(directory,"\\",formatC(id, width = 3, flag = '0') ,".csv",sep="")
  count <- 1
  
  while(count <= length(filenames))
  {
    file <- filenames[count] 
    
    # if the merged dataset does exist, append to it
  
    if (exists("dataset"))
    {
      temp_dataset <-read.table(file, header=TRUE, sep=",")
      dataset<-rbind(dataset, temp_dataset)
      rm(temp_dataset)
    }
    
    if (!exists("dataset"))
    {
      dataset <- read.table(file, header=TRUE, sep=",")
    }
    count <- count + 1
  }
  if(pollutant == "sulfate")
  {
    mean(dataset$sulfate ,na.rm = TRUE)
  }
  else
  #if(pollutant == "nitrate")
  {
    mean(dataset$nitrate ,na.rm = TRUE)
  }
  
} 


