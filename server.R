shinyServer(function(input, output) {
  
  output$utilityplot <- renderPlot({
    
   plotdata <- friends %>%
     filter(Friend %in% c(input$camsfriends, 'Kirsten'[input$KsCheckbox])) %>%
     group_by(Year) %>%
     summarize(UtScore = sum(UtScore),
               LifeScore = sum(LifeScore))
   
   if(input$score == 'Utility'){
     if(!input$projection){
       plot(plotdata$Year, plotdata$UtScore,
            type = 'l', lwd = 3, col = 'blue', xlim = c(2005, 2017), ylim = c(-6, 6),
            main = "Cam's Utility Score", xlab = 'Year', ylab = 'Utility')
     } else{
       plot(plotdata$Year[plotdata$Year < 2050], plotdata$UtScore[plotdata$Year < 2050],
            type = 'l', lwd = 3, col = 'blue', xlim = c(2005, 2050), ylim = c(-5, 50),
            main = "Cam's Utility Score", xlab = 'Year', ylab = 'Utility')
       lines(c(2017, 2050), c(plotdata$UtScore[plotdata$Year == 2017], plotdata$UtScore[plotdata$Year == 2017] + 45),
             col = 'blue', lwd = 3, lty = 2)
       
     }
   } else{
     if(!input$projection){
       plot(plotdata$Year, plotdata$LifeScore,
            type = 'l', lwd = 3, col = 'blue', xlim = c(2005, 2017), ylim = c(-6, 6),
            main = "Cam's Life Benefit Score", xlab = 'Year', ylab = 'Utility')
     } else{
       plot(plotdata$Year[plotdata$Year < 2050], plotdata$LifeScore[plotdata$Year < 2050],
            type = 'l', lwd = 3, col = 'blue', xlim = c(2005, 2050), ylim = c(-5, 50),
            main = "Cam's Life Benefit Score", xlab = 'Year', ylab = 'Utility')
       lines(c(2017, 2050), c(plotdata$LifeScore[plotdata$Year == 2017], plotdata$LifeScore[plotdata$Year == 2017] + 45),
             col = 'blue', lwd = 3, lty = 2)
       
     }
     
   }
   
   abline(h = 0, lwd = 2, lty = 2, col = 'black')
    
  }, height = 400, width = 600)
})