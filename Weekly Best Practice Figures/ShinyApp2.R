# -----------------------------------------------
# Shiny App 2
# # 31 Mar 2021
# FMSM
# -----------------------------------------------
# 

library(shiny)
library(ggplot2)
#setwd
setwd("C:/Users/frank/OneDrive/Desktop/R CSVs")

#Read CSV
read.csv("eider.down.csv")
eider<-read.csv("eider.down.csv", fileEncoding="UTF-8-BOM")
#Create data.frame
eider.df<-data.frame(eider)

#remove excess rows (not sure why they read this way)
eider.df1<- eider.df[-c(21:43),]
eider.df1

select_values <- colnames(eider.df1)
select_values

ui <- fluidPage(
  selectInput( 
    inputId = "y_var",
    label = "Variable",
    choices = select_values,
    selected = "expanded.nodes"),
  plotOutput(outputId = "plot")
)



server <- function(input, output){
  output$plot <- renderPlot({
    ggplot(data=eider.df1, aes_string(x='Population',
                                  y=input$y_var)) +
      geom_boxplot() +
      labs(x="Character", y=input$y_var) 
  })
}

shinyApp(ui = ui, server = server)
