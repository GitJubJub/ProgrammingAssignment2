## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix reads in a matrix storing the matrix and its inverse in a 
## callable enverionment.  The second function, cacheSolve, either retrieves the
## cached variable, or calculates the inverse matrix.

## Write a short comment describing this function
## makeCacheMatrix starts reading in the function and setting m to Null. 
## It then calculates the inverse of the matrix and stores the information
## in a list to expedite retrieval.
## A more detailed line by line description is given below.

makeCacheMatrix<-function(x = matrix()) {     ## Defines a R function "makeCacheMatrix".  Requests a variable x which presumably is an invertible matrix.
    m<-NULL					                          ## Sets m to NULL
    set<-function(y) {			                  ## Defines a function called "set".
      x<<- y				                          ## Sets x equal to y, sending the variable y into a retrievable environment
      m<<-NULL			                          ## Sets the variable m as Null in a retrievable environment
    }					                                ## Brace closes the embedded function "set".		
    get <- function()x			                  ## Defines a function called "get" which is the matrix x.
    setsolve<- function(solve) m<<-solve	    ## Defines setsolve, an inverted matrix.
    getsolve<- function() m			              ## Assigns getsolve, essentially m.
    list(set = set, get = get,                ## Prints a list of containing 4 variables 1.) set, 2.)get, 3.)setsolve, 4.)getsolve
         setsolve = setsolve,		              ## Puts setsolve into list variable setsolve.
         getsolve = getsolve)		              ## Puts getsolve into list variable getsolve.
  }						                                ## Brace close overall function makeCacheMatrix


## Write a short comment describing this function

## cacheSolve does two things.  It either retrieves the stored inverted matrix of x,or
## it calculates the inverted matrix of x.
## In either instance it prints the inverted matrix to the command lines.
## A detailed line by line description is given below.

cacheSolve <- function(x, ...) {  	          ## Defines a callable function called "cacheSolve."  X is a list containing similar output to makeCacheMatrix.
  m<- x$getsolve()			                      ## Assigns the list variable getsolve to the variable m.
  if(!is.null(m)) {			                      ## Begins "if..." statement. If m IS NOT null then next the two lines are performed.
    message("getting cached data")	          ## Returns the message "Getting Cached Data" to the command line interface, and
    return(m)			                            ## Returns the inverse matrix of x as output.
  }					                                  ## Brace closes the "if..." statement.
  data<- x$get()				                      ## Assigns the variable "get" from the output of "makeCacheMatrix" to a variable named "data".
  m<- solve(data, ...)			                  ## Returns the inverse matrix from data, and stores the results in a variable called m.
  x$setsolve(m)				                        ## Creates the inverted matrix of data as variable m.  
  m					                                  ## Prints m, the inverted matrix, to the command line interface.
}						                                  ## Brace closes the overall function "CacheSolve".

