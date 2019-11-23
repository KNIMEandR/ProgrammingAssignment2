# Functions makeCacheMatrix and cacheSolve are a pair of functions that create a special matrix
# object that can contain the cached inverse of the matrix (makeChaceMatrix) and the associated
# function that retrieves or calculates the inverse matrix

# Create special matrix object that can contain cached inverse matrix

makeCacheMatrix <- function(x = matrix()) {

	inverse <- NULL

	set <- function(y) {
		x <<- y
		inverse <<- NULL
	}

	get <- function() x
	setInverse <- function(solve) inverse <<- solve
	getInverse <- function() inverse

	list(set = set,
	     get = get,
	     setInverse = setInverse,
	     getInverse = getInverse)	
	
	
}

# Return cached inverse matrix of x, or calculate & return inverse matrix if cache is empty

cacheSolve <- function(x, ...) {
        inverse <- x$getInverse()

        if(!is.null(inverse)) {
        	message("Retrieving chached inverse matrix...")
        	return(inverse)
        }

        data <- x$get
	inverse <- solve(data, ...)
	x$setInverse(inverse)
	inverse
}
