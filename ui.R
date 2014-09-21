shinyUI(pageWithSidebar(
    headerPanel("Predict the Price of Your Car"),
    sidebarPanel(
        selectInput("carType", "Choose a car type:", 
                    choices = c("convertible","coupe","hatchback","sedan","wagon")),
        selectInput("carMake", "Choose a car manufacturer:", 
                    choices = c("Buick","Cadillac","Chevy","Pontiac","Saab","Saturn")),
        textInput(inputId="Mileage", label = "Input Mileage (from 0 to 60000)"),
        textInput(inputId="Cylinder", label = "Input Number of Cylinder"),
        textInput(inputId="Doors", label = "Input Number of Doors"),
        selectInput("Cruise", "With Cruise Control", choices = c(TRUE,FALSE)),
        selectInput("Sound", "With Upgraded Speakers", choices = c(TRUE,FALSE)),
        selectInput("Leather", "With Leather Seats", choices = c(TRUE,FALSE)),
  
        
        submitButton("Submit")
    ),
    mainPanel(
        p('Regression Coefficients'),
        verbatimTextOutput('text1'),
        p('Valid Input'),
        verbatimTextOutput('text2'),
        p('Predicted Price'),
        verbatimTextOutput('text3'),
        plotOutput('residuePlot'),
        #helpText("Note: The input values in the text box should be integers with no space; blank or non-integer inputs will be regarded as invalid ones and ignored.\n"),
        #a("Click Here for the Documentation of this Application", href="http://www.sina.com"),
        #helpText(" "),
        #a("Click Here for the Code of this Application in Github", href="https://github.com/szywind/Project-shiny-app")
    
        p(em("Documentation:",a("Click Here for the Documentation of this Application",href="index.html"))),
        p(em("Codes:",a("Click Here for the Code of this Application in Github", href="https://github.com/szywind/Project-shiny-app")))
        
    )  

))