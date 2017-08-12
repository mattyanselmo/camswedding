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
            type = 'l', lwd = 2, col = 'green', xlim = c(2005, 2017), ylim = c(-10, 10),
            main = "Cam's Utility Score", xlab = 'Year', ylab = 'Utility')
     } else{
       plot(plotdata$Year[plotdata$Year < 2050], plotdata$UtScore[plotdata$Year < 2050],
            type = 'l', lwd = 2, col = 'green', xlim = c(2005, 2050), ylim = c(-10, 50),
            main = "Cam's Utility Score", xlab = 'Year', ylab = 'Utility')
       lines(c(2017, 2050), c(plotdata$Utscore[plotdata$Year == 2017], plotdata$Utscore[plotdata$Year == 2017] + 45),
             col = 'green', lwd = 2, lty = 2)
       
     }
   } else{
     if(!input$projection){
       plot(plotdata$Year, plotdata$LifeScore,
            type = 'l', lwd = 2, col = 'green', xlim = c(2005, 2017), ylim = c(-10, 10),
            main = "Cam's Utility Score", xlab = 'Year', ylab = 'Utility')
     } else{
       plot(plotdata$Year[plotdata$Year < 2050], plotdata$LifeScore[plotdata$Year < 2050],
            type = 'l', lwd = 2, col = 'green', xlim = c(2005, 2050), ylim = c(-10, 50),
            main = "Cam's Utility Score", xlab = 'Year', ylab = 'Utility')
       lines(c(2017, 2050), c(plotdata$Lifescore[plotdata$Year == 2017], plotdata$Lifescore[plotdata$Year == 2017] + 45),
             col = 'green', lwd = 2, lty = 2)
       
     }
     
   }
    
  })
})