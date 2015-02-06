howMuchRAM <-function(ncol, nrow, cushion=3){
  #40 bytes per col
  colBytes <- ncol*40
  
  #8 bytes per cell
  cellBytes <- ncol*nrow*8
  
  #object.size
  object.size <- colBytes + cellBytes
  
  #RAM
  RAM <- object.size*cushion
  cat("Your dataset will have up to", format(object.size*9.53674e-7, digits=1), "MB and you will probably need", format(RAM*9.31323e-10,digits=1), "GB of RAM to deal with it.")
  result <- list(object.size = object.size, RAM = RAM, ncol=ncol, nrow=nrow, cushion=cushion)
}