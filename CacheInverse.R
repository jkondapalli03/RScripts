makeMatrix <- function(x = matrix()) 
{
     # if an object is called without a method
     m <- NULL
     set <- function(y) 
     {
         x <<- y
         m <<- NULL
     }
     get <- function() 
     {
       x
     }
     setInverse <- function(Inverse) 
     {
       m <<- Inverse
     }
     getInverse <- function() 
     {
       m
     }
     list(set = set, get = get,setInverse = setInverse,getInverse = getInverse)
 }

cacheInverse <- function(x, ...) 
{
     m <- x$getInverse()
     if(!is.null(m)) 
     {
         message("getting cached data")
         return(m)
     }
     data <- x$get()
     #print(data)
     m <- solve(data, ...)
     x$setInverse(m)
     m
 }
