# server.R

library(maps)
library(mapproj)
counties <- readRDS("data/counties.rds")
source("helpers.R")

shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      data <- switch(input$var, 
                     "Percent White" = counties$white,
                     "Percent Black" = counties$black,
                     "Percent Hispanic" = counties$hispanic,
                     "Percent Asian" = counties$asian)
      color <- switch(input$var,
                      "Percent White" = 'darkgreen',
                      "Percent Black" = 'darkblue',
                      "Percent Hispanic" = 'red',
                      "Percent Asian" = 'purple')
      
      percent_map(var = data, color = color, legend.title = input$var, max = input$range[2], min = input$range[1])
    })
  }
)