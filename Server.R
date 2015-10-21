library(shiny)
library(datasets)
library(ggplot2)
require(stats); require(graphics)
 fmAll <- function() 
			nls(circumference ~ SSlogis(age, Asym, xmid, scal), data = Orange, subset = Tree)
 fm1 <- function(treeno) 
			nls(circumference ~ SSlogis(age, Asym, xmid, scal), data = Orange,
															    subset = Tree == treeno)
 treecoplot <- function () 
			coplot(circumference ~ age | Tree, data = Orange,
											   show.given = FALSE)

# Define server logic for random distribution application
shinyServer(function(input, output) {
  
  # get tree no input
  output$o_treeno <- renderPrint({input$orangetreeno})
  # get age input
  output$o_age <- renderPrint({input$n})
  # print nls output tree wise if "All" tree select then get all tree data
  output$o_rm <- renderPrint({if (input$orangetreeno == 'All')
										fmAll()
						      else fm1(input$orangetreeno)})
  # print nls summary tree wise if "All" tree select then get all tree data
  output$o_fm1_summary <- renderPrint({
										if (input$orangetreeno == 'All')
										summary(fmAll())
										else
										summary(fm1(input$orangetreeno))
									  })
  # render plot. For "All" value generate coplot else generate plot for individual tree
  output$o_fm1plot <- renderPlot({if (input$orangetreeno == 'All')
									  {treecoplot() }
								  else
									   {
									   agelist <- seq(0, input$n, length.out = 101)
									   plot(circumference ~ age, data = Orange,
																subset = Tree == input$orangetreeno,
																xlab = "Tree age (days)",
																ylab = "Tree circumference (mm)",
																las = 1,
																main = "Orange tree data and fitted model")
									   lines(agelist, predict(fm1(input$orangetreeno), list(age = agelist)), col="blue", lwd=2)
									   }
								 })
  # render plot. For "All" value generate qplot else this tab will hide
  output$o_fm1plot2 <- renderPlot({if (input$orangetreeno == 'All')
									  {qplot(age, circumference, data = Orange, geom = c("point", "line"),
										colour = Tree,
										main = "How does orange tree circumference vary with age?")}
								 })

})