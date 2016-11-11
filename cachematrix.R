## Jun Zhu
## Caching the inverse of a Matrix

## makeCacheMatrix: This function creates a special "matrix" object that can cache its invers.

makeCacheMatrix <- function(x = matrix()) {
    
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
    setinverse = setinverse,
    getinverse = getinverse)
    
}


## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
    
}

## Create a Matrix and run the program

a <- matrix(c(4,2,7,6), nrow=2, ncol=2)
a

CacheMatrix <- makeCacheMatrix(a)

cacheSolve(CacheMatrix)
<<<<<<< HEAD

=======
>>>>>>> origin/master
