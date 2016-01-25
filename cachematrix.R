## This pair of functions caches an inverse of matrix.  That way
## the inverse does not need to be repeatedly calculated
## if it already exists in the cache.

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

}


## This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix. If the inverse has already
## been calculated (and the matrix has not been changed),
## then the cachesolve should retrieve the inverse from the
## cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
