ui <- fluidPage(
  titlePanel("Gene Expression in Human CD8 T cells"),
  
  sidebarLayout(
    sidebarPanel(
      h4("GSE94964 & GSE106420 Merged"),
      br(),
      passwordInput("password", "Enter Password:", value = ""),
      actionButton("go", "Submit"),
      verbatimTextOutput("value"),
      br(),
      selectInput(inputId = "Gene", label = "Gene Input", 
                  choices = levels(counts$variable), 
                  selected = "ICOS", 
                  multiple = FALSE,
                  selectize = TRUE, 
                  width = NULL, 
                  size = NULL),
      submitButton("Update Plot")
      ),
    
    mainPanel(
      plotOutput("counts")
      )
    )
)
