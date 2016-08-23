
library(shiny)
library(ggplot2)
library(tools)
source('gol.R')
source('step.R')





shinyServer(function(input, output,session) {
  
  
  
  # Generacion de grid
  size <- 20	
  iter <- 20
  counter <- 0
  counter2 <- 0
  grid <- expand.grid(1:size,1:size)
  g <- matrix(rbinom(size^2,0,1),size,size)
  
  
  #Observe events of pushing the buttons and assign values
  
  
  values <- reactiveValues()
  
  observeEvent(input$random_start, {
    
    prob_ini = 0.3
    ini_state = rbinom(size^2,1,prob_ini)
    mat <- matrix(ini_state,size,size)
    values$iter <- input$iter
    g <<- mat # Generally considered a bad idea, but the <<-  works nicely for this app. Should be a reactiveValues solution but havent worked it out just yet
    counter <<- 1 
    counter2 <<- 0
    
  })
  

  
  observeEvent(input$exploder, {
    
    ini_state = rep(0,size^2)
    mat <- matrix(ini_state,size,size)
    mat[10,10] <- 1
    mat[11,9:11] <- 1
    mat[12,c(9,11)] <- 1
    mat[13,10] <- 1
    values$iter <- input$iter
    g <<- mat 
    counter <<- 1 
    counter2 <<- 0
    
    
  })
  
  observeEvent(input$spaceship, {
    
    ini_state = rep(0,size^2)
    mat <- matrix(ini_state,size,size)
    mat[6,2:5] <- 1
    mat[7,c(1,5)] <- 1
    mat[8,5] <- 1
    mat[9,c(1,4)]<-1
    values$iter <- input$iter
    g <<- mat 
    counter <<- 1 
    counter2 <<- 0
    
    
  })
  
  observeEvent(input$glider, {
    
    ini_state = rep(0,size^2)
    mat <- matrix(ini_state,size,size)
    mat[1,2] <- 1
    mat[2,3:4] <- 1
    mat[3,2:3] <- 1
    values$iter <- input$iter
    g <<- mat 
    counter <<- 1 
    counter2 <<- 0
    
    
  })
  

  
  
  output$distPlot <- renderPlot({
    
    
    if (counter == 0) {
      
    } else {
      grid$val <- c(g)
      print(gol(grid))
      g <<- step(g) # Same thing, because it iterates over an updated grid, it won't work unless I update on the parent environment. Update reactiveVal inside renderPlot possible?
      counter2 <<- counter2 + 1
      
    }
    
    
    
    if (is.numeric(values$iter) && counter2 < values$iter) {
      invalidateLater(1000,session)
    } else {
        values$iter<-NA
    }
    
    
    
    
    
    
  })
  
  
  
  
  
})