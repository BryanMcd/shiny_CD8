load("dds.rdata")
library(shiny)
library(DESeq2)
library(ggplot2)
options(repos = BiocInstaller::biocinstallRepos())

server <- function(input, output) {
  output$counts <- renderPlot(ggplot(plotCounts(dds, gene=input$Gene, intgroup = "Organ", returnData = T), aes(x=Organ, y=count)) + 
                                geom_boxplot(aes(color=Organ)) + geom_point() + facet_grid(.~dds$CD69facet) +
                                theme(axis.text.x = element_blank(),
                                      axis.title.x = element_blank(),
                                      axis.ticks = element_blank(),
                                      plot.title = element_text(size = 20, face = "bold")) +
                                ggtitle(input$Gene)
  )
}
