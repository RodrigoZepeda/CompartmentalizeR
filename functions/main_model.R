#' @title Main Model
#' 
#' @details Function for solving a compartmental model
#' 
#' @param diffeqlist List of equations
#' @param initlist Vector of initial values
#' @param constantlist List of constants for connections
#' @param timeval Time span (list)
#' @param buttonsim Number of times "Simulate" button has been clicked
#' @param labellist List of labels for the variables 
#' @param solutionmethod Method for simulation (ctmc, dtmc, ode)
#' @param msim Number of simulations
#' @param method Method for ODE approximation
#' @param methodctmc Method for CTMC simulation
#' @param seedn Seed for the simulation 
#' 
#' @import GillespieSSA, deSolve, markovchain
#' @export


#Main Model for compartmentalizer
mainmodel <- function(diffeqlist, initlist, constantlist, timeval, buttonsim, labellist, solutionmethod,
                      msim, method, methodctmc, seedn){
  
  #Prepare inputted data for all models
  compartmentalizer <- Allprepare(initlist, constantlist, timeval)
  
  #Print model info
  Modelinfo(diffeqlist, initlist, compartmentalizer$omega, buttonsim, labellist, solutionmethod, 
            msim, timeval, method, methodctmc, seedn)
  
  #Check labels for non-emptyness
  labellist <- checklabels(labellist)
  
  #Start as NA                     
  diff_eqn <- data.frame(NA)
  
  #If method of solution is ODE
  switch(solutionmethod, 
         
         ODE = {
           
           #Try estimating ODE
           try({
             
             diff_eqn <- ode_from_model(diffeqlist, initlist, compartmentalizer$omega, 
                                        labellist, compartmentalizer$tspan, method)
             
           })
           
           #Return differential equation
           return(diff_eqn)
           
         },
         
         CTMC = {
           
           #Try estimating CTMC
           try({
             
             diff_eqn <- ctmc_from_model(diffeqlist, compartmentalizer$omega, initlist, 
                                         compartmentalizer$tspan, labellist, timeval, 
                                         msim, seedn, methodctmc)
             
           })
           
           #Return ctmc mean
           return(diff_eqn)
           
         },
         
         #Discrete Time Markov Chain
         DTMC = {
           
           #Try to do dtmc
           try({
             
             diff_eqn <- dtmc_from_model(diffeqlist, initlist, compartmentalizer$tspan, 
                                         compartmentalizer$omega, labellist, msim, seedn)
             
           })
           
           return(diff_eqn)
           
         },
         
         #Everything else
         {
           return(data.frame(NA))
         })
}