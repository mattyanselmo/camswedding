shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
      radioButtons('score',
                   label = 'Life metric of interest:',
                   choices = c('Utility', 'Life Benefit')),
      checkboxGroupInput('camsfriends',
                         label = "See effect of Cam's frends:",
                         choices = c('Austin', 'Drew', 'Jerwei', 'Matthias', 'Tony', 'Zach'),
                         selected = 'Matthias'),
      actionButton('KsButton', "DON'T PRESS THIS YET!"),
      conditionalPanel(condition = 'input.KsButton > 0',
                       checkboxInput('KsCheckbox',
                                     label = "See effect of Kirsten?",
                                     value = F)
      ),
      conditionalPanel(condition = 'input.KsButton > 0',
                       checkboxInput('projection',
                                     label = "See projection?",
                                     value = F)
      )),
      
      mainPanel(
        plotOutput("utilityplot")
      )
    )
  )
)


