# Author: Pawar, Date: Sep 3 2021, Purpose: To do phylogentic analysis of sample data

library(ape)
library(phangorn)
library(phytools)
library(geiger)


text.string <- "(((((((cow, pig),whale),(bat,(lemur,human))),(robin,iguana)),coelacanth),gold_fish),shark);" 

vert.tree<-read.tree(text=text.string)

plot(vert.tree,no.margin=TRUE,edge.width=2)

# Generate a Phylogram

roundPhylogram(vert.tree)

# Generate a unrooted plot

plot(unroot(vert.tree),type="unrooted",no.margin=TRUE,lab4ut="axial", edge.width=2)

# What are edges and nodes in our sample data?

str(vert.tree)

# Pulling out labels of our generated tree

vert.tree$tip.label

# Writing/exporting your generated tree

# Set my desktop directory path

setwd("/Users/yalegenomecenter/Desktop")

# Export the tree to above directory

write.tree(vert.tree,file="example.txt") 










