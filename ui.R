#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# UI for application 
shinyUI(fluidPage(
  
  titlePanel("Vehicle MPG prediction from weight and horsepower"),
  sidebarLayout(
    sidebarPanel(
      h3 ("Vehicle Horsepower"),
      sliderInput(inputId = "hp",
                  label   = "Horsepower",
                  min     = 20,
                  max     = 300,
                  value   = 100
      ),
      
      h3 ("Verhicle Weight"),
      
      sliderInput(inputId = "wt",
                  label   = "Weight in lbs",
                  min     = 1000,
                  max     = 5000,
                  value   = 2000
      ),

      submitButton("Predict MPG")

    ),

    mainPanel(
      htmlOutput("mpg_pred")
    )
  )
))
