#' @title Get theme
#' 
#' @description Function for assigning theme to model plot
#' 
#' @param modelplot ggplot object
#' @param themechoice String with the theme chosen
#' 
#' @return modelplot ggplot object with additional theme given by \code{themechoice}
#' @export

getTheme <- function(modelplot, themechoice)
{
  switch(themechoice,
         Gray       = {modelplot <- modelplot + theme_grey()},
         White      = {modelplot <- modelplot + theme_bw()},
         Classic    = {modelplot <- modelplot + theme_classic()},
         Minimal    = {modelplot <- modelplot + theme_minimal()},
         Dark       = {modelplot <- modelplot + theme_dark()},
         Light      = {modelplot <- modelplot + theme_light()},
         {modelplot + theme_bw()}
  )
  
  return(modelplot)
}

