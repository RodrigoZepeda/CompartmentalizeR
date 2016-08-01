#' @title Discrete Time Markov Chain Inputs
#' 
#' @description Function that prepares input for DTMC algorithm from package \code{markovchain}
#' 
#' @param labellist   Vector of labels for each variable
#' @param omega       Matrix of probabilities
#' @param initlist    Vector of initial distribution
#' @param seed        Seed for the simulation
#' 
#' @return dtmcdat    Equations for \code{markovchain}
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' @examples 
#' 
#' @export
#' 

DTMCprepare <- function(labellist, omega, initlist, seed){
  
  #Set seed for simulation
  getseed(seed)
  
  #Check if any omega is negative
  if (any(omega < 0))
  {
    warning("Negative transition probabilities. Defaulting to 0")
    omega[which(omega < 0)] <- 0
  }
  
  #Check that matrix is stochastic
  rowones <- rowSums(omega)
  
  #If rows do not sum to 1 send warning
  if (length(which(rowones != 1)) > 0){
    
    #Send warning
    warning("Transition probabilities do not sum to 1... Attempting to fix issue")
    
    #Normalizing the probabilities to sum 1
    for (i in which(rowones != 1)){
      
      if (rowones[i] != 0){
        omega[i,] <- omega[i,] / rowones[i]
      } else {
        omega[i,i] <- 1
      }
    }
  }
  

  
  #Check that initial distribution sums to 1
  initsum <- sum(initlist)
  
  #Normalize to sum 1
  if (initsum != 1){
    
    #Send warning
    warning("Initial distribution was not a probability... Attempting to fix issue")
    
    #Check that not all individuals are 0
    if (sum(initlist) == 0){
      
      #Add all individuals the same
      initlist <- rep(1, length(initlist))
      
      #Warn user
      warning("No individuals specified... Assuming uniform distribution")
      
    }
    
    #Normalize
    initlist <- initlist / sum(initlist)
    
  }
  
  return(list(labellist = labellist,
              omega     = omega,
              initlist  = initlist))
  
  
}