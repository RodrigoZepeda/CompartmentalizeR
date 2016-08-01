#' @title CTMC from Model
#' 
#' @description Function for simulating continuous time markov chains from CompartmentalizeR
#' 
#' @param  omega Matriz of constants
#' @param  diffeqlist Matrix of propensity equations in R format
#' @param  initlist List of initial values
#' @param  tspan Time span for estimation
#' @param  labellist    List containing variable labels                
#' @param  timeval      Values for time with step-size (timeval$tstep) and maximum time (timeval$tmax)
#' @param  msim         Number of simulations to conduct
#' @param  seedn        Seed for CTMC simulation
#' 
#' @param methodctmc    Method for simulationg CTMC
#'  
#' @return diff_eqn     Mean of CTMC simulations
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' 
#' @export
#' 

ctmc_from_model <- function( diffeqlist, omega, initlist, tspan, labellist, timeval, msim, seedn, methodctmc){
  
  #Create matrix for output
  ncols    <- length(labellist) + 1
  diff_eqn <- matrix(c(0, initlist), nrow = length(tspan), ncol = ncols, byrow = TRUE)
  
  #Collapse by rows the table to feed to plots and table
  diff_eqn[,1]       <- tspan
  colnames(diff_eqn) <- c("Time",labellist)
  
  # Prepare for simulation
  ssaeqs    <- SSAprepare(labellist, diffeqlist, omega, initlist, seedn, methodctmc)
  
  #Omega needs to be global so ssa can find it
  omega     <<- omega
  
  #Check that there actually are equations
  if (!is.null(ssaeqs$parammat$eqs)){
    
    #Create msim simulations
    for (j in 1:msim){
      
      # Simulate data
      modelctmc <- ssa(x0 = ssaeqs$xinit, a = ssaeqs$parammat$eqsystem, nu = ssaeqs$parammat$nu, parms = c(), tf = timeval$tmax, method = ssaeqs$methodssa)
      
      #Check that we have simulated something 
      if (nrow(modelctmc$data) > 2){
      
        # Approximate simulated data
        gillespiedata     <- matrix(NA, nrow = length(tspan), ncol = length(ssaeqs$xinit) + 1)
        gillespiedata[,1] <- tspan
        
        #Approximate data
        for (i in 1:length(ssaeqs$xinit)){
          
          gillespiedata[,i+1] <- approxfun(modelctmc$data[,1], modelctmc$data[,i+1], rule = 2)(tspan)
          
        }
        
        #Add in order to average later
        diff_eqn[,2:(ncols)] <- (1/msim)*gillespiedata[,2:(ncols)] + diff_eqn[,2:(ncols)]
        
      }
    }
  }
  
  #Remove omega from global
  rm(list = "omega", envir = globalenv())
  
  #Diff eqn as data frame for list
  diff_eqn <- as.data.frame(diff_eqn)
  
  return(diff_eqn)
  
}