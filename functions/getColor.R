#' @title Get color
#' 
#' @description Function for assigning color palette to model plot
#' 
#' @param nvars Number of variables in color palette to assign
#' @param colorchoice String with the color chosen
#' 
#' @return colors Vector with \code{nvars} different colors
#' @export

getColor <- function(colorchoice, nvars)
{
  switch(colorchoice,
         Grayscale       = {colors <- colorRampPalette(c("lightslategray", "black"))(nvars)},
         Red             = {colors <- colorRampPalette(c("purple","tomato3"))(nvars)},
         Blue            = {colors <- colorRampPalette(c("royalblue1",     "deepskyblue4"))(nvars)},
         Green           = {colors <- colorRampPalette(c("green",          "forestgreen"))(nvars)},
         Rainbow         = {colors <- rainbow(nvars)},
         Heat            = {colors <- heat.colors(nvars)},
         Terrain         = {colors <- terrain.colors(nvars)},
         Topo            = {colors <- topo.colors(nvars)},
         CM              = {colors <- cm.colors(nvars)},
         {colors <- rainbow(nvars)}
         
  )
  return(colors)
}