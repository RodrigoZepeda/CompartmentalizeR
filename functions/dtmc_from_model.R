#' @title DTMC from Model
#' 
#' @description Function for simulating discrete time markov chains from CompartmentalizeR
#' 
#' @param  omega Matriz of constants
#' @param  diffeqlist List of differential equations in R format
#' @param  initlist List of initial values
#' @param  tspan Time span for estimation
#' @param  labellist    List containing variable labels                
#' @param  msim          Number of simulations to conduct
#' @param  seeddtmc      Seed for DTMC simulation
#' @return diff_eqn     Mean of DTMC simulations
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' 
#' @export
#' 

dtmc_from_model <- function(diffeqlist, initlist, tspan, omega, labellist, msim, seeddtmc){
  
  #Check that data makes sense
  datdtmc  <- DTMCprepare(labellist, omega, initlist, seeddtmc)
  
  #Solve discrete time Markov chain
  diff_eqn <- DTMCsolver(msim, datdtmc$omega, datdtmc$initlist, datdtmc$labellist, tspan)
  
  #Return diff_eqn
  return(diff_eqn)
  
}