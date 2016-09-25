## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {m <- NULL
#set initial function to initiate the variables
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
#get function to take passed values from another function
  get <- function() x
#inverse the matrix passed onto this function
  setinv <- function(solve) m <<- solve
#if inversed matrix is cahed retrieve from this function
  getinv <- function() m
#initiate set get setinv and getinv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)


}


## Write a short comment describing this function
#this function uses above function to return inverse of the matrix, if it is already cached, returns from the cache
#else calculates and saves in the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
m <- x$getinv()
#if inverse matrix is cached get from the cached using the above function
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
#if inverse matrix is not cached, inverse it and cache it
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
