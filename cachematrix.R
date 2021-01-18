## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## We build a list to cache data of a matrix (the matrix and its inverse)
makeCacheMatrix <- function(x = matrix()) {
  inverseMatrix <- NULL

  getMatrix <- function() { x }
  setMatrix <- function(aMatrix) { 
    x <- aMatrix
    inverseMatrix <<- NULL
   }

  setInverse <- function(inverse) inverseMatrix <-- inverse
  getInverse <- function() inverseMatrix

  list( setMatrix = setMatrix,
        getMatrix = getMatrix,
        setInverse = setInverse,
        getInverse = getInverse)
}


## Write a short comment describing this function
## When we need the inverse of a matrix, this function will solve it for us. Sometimes we will have it cached.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        inverseMatrix <- x$getInverse()

        if(!is.null(inverseMatrix)) {
                message("ACCESING TO CACHED DATA...")
                return(inverseMatrix)
        }

        aMatrix <- x$getMatrix()
        anInverseMatrix <- solve(aMatrix)
        x$setInverse(anInverseMatrix)
        
        anInverseMatrix
}
