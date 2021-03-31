# -----------------------------------------------
# Shiny App first attempt
# # 31 Mar 2021
# FMSM
# -----------------------------------------------
# 
library(shiny)
library(ggplot2)
mcart <- read.csv("characters.csv")
select_values <- colnames(mcart)
select_values

ui <- fluidPage(
  selectInput( 
      inputId = "y_var",
      label = "Variable",
      choices = select_values,
      selected = "Speed"),
  plotOutput(outputId = "plot")
)
  


server <- function(input, output){
  output$plot <- renderPlot({
    ggplot(data=mcart, aes_string(x='Character',
          y=input$y_var, fill="Class")) +
          geom_bar(stat="identity", width=0.8) +
          labs(x="Character", y=input$y_var) + coord_flip()
  
})
}

shinyApp(ui = ui, server = server)


