# RylieTalmadge_HW
# Rylie Talmadge's homework for BIOL 453

#' ___
#' title: HW1
#' author: Rylie Talmadge
#' date: '`r paste("created on", Sys.Date())`'
#' output: html_document
#' ---
#' 
#' Question 1)Save the file to your local machine to the directory you would like to use for this course. Now you just have to point the function read.csv to the file so it knows where the file is located. For example if I save the file in the following directory: C:/users/dan/Rclass/data/ then I would use the following R command
tgpp <- read.csv('https://raw.githubusercontent.com/dmcglinn/quant_methods/gh-pages/data/tgpp.csv')
#' now I'm going to examine my data
#' 
head(tgpp)

#' Answering the questions
#' 1) What are the names of the columns in this data set?
names(tgpp)
#' 2) How many rows and columns does this data file have?
dim(tgpp)
#' 3) What kind of object is each data column? Hint: checkout the function sapply().
sapply(tgpp, class)
#' 4) What are the values of the the datafile for rows 1, 5, and 8 at columns 3, 7, and 10
tgpp[c(1, 5, 8), c(3, 7, 10)]
#' 5) Create a pdf of the relationship between the variables “scale” and “richness”. Scale is the area in square meters of the quadrat in which richness was recorded. Be sure to label your axes clearly, and choose a color you find pleasing for the points. To get a list of available stock colors use the function colors(). Also see this link: http://research.stowers-institute.org/efg/R/Color/Chart/index.htm.
pdf("/Users/rylietalmadge/Desktop/RHW1_plot.pdf")
plot(richness~scale, data = tgpp, col='darkblue')
#' 6) What happens to your plot when you set the plot argument log equal to ‘xy’. plot(..., log='xy')
plot(richness~scale, data = tgpp, log='xy')

