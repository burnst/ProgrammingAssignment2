## Put comments here that give an overall description of what your
## functions do


## Write a short comment describing this function
makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setInverse <- function(solve) inv <<- solve
	getInverse <- function() inv
	list(set = set, get = get,
	     setInverse = setInverse,
	     getInverse = getInverse)
}


## Check to see if the inverse is cached
## If so then return the cached value
## Otherwise compute the inverse, store in cache, and return value 
cacheSolve <- function(x, ...) {
	inv <- x$getInverse()
	if (!is.null(inv)) {
		message("getting cached data")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data, ...)
	x$setInverse(inv)
	inv
}
