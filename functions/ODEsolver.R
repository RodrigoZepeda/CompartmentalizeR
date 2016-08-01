#' @title Differential Equation Solver
#' 
#' @description Takes a system of first order ordinary differential equations \code{eqns}
#' and returns their solution for a period from \code{0} to \code{tmax}.
#' 
#' @param eqns      First order differential equations in terms of a vector \code{x} and parameters given by a matrix \code{alpha}
#' @param params    Parameters for the equations \code{eqns}
#' @param xinit     Vector of initial conditions for solving the equations \code{eqns}
#' @param tspan     Vector of points in time in which to evaluate the function. 
#' @param method    Solution method for ODE. See the package \code{deSolve} for additional methods.   
#' 
#' @return diff_eqn Data frame with solution to the differential equation
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' 
#' 
#' @export

ODEsolver <- function(eqns, parms, xinit, tspan, method){
  
  #Create a list of equations to pass to ode
  eqsolve <- paste0("list(c(", eqns, "))")
  
  #Create the differential equation by parsing the text
  diffeq <- function(t,x,parameters){
    eval(parse(text = eqsolve))
  }
  
  #Set as global for ode to work
  omega <<- parms
  
  #Solve using deSolve command ode
  diff_eqn <- ode( y      = xinit, 
                   func   = diffeq,
                   times  = tspan,
                   parms  = c(), 
                   method = method )
  
  #Remove omega from global
  rm(list = "omega", envir = globalenv())
  
  #Return differential equation as data frame
  return(diff_eqn)
}