## This pair of functions caches an inverse of matrix.  That way
## the inverse does not need to be repeatedly calculated
## if it already exists in the cache.

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  ## Set the cached_matrix to NULL
  cached_matrix <- NULL
  
  ## Set function for cached_matrix
  set <- function(y) {
    x <<- y
    cached_matrix <<- NULL
  }
  
  ## Get function for cached_matrix
  get <- function() x
  
  ## Setinverse function for cached_matrix
  setinverse <- function(inverse) cached_matrix <<- inverse
  
  ## Getinverse function for cached_matrix
  getinverse <- function() cached_matrix
  
  list(set = set, get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}


## This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix. If the inverse has already
## been calculated (and the matrix has not been changed),
## then the cachesolve should retrieve the inverse from the
## cache.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  ## Get the inverse if it exists
  inverted_matrix <- x$getinverse()
  if(!is.null(inverted_matrix)) {
    message("getting cached data")
    ## If it is not null, return the cached matrix
    return(inverted_matrix)
  }
  ## Otherwise, get the matrix
  matrix_toinvert <- x$get()
  ## Invert the matrix
  inverted_matrix <- solve(matrix_toinvert)
  ## Save the inverted_matrix to the cache
  x$setinverse(inverted_matrix)
  ## Return the inverted_matrix
  inverted_matrix
}

## You may test the functions with the code below:
## test_matrix <- cbind(c(4,2),c(7,6))
## cached_matrix <- makeCacheMatrix(test_matrix)
## cacheSolve(cached_matrix)
##Solution:
##      [,1] [,2]
##[1,]  0.6 -0.7
##[2,] -0.2  0.4
