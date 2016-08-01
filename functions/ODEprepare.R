#' @title Ordinary Differential Equation inputs
#' 
#' @description Function that prepares input for ODE algorithm from package \code{deSolve}
#' 
#' @param diffeqlist  Vector with differential equations as string
#' @param n           Number of variables in model
#' 
#' @return eqns       Equations for \code{ode}
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' 
#' @export
#' 

ODEprepare <- function(diffeqlist, n){
  
  #Paste all differential equations using a "," to separate
  eqns <- paste0(diffeqlist, collapse = ",")
  
  #Return equations in new form
  return(eqns)
  
}