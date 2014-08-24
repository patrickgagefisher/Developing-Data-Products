library(shiny)

# This ui creates a simple radio button array with slider
# for narrowing the display on population percentage.
shinyUI(fluidPage(
  titlePanel("Racial Demographic Breakdown by County (U.S.)"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("View county populations by racial demographic maps with 
        information from the 2010 US Census."),
      
      radioButtons("var", 
                  label = "Choose a variable to display",
                  choices = c("White - Population %", "Black - Population %",
                              "Hispanic - Population %", "Asian - Population %"),
                  selected = "White - Population %"),
      
      sliderInput("range", 
                  label = "Choose Your Range of interest (%):",
                  min = 0, max = 100, value = c(0, 100))
    ),
    
    mainPanel(plotOutput("map"))
  )
))