#' @title Discrete Time Markov Chain Inputs
#' 
#' @description Function that prepares inputs for estimation
#' 
#' @param timeval       Input on time with minimum and maximum time as well as time step
#' @param constantlist  Matrix of constants
#' @param initlist      Vector of initial distribution
#' 
#' @return list containinf 
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' @examples 
#' 
#' @export
#' 

Allprepare <- function(initlist, constantlist, timeval){
  
  #Number of equations
  n <- length(initlist)
  
  #Check that constant list is > 0
  if (length(constantlist) > 0){
  
    #Constants should be read as matrices
    omega <- matrix(constantlist, nrow = n, byrow = TRUE)
    
  } else {
    
    #Empty matrix
    omega <- matrix(0, nrow = n)
    
  }

  #Time span
  tspan <- seq(from = 0,to = timeval$tmax , by = timeval$tstep)
  
  return( list(omega = omega, tspan = tspan))
  
}