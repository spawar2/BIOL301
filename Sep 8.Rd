# Author: Pawar, Date: Sep 8 2021, Purpose: To read the phyolgenetic tree from a sample text file

library(ape)
library(phangorn)
library(phytools)
library(geiger)
text.string <- "(((((((cow, pig),whale),(bat,(lemur,human))),(robin,iguana)),coelacanth),gold_fish),shark);" 
vert.tree<-read.tree(text=text.string)
plot(vert.tree,no.margin=TRUE,edge.width=2)
roundPhylogram(vert.tree)
plot(unroot(vert.tree),type="unrooted",no.margin=TRUE,lab4ut="axial", edge.width=2)
str(vert.tree)
vert.tree$tip.label
setwd("/Users/yalegenomecenter/Desktop")
write.tree(vert.tree,file="example.txt") 

# Reading the text file in R
Data <- read.table("example.txt", header = FALSE, sep = "", dec = ".")

TXT and CSV are most easy to work file types in R
CSV: Comma separated Value file type, similar to xls or xlsx file types but in CSV files the formulas canno be stored or multiple tabs cannot be stored!!!!

# Read the CSV file in R
Data2 <- read.csv("Book1.csv", header = TRUE, sep = ",", dec = ".")








