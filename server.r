library(shiny)

# These libraries should be installed before running,
# as well as the Shiny library.
library(maps)
library(mapproj)
counties <- readRDS("data/counties.rds")
source("helpers.R")

shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      data <- switch(input$var, 
                     "White - Population %" = counties$white,
                     "Black - Population %" = counties$black,
                     "Hispanic - Population %" = counties$hispanic,
                     "Asian - Population %" = counties$asian)
      
      color <- switch(input$var, 
                      "White - Population %" = "skyblue",
                      "Black - Population %" = "darkgray",
                      "Hispanic - Population %" = "darkred",
                      "Asian - Population %" = "darkorange")
      
      legend <- switch(input$var, 
                       "White - Population %" = "% White",
                       "Black - Population %" = "% Black",
                       "Hispanic - Population %" = "% Hispanic",
                       "Asian - Population %" = "% Asian")
      
      percent_map(var = data, 
                  color = color, 
                  legend.title = legend, 
                  max = input$range[2], 
                  min = input$range[1])
    })
  }
)