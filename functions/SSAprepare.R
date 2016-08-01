#' @title Stochastic Simulation Algorithm Inputs
#' 
#' @description Function that prepares input for Gillespie ssa algorithm from package \code{ssa}
#' 
#' @param labellist   Vector of labels for each variable
#' @param diffeqlist  Vector of equations in differential form
#' @param omega       Matrix of parameters
#' @param initlist    Vector of initial values
#' @param seed        Initial seed for the simulation
#' @param method      Simulation method. 
#' 
#' @return ssaeqs     Equations for \code{ssa}
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' @examples 
#' 
#' @export

SSAprepare <- function(labellist, diffeqlist, omega, initlist, seed = NA, method = "Direct"){
  
  #Set seed for simulation
  getseed(seed)
  
  #Get number of variables
  n <- length(initlist)
  
  #Change labels to x1,x2,...xi
  for (i in 1:n){
    
    labellist[i] <- paste0("x",i)
    
  }
  
  diffeqlist <- diffeqlist
  
  #Get equations in Gillespie form
  parammat       <- translator(diffeqlist,  n)
  
  #Names of xinit
  xinit          <- initlist
  names(xinit)   <- labellist
  
  
  #Check method
  if      (method == "Direct")            {methodssa <- "D"} 
  else if (method == "Explicit tau-leap") {methodssa <- "ETL"} 
  else if (method == "Binomial tau-leap") {methodssa <- "BTL"}
  else if (method == "Optimized tau-leap"){methodssa <- "OTL"}
  
  #Return everything
  return(list(xinit     = xinit,
              labellist = labellist,
              parammat  = parammat,
              methodssa = methodssa))
  
}

 
