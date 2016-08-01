#' @title Discrete Time Markov Chain Simulation
#' 
#' @description Function that simulates \code{msim} Discrete Time Markov Chains 
#' from a transition matrix \code{alpha}
#' 
#' @param msim        Number of simulations
#' @param alpha       Vector of equations in differential form
#' @param initlist    Initial distribution of probabilities
#' @param labellist   Names of the labels (states)
#' @param tspan       Time period for simulation
#' 
#' @return diff_eqn   Average of simulated data for \code{tspan}
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' 
#' 
#' @export
 
DTMCsolver <- function(msim, alpha, initlist, labellist, tspan){
  
  #Create discrete time Markov Chain
  mc_DTMC <- new("markovchain", states = labellist, transitionMatrix = alpha, name = "DTMC")

  #Matrix for saving results
  matDTMC  <- matrix("",nrow = length(tspan), ncol = msim)
  ncols    <- length(labellist) + 1
  diff_eqn <- matrix(0, nrow = length(tspan), ncol = ncols)
  
  #Simulate msim Markov Chains
  for (i in 1:msim){
    
    matDTMC[,i] <- rmarkovchain(n = length(tspan)-1, object = mc_DTMC,  t0 = sample(labellist, 1, prob = initlist), include.t0 = TRUE)
    
  }

  #Collapse by rows the table to feed to plots and table
  diff_eqn[,1]       <- tspan
  colnames(diff_eqn) <- c("Time",labellist)

  #Average the results
  for (i in 1:nrow(matDTMC)){
    
    #Tabulated data 
    tabdata <- as.data.frame(table(matDTMC[i,])/msim, stringsAsFactors = FALSE)
    
    #Add to dataset
    for (j in 1:length(labellist))
    {
      #Check if data exists and average it 
      if (labellist[j] %in% tabdata$Var1)
      {
        pos <- which(tabdata$Var1 == labellist[j])
        diff_eqn[ i, j + 1] <- tabdata[pos, 2]
      }
    }
  }
  
  #Convert to data frame for plot
  diff_eqn <- as.data.frame(diff_eqn)
  
  return(diff_eqn)
  
}
