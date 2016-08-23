# UI

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  tags$style(type="text/css",
             "#distPlot.recalculating {opacity: 10.0;}"
  ),
  
  # Application title
  titlePanel("Game of life"),
  
  br(),br(),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      h3('Idea'),
      p('By pressing the START! button you will spawn a grid of cells. The grid represents the position and current state of a cell, which can be alive or dead.
        After that, every period they will die, live or spawn following John Conways
        original GoL rules. Depending on your luck, you will see chaotic behavior, stability or 
        emergent complexity.', align = 'justify'),
      
      
      numericInput("iter",
                   label = h3("Number of iterations"),
                   value = 10),
      
      br(),
      
      actionButton("random_start", label = "START!"),
      
      br(),br(),br(),br(),
      
      p('Or initialize it with one of the various creatures of the GoL'),
      
      actionButton("exploder", label='Small Exploder'),
      
      actionButton("glider", label='Glider'),
      
      actionButton("spaceship", label='Spaceship')
      
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
    )
  ))