#' @title Write Code
#' 
#' @description Function that writes a txt document with the R code to generate a modle
#' from CompartmentalizeR
#' 
#' @param con File
#' @param clibraries Libraries used for the model
#' @param rfunctions Functions from Github used for the model
#' @param varlist List of variables in plot 
#' @export

writecode <- function(con, clibraries, rfunctions, varlist)
 
{
  #Open file
  fileConn<-file(con, "w")
  
  #File intro
  writeLines("#Created with CompartmentalizeR: Compartmental models for R", fileConn)
  writeLines(paste0('#',R.version.string), fileConn)
  writeLines(paste0('#Date: ',Sys.Date()), fileConn)
  
  #Clear variables
  writeLines("\n#Clear all", fileConn)
  writeLines("#rm(list = ls())", fileConn)
  
  #Libraries of file
  writeLines('\n#First we call the necessary libraries', fileConn)
  for (lib in clibraries){
    writeLines(paste0("library(", lib,")"), fileConn)  
  }
  
  #Source the other functions
  writeLines('\n#Source additional functions', fileConn)
  for (fun in rfunctions){
    writeLines(paste0("#source(", fun,")"), fileConn)  
  }
  
  #Get the initial values
  writeLines('\n#Inputed values', fileConn)
  writeLines(paste0("varlist <- ", paste0(capture.output(dput(varlist)), collapse = "")), fileConn)
  for (varnom in names(varlist))
  {
    writeLines(paste0(varnom," <- varlist$",varnom), fileConn)
  }
  
  #Run the model
  writeLines('\n#Running the model', fileConn)
  writeLines(paste0('modelresult <- mainmodel(deqs, incon,', 
                    'ct, time, btn, labelist,', '
                    sol, nsim, methodode, methodssa, seed)'), fileConn)
  
  #Save the data
  writeLines('\n#Saving the data (uncomment here and change file name)', fileConn)
  writeLines("#write.csv(modelresult, file = 'results.csv', row.names = FALSE)", fileConn)
  
  #Create the plot
  writeLines('\n#Creating the plot associated to the model (uncomment last line to save)', fileConn)
  writeLines('getPlot(modelresult, ptitle, pxlab, pylab, ppalette, ptheme, pvars)', fileConn)
  writeLines('#ggsave("myplot.pdf")', fileConn)
  
  
  #Close the file
  close(fileConn)
}