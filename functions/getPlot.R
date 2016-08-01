#' @title GetPlot
#' 
#' @description Function for retrieving the ggplot 
#' 
#' @param  plottitle Title of plot
#' @param  plotxlab  X label of plot
#' @param  plotylab  Y label of plot
#' @param  dplot Data for plot. First column represents the x variable; the other columns the y variable
#' @param  collist    List of the columns to include in plot
#' @param  colorchoose  Choice of color
#' @param  themechoose  Choice of theme
#' 
#'  
#' @return  modelplot     Ggplot of model
#' @import  reshape
#' @author Rodrigo Zepeda \email{rzepeda17@gmail.com}
#' @examples 
#' 
#' @export
#' 

getPlot <- function(dplot, plottitle ="", plotxlab ="", plotylab ="", 
                    colorchoose ="Red", themechoose = "Grey", collist = colnames(dplot)[-1] ){
   
  #Check that dplot has variables
  if (nrow(dplot) == 1 & is.na(dplot[1,ncol(dplot)]) )
  {
    modelplot <- ggplot(as.data.frame(c())) + annotate("text", x = 0, y = 0, label ="NO VARIABLES IN PLOT") + theme_bw()
    
  } else {
    
    #Create subset 
    subdplot                <- dplot[ ,c("Time", collist)]
    
    #Melt variables
    dplot_long              <- melt(subdplot, id.vars= "Time" )
    colnames(dplot_long)[2] <- "Variables"  #To make shape and color appear the same
    
    #Create plot
    modelplot  <- ggplot(dplot_long, aes(x = Time, y = value, color = Variables)) + 
      geom_point(aes(shape = Variables)) + geom_line() +
      scale_color_manual("Variables", values = getColor(colorchoose, length(collist)))
  }
  
  #Assign title and labs
  modelplot <-  modelplot + ggtitle(plottitle) + xlab(plotxlab) + ylab(plotylab)  
  
  #Assign theme
  modelplot <- getTheme(modelplot, themechoose)
  
  
  
  return(modelplot)
  
}