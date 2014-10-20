## Simple test case for functions in cachematrix.r

source('cachematrix.r')

## Make an invertible cached matrix.
t = makeCacheMatrix()
t$set(matrix(c(2,0,2, 0,1,2, 0,0,2), 3, 3))

## Verify matrix is set up correctly.
t$get()

## For first call, the inverse must be computed.
i = cacheSolve(t)
i %*% t$get()

## On second call, the cached value should be used.
j = cacheSolve(t)
j %*% t$get()