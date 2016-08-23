step <- function(state,size=nrow(state)) {
  
  ##Idea taken from Petr Keils blog petrkeil.com/?p=236
  
  #Transformation and shifting for calculating rules
  allW = cbind( rep(0,size) , state[,-size] )
  allNW = rbind(rep(0,size),cbind(rep(0,size-1),state[-size,-size]))
  allN = rbind(rep(0,size),state[-size,])
  allNE = rbind(rep(0,size),cbind(state[-size,-1],rep(0,size-1)))
  allE = cbind(state[,-1],rep(0,size))
  allSE = rbind(cbind(state[-1,-1],rep(0,size-1)),rep(0,size))
  allS = rbind(state[-1,],rep(0,size))
  allSW = rbind(cbind(rep(0,size-1),state[-1,-size]),rep(0,size))
  
  # Summation of the matrices
  X2 <- allW + allNW + allN + allNE + allE + allSE + allS + allSW
  
  # Rules of GOL
  new_state <- state
  new_state[state==0 & X2==3] <- 1
  new_state[state==1 & X2<2] <- 0
  new_state[state==1 & X2>3] <- 0
  
  return(new_state)
  
}

