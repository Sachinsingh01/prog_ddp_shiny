library(shiny)
# Define UI for random distribution application 
shinyUI(fluidPage(
    
  # Application title
  titlePanel("Project: Developing Data Products"),
  h6("Author: Sachin Singh Date: 10/21/2015"),
  h4('Dataset: Growth of Orange Trees'),
  img(src="OrangeTree.jpg"),
  p(strong('Description')),
  p("The data describe the growth of orange trees. The trunk circumference of 5
trees is measured at 7 different ages, giving a total of 35 datapoints. The Orange data object is among the core datasets that come
with R. This dataset was originally part of package nlme, and that has methods (including for [, as.data.frame, plot and print) for its grouped-data classes. Source: Draper, N. R. and Smith, H. (1998), Applied Regression Analysis (3rd ed), Wiley (exercise 24.N). & Pinheiro, J. C. and Bates, D. M. (2000) Mixed-effects Models in S and S-PLUS, Springer."),

  strong("Data Format:"),
  p("Tree - An ordered factor indicating the tree on which the measurement is made. The ordering is according to increasing maximum diameter."),
  p("age - A numeric vector giving the age of the tree (days since 1968/12/31)"),
  p("circumference - A numeric vector of trunk circumferences (mm). This is probably “circumference at breast height”, a standard measurement in forestry."),

  p("We used self-starting SSlogis() function available in R, specifically for fitting logistic models. Using the
SSlogis() function speeds up the fit by about 15%, because in addition to providing initial
conditions SSlogis() also returns an analytically computed gradient of the sum-of-squares function."),

  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  sidebarLayout(
    sidebarPanel(
	# checkboxInput
      radioButtons("orangetreeno", "Select Data:",
                   c("Tree 1" = "1",
                     "Tree 2" = "2",
					 "Tree 3" = "3",
					 "Tree 4" = "4",
					 "Tree 5" = "5",
					 "All Trees" = "All"),
					 selected = "3"),
	  br(),
	  conditionalPanel(
		  condition = "input.orangetreeno != 'All'",
      sliderInput("n", 
                  "Tree Age in days: (Apply Predict function)",
                   value = 1200,
                   min = 1, 
                   max = 2000)
	  )
    ),
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
	  h2('Output'),
       tabsetPanel(type = "tabs",
         tabPanel("Plot", plotOutput("o_fm1plot"), plotOutput("o_fm1plot2")),
         tabPanel("Summary", verbatimTextOutput("o_fm1_summary")),
		 tabPanel("selfStart Model", verbatimTextOutput("o_rm"))
        ),
	  h2('Inputs'),
	  h4('Tree No'),
	  verbatimTextOutput("o_treeno"),
	  h4('Tree Age (days)'),
	  verbatimTextOutput("o_age")
    )
  )
))