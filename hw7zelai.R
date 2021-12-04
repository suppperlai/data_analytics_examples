library(shiny)

# STEP: LOAD DATA
## 1 Set working directory
## 2 Load data 
data(iris)
head(iris)
## 3 Clean data
#dont need because all values are numeric.


# STEP: DEFINE UI

#Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("IRIS"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("colors",
                  "Select a color:",
                  c("red","blue","yell","black")),
      h2("Click on the button above to seowlcet a color")
    ),
    
    
    
    mainPanel(
      plotOutput("hurrPlot"),
      
    )
    
  )
)



# Define server logic required to create our graph
server <- function(input, output) {
  
  output$hurrPlot <- renderPlot({
    library(ggplot2)
    irisgraph2 <- ggplot(data=iris, aes(x = iris$Sepal.Width, y=iris$Sepal.Length, color=iris$Sepal.Width)) + 
      #geom_line(linetype = "dashed")+ #This is a line graph, but we have too many points for that currently. 
      geom_point()+ #This adds the initial points
      theme(axis.text.x=element_text(angle=45,hjust=1,vjust=0.5))+
      scale_color_gradient(low=input$colors, high="red")+ #Create a color scale to show high wind speed
      theme(legend.position='bottom')+ #Put the legend on the bottom
      ylab("Maximum Wind (knots)")+ #Change the y-label
      ggtitle("Sepal.Width and Sepal.Length sitribution ")+ #Add a title
      theme(plot.title = element_text(lineheight=.8, face="bold")) #Modify the title
    irisgraph2
  })
}

# Run the application 
shinyApp(ui = ui, server = server)