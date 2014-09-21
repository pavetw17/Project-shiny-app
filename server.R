library(shiny)
library(caret)
data(cars)

shinyServer(function(input, output) {
    
    dataProcess <- reactive({
        example<-data.frame(a = 1, b = 1)
        names(example)[1:2] <- c(input$carType,input$carMake)
        tmp <-c()
        if (!is.na(as.integer(input$Mileage))){
        #if (input$Mileage!=''){
            if ((as.integer(input$Mileage)==as.numeric(input$Mileage)) &
                (as.integer(input$Mileage)>=0)){
                tmp <- c(tmp,"Mileage")
                example <- data.frame(example,"Mileage"=as.integer(input$Mileage))
            }
        }
        if (!is.na(as.integer(input$Cylinder))){
            if ((as.integer(input$Cylinder)==as.numeric(input$Cylinder)) & 
                (as.integer(input$Cylinder)>=0)){
                tmp <- c(tmp,"Cylinder")
                example <- data.frame(example,"Cylinder"=as.integer(input$Cylinder))
            }
        }
        if (!is.na(as.integer(input$Doors))){
            if ((as.integer(input$Doors)==as.numeric(input$Doors)) &
                (as.integer(input$Doors)>=0)){
                tmp <- c(tmp,"Doors")
                example <- data.frame(example,"Doors"=as.integer(input$Doors))
            }
        }
        
        example<-data.frame(example,
                            'Cruise'=as.integer(input$Cruise=="TRUE"),
                            'Sound'=as.integer(input$Sound=="TRUE"),
                            'Leather'=as.integer(input$Leather=="TRUE"))
        print(example)
        myCars<-cars[,c("Price",input$carType,input$carMake,tmp,"Cruise","Sound","Leather")]
        fit <- lm(Price~., data = myCars)
        result <- predict(fit, example)
        return(list(fit = fit,example=example,result=result))
        
    })
    
    

 #   output$text1 <- renderText({length(input$Mileage)})
     
    output$text1 <- renderPrint({
        list <- dataProcess() 
        print(list$fit$coefficients)
    })
    output$text2 <- renderPrint({
        list <- dataProcess() 
        print(list$example)
    })   
    output$text3 <- renderPrint({
        list <- dataProcess() 
        print(list$result)
    })
    output$residuePlot <- renderPlot({
        list <- dataProcess()
        plot(predict(list$fit),resid(list$fit),pch='o',xlab = "prediction",ylab="resudue",main="residue plot")
    })

})

