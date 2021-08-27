# Author: Pawar, Date: Aug 27 2021, Purpose: Analyze sample microarray data

library("affy")

library("limma")

library("arrays")

phenoData <- read.AnnotatedDataFrame(system.file("extdata", "pdata.txt", package="arrays"))

celfiles <- system.file("extdata", package="arrays")

eset <- justRMA(phenoData=phenoData, celfile.path=celfiles)

# Differential gene expression analysis

combn <- factor(paste(pData(phenoData)[,1], pData(phenoData)[,2], sep = "_"))
design <- model.matrix(~combn)

# Describe model to be fit

fit <- lmFit(eset, design)

# Fit each probeset to model # empirical Bayes adjustment

efit <- eBayes(fit)

# Table of differentially expressed probeset

topTable(efit, coef=2)

# Plotting the data on a volcano plot

volcanoplot(efit,coef=2,highlight=2)

plotMD(efit,column=2)

# Set your working directory

setwd("/Users/yalegenomecenter/Desktop")

# Writing/exporting data from R

write.table(topTable(efit, coef=2) ,file="exampleresults2.txt")











