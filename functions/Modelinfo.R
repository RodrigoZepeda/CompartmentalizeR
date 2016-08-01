#' @title Model info
#' 
#' @description Function for printing information regarding this model's run
#' 
#' @param  buttonsim    Number of times the "Simulate" button has been pressed
#' 
#' @param  omega        Matrix of constants
#' @param  diffeqlist   List of differential equations in R format
#' @param  initlist     List of initial values
#' @param  tspan:       Time span for estimation
#' @param  labellist    List containing variable labels                
#' @param  timeval      Values for time with step-size (timeval$tstep) and maximum time (timeval$tmax)
#' @param  msim         Number of simulations to conduct
#' @param  seedn        Seed for CTMC simulation
#' @param  methodctmc    Method for simulating CTMC
#'   
#' @return TRUE
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' 
#' @export
#' 

Modelinfo <- function( diffeqlist, initlist, omega, buttonsim, labellist, solutionmethod, msim, timeval, method,
                       methodctmc, seedn){
  
  #Simulation characteristics
  print(paste("------Simulation",buttonsim,"------"))
  print(paste0("1)   ",length(diffeqlist), " equations:"))
  print(diffeqlist)
  print(paste0("2)   Initial conditions: (", length(initlist), ")"))
  print(initlist)
  print("3)   Constants:")
  print(omega)
  print("4)   Labels:")
  print(labellist)
  print("5)   Solution method:")
  print(solutionmethod)
  print("6)   Additional options:")
  print(paste0("      ->Number of simulations: ", msim))
  print(paste0("      ->Maximum time: ",          timeval$tmax))
  print(paste0("      ->Time step: ",             timeval$tstep))
  print(paste0("      ->ODE method: ",            method))
  print(paste0("      ->SSA method: ",            methodctmc))
  print(paste0("      ->Seed: ",                  seedn))
  print("-------------------------")
  
  #Print to console
  flush.console()
  
  return(TRUE)
}