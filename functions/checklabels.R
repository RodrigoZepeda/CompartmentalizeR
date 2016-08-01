#' @title Check Labels
#' 
#' @description Function to check that the labels in the model are non-empty
#' 
#' @param labellist  List of the labels in the model
#' @return labellist List of the labels in the model (without duplicates and empty labels)
#' @export

checklabels <- function(labellist){
  #Check that labellist is nonempty (if empty add label)
  for (i in 1:length(labellist)){
    
    #Remove spaces from labels
    label <- gsub("[[:space:]]", "", labellist[i])
    
    #If label is empty, add label according to variable number
    if(label == ""){
      labellist[i] <- paste0("x",i)
    }
    
  }
  
  
  #Remove possible duplicated variables (if user named xi what we consider variable xj)
  dups <- duplicated(labellist)
  while(any(dups)){
    
    #Relabel duplicates
    labellist[dups] <- paste0(labellist[dups],"_",1:length(which(dups)))
    
    #Check if no more duplicates available
    dups <- duplicated(labellist)
    
  }
  
  return(labellist)
}