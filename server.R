#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

#load required packages
library(shiny);
library(dplyr);

#build dataframe for creating plot
data(mtcars);

#Define server logic required to draw the plot
shinyServer(function(input, output) {
  ###############################################################
  # Whenever we assign a variable using reactive() call,
  # We are merely defining a function rather than a variable.
  # In order to use that value later, we must use a function
  # call, e.g. hp1() and wt1() syntax
  ###############################################################
  
  mdl1   = glm(data = mtcars, mpg ~ wt+hp);

  wt1 = reactive({
    as.numeric(input$wt)/1000.0
  })

  hp1 = reactive({
    as.numeric(input$hp)
  })
  
  mpgpred = reactive ({
    sum1   = summary(mdl1);
    intrcpt = sum1$coefficients[1, 1];
    coef_wt = sum1$coefficients[2, 1];
    coef_hp = sum1$coefficients[3, 1];
    intrcpt + wt1() * coef_wt + hp1() * coef_hp;
      # Note how we use wt1() and hp1() syntax.
    
    # the last expression becomes the value of mpgpred() in future.
  })

  output$mpg_pred <- renderText({
    paste("<br/><br/><br/>",
          "<h3><font color='blue'>The predicted MPG is<br/><br/></font>",
          "<h2><font color='red'>", mpgpred(), "</font>")});

})