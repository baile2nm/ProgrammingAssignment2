## cachematrix.R: Source file that contains two functions that implement
## a data structure to store a matrix and its inverse. This structure allows
## for increased performance in applications that repeatedly reference the
## inverse of a particular matrix by caching the result of the inverse
## computation so that it is not necessary to perform it more than once.


## makeCacheMatrix(): Constructs a cacheMatrix that allows the user to
## store a matrix and its inverse. The inverse is initially stored as
## null until the user calculates and sets it.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## cacheSolve(): Returns the inverse of the cacheMatrix passed as
## parameter 'x'. If the inverse has already been computed and
## cached, the cached value is returned. If not, the inverse is
## computed using the solve() function and then cached for later use.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  matrix <- x$get()
  inv <- matrix(solve(matrix), nrow(matrix), ncol(matrix))
  x$setinv(inv)
  inv
}