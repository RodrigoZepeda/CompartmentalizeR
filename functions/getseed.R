#' @title Get seed
#' 
#' @description Function that sets the seed for stochastic simulation
#' 
#' @param seed   Number with the seed to be specified by user
#' 
#' 
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' @examples 
#' getseed(124726)
#' rnorm(1)
#' rnorm(1)  #This rnorm differs from the top one
#' getseed(124726)
#' rnorm(1) #Check that the third rnorm is the same as the first one due to seed
#' 
#' @export
#' 

getseed <- function(seed = NA){
  
  #If user specifies seed, set it
  if (!is.na(seed)){
    
    set.seed(floor(seed))
    
  }
}