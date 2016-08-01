#' @title ODE from Model
#' 
#' @description Function for solving differential equations from CompartmentalizeR
#' 
#' @param  omega Matriz of constants
#' @param  diffeqlist List of differential equations in R format
#' @param  labellist List of labels of variables
#' @param  initlist List of initial values
#' @param  tspan Time span for estimation
#' @param  method Method of differential equations (default direct)                
#' 
#' @return diff_eqn     Solution to the system of differential equations. 
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' @examples 
#' 
#' @export
#' 

ode_from_model <- function(diffeqlist, initlist, omega, labellist, tspan, method = "Direct"){
  
  #Get equations in adecquate form
  eqns     <- ODEprepare(diffeqlist, length(initlist))
  
  #Calculate the differential equation
  diff_eqn <- ODEsolver(eqns, omega, initlist, tspan, method)  
  
  #Set as data frame
  diff_eqn <- as.data.frame(diff_eqn)
  colnames(diff_eqn) <- c("Time", labellist)
  
  #Return diff_eqn
  return(diff_eqn)
  
}