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
      textInput(inputId = "Gene", label = "Gene Input", width = "150px", value = "ICOS"),
      submitButton("Update Plot")
      ),
    
    mainPanel(
      plotOutput("counts")
      )
    )
)
