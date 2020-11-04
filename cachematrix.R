## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly.
## This assignment aims to cache and compute the inverse of an invertible square matrix 'x'.

## This function creates a special matrix object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  # Set function
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  
  setInverse <- function(n) {
    m <<- n
  }
  
  getInverse <- function() m
  
  list(
    set = set,
    get = get,
    setInverse = setInverse,
    getInverse = getInverse
  )
}


## This function computes a special matrix returned by makeCacheMatrix
cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if (is.null(m)) {
    m <- solve(x$get(), ...)
    x$setInverse(m)
  }
  else
    message("Getting cached data")
  m
}
