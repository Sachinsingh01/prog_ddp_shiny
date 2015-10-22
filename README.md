## Application: Growth of Orange Trees
### Course Project - Developing Data Products
#### Author: Sachin Singh

### Introduction
1. This app was made as a project for Coursera's class on Developing Data Products.
2. It's built using shiny and hosted on shinyapps.io. Follow this link https://sachinsingh01.shinyapps.io/prog_ddp_shiny .
3. This app uses core "Growth of Orange Trees" dataset comes with R.
4. In the dataset, The trunk circumference of 5 trees is measured at 7 different ages, giving a total of 35 datapoints.
5. The format of the dataset is below:
* Tree - An ordered factor indicating the tree on which the measurement is made. The ordering is according to increasing maximum diameter.
* age - A numeric vector giving the age of the tree (days since 1968/12/31).
* circumference - A numeric vector of trunk circumferences (mm). This is probably “circumference at breast height”, a standard measurement in forestry.
6. The shiny app applies mixed-effects logistic model to analyze the orange tree growth data.

### Source
* Draper, N. R. and Smith, H. (1998), Applied Regression Analysis (3rd ed), Wiley (exercise 24.N). 
* Pinheiro, J. C. and Bates, D. M. (2000) Mixed-effects Models in S and S-PLUS, Springer.

### How to run the App
1. Copy source.R, ui.R files and www folder containing OrangeTree.jpg file to a folder.
2. Open R and set working directory where above files and folder are copied.
3. Run below commands to run the app,
   * library(shiny)
   * runApp()
   
### Note:
Make sure you have ggplot2 package installed on your machine otherwise one of the plot of the app will throw error.

Thanks!
