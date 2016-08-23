gol <- function(df){
  
  # Plot
    ggplot(df,aes(Var1,Var2))+ 
    geom_tile(aes(fill = val),colour="black")+ 
    guides(fill = FALSE)+
    theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())+ 
    theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ 
    theme(aspect.ratio=1)
  
  
  
}