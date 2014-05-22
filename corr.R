corr <- function(directory, threshold = 0) {
  
  id <- 1:332
  x <- vector("numeric")
  #i <- 1
  
  count <- 1
  while(count <= length(id))
  {
    filenames <- paste(directory,"\\",formatC(id[count], width = 3, flag = '0') ,".csv",sep="")
    temp_dataset <- read.table(filenames , header=TRUE, sep=",")
    if (sum(complete.cases(temp_dataset)) > threshold)
    {
      x <- c(x, cor(temp_dataset["sulfate"], temp_dataset["nitrate"], use="pairwise.complete.obs"))
    }
    count <- count + 1
  }
  x
  
  
}