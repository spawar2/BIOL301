# Author: Pawar, Date: Aug 23, 2021, Purpose: Analyze microarray data

# Install library limma and human reference genome

BiocManager::install("limma", dependencies=TRUE)
BiocManager::install("hgu95av2.db", dependencies=TRUE)

# Load library affy and limma

library("affy") 
library("limma")

# Install library arrays

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("arrays")

# Load library arrays

library(arrays)

# Read in sample microarray data as follows

phenoData <- read.AnnotatedDataFrame(system.file("extdata", "pdata.txt", package="arrays")) 

# Perform RMA normalization as follows

celfiles <- system.file("extdata", package="arrays")

eset <- justRMA(phenoData=phenoData, celfile.path=celfiles)
