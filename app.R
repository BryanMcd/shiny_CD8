library(shiny)
library(ggplot2)

counts <- readRDS("counts.RDS")

server <- function(input, output) {
  
  observe({
    if (input$password=="kaechlab"){
      req(input$go)
      output$counts <- renderPlot(ggplot(counts[grepl(paste0(input$Gene, "$"), counts$variable),], 
                                     aes(x=Organ, y=value)) + 
                                geom_boxplot(aes(color=Organ)) + 
                                geom_point() + 
                                facet_grid(.~CD69facet) + theme_bw() +
                                theme(axis.text.x = element_blank(), 
                                      axis.title.x = element_blank(),
                                      axis.ticks = element_blank(),
                                      plot.title = element_text(size = 20, face = "bold"),
                                      strip.text = element_text(size=15, face = "bold")) +
                                  labs(y="Normalized Counts") +
                                ggtitle(input$Gene)
          )
    }
    })
}

shinyApp(ui = ui, server = server)
