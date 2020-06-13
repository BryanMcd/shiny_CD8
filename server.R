library(shiny)
library(ggplot2)

counts <- readRDS("counts.RDS")
#options(repos = BiocInstaller::biocinstallRepos())

server <- function(input, output) {
  output$counts <- renderPlot(ggplot(counts, aes(x=Organ, y=value)) + 
                                geom_boxplot(aes(color=Organ)) + geom_point() + facet_grid(~CD69facet) +
                                theme(axis.text.x = element_blank(),
                                      axis.title.x = element_blank(),
                                      axis.ticks = element_blank(),
                                      plot.title = element_text(size = 20, face = "bold")) +
                                ggtitle(input$Gene)
  )
}
