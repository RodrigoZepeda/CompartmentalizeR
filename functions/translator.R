#' @title Translator
#' 
#' @description Function that translates a system of equations to what is required by ssa (GillespieSSA)
#' 
#' @param eqsystem System of equations in string form
#' @param  n       Number of variables in system 
#' @return eqsystem System of equations in string form for SSA
#'@return n Number of variables in system 
#' @export


translator <- function(eqsystem, n){

  
  #Change x[i] for xi in every equation
  for (i in 1:length(eqsystem))
  {
      #In each equation of eqsystem look for variables "x[i]" and change to "xi"
      positionsX   <- as.numeric(gregexpr('x[', eqsystem[i],  fixed = TRUE)[[1]])
      positionsbkt <- as.numeric(gregexpr(']', eqsystem[i], fixed = TRUE)[[1]])
      newequation  <- ""
      prevpos      <-  1
      
      if (all(positionsX > 0)){
            
        while(length(positionsX) > 0)
        {
          
          #Update new equation
          newequation <- paste0(newequation, substr(eqsystem[i], prevpos, positionsX[1]))
          
          #Look for next bracket
          nxtbkt <- positionsbkt[min( which(positionsbkt > positionsX[1]) )]
          
          #Get number between brackets
          xnum    <- substr(eqsystem[i], positionsX[1] + 2, nxtbkt - 1)
          
          #Update new equation
          newequation <- paste0(newequation, xnum)
          
          #Update positionsX vector
          positionsX <- positionsX[-1]
          
          #Update current position
          prevpos <- nxtbkt + 1
          
        }
        
        #Update new equation
        newequation <- paste0(newequation, substr(eqsystem[i], prevpos, nchar(eqsystem[i])))
        
      } else {
        newequation <- "0"
      }
      
      #Update to data
      eqsystem[i] <- newequation
      
  }
  
  #Create nu matrix
  nu <- matrix(0, nrow = n, ncol = n^2)
  for (i in 1:n)
  {
    #Notice that the eqsystem can be seen as a matrix of n x n where the ith row represents the values
    #comming out of the node and the ith column the values coming into the node
    ithmatrix <- matrix(0, nrow = n, ncol = n)
    ithmatrix[i,] <- -1
    ithmatrix[,i] <-  1
    
    #Assign to ithmatrix
    nu[i, ]    <- as.vector(t(ithmatrix))
  }
  
  
  
  return(list(eqsystem = eqsystem, nu = nu))
}

  
  