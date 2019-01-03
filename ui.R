library(shiny)

shinyUI(fluidPage (
        titlePanel(title = "Predict Mean Ozone - Dataset: datasets::airquality"),
        h4("Instruction:"),
        h5("- Select a prediction model from the radio button (either Temperature or Wind Speed)."),
        h5("- For Temperture (Wind, resp.): choose your desired value from the temperature (wind, resp.) slider."),
        h5("- The app will show an appropriate plot with the corresponding linear model."),
        h5("- Moreover, it will predict the Ozone quality based for your choice."),
        
        sidebarLayout(
                sidebarPanel(
                        radioButtons("radio", label = "Choose a prediction model based on:", 
                                     choices = c("Temprature (Ozone ~ Temp)" = 1, "Wind Speed (Ozone ~ Wind)" = 2),
                                     selected = "1"
                        ),
                        sliderInput("sliderTemp", "What is the Temperature (fahrenheit)?", 50, 110, value = 59),
                        sliderInput("sliderWind", "What is the Wind Speed (miles/hour)?", 0, 15, value = 5)
                ), 
                mainPanel(
                        h4("Predicted Mean Ozone from Model 1:"), 
                        textOutput("pred1"),
                        h4("Predicted Mean Ozone from Model 2:"), 
                        textOutput("pred2"),
                        plotOutput("plot1")

                )
        )
))