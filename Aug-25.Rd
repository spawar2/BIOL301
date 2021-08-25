# Author: Pawar, Date: Aug 25 2021, Purpose: Microarray analysis

# Load library affy and limma

library("affy") 
library("limma")

# Install library arrays

if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("arrays")

# Load library arrays

library("arrays")

# Read in sample microarray data as follows

phenoData <- read.AnnotatedDataFrame(system.file("extdata", "pdata.txt", package="arrays")) 

# Perform RMA normalization as follows [other technique Mas5.0 normalization....]

celfiles <- system.file("extdata", package="arrays")

eset <- justRMA(phenoData=phenoData, celfile.path=celfiles)

# differential gene expression  analysis 

combn <- factor(paste(pData(phenoData)[,1], pData(phenoData)[,2], sep = "_")) 

design <- model.matrix(~combn) 

# describe model to be fit: 2 channel has 2 probes for 1 gene, so differences in these are calculated as fold changes

fit <- lmFit(eset, design) 

# fit each probeset to model  # empirical Bayes adjustment 

efit <- eBayes(fit) 

# table of differentially expressed probesets

topTable(efit, coef=2) 

# Plotting

volcanoplot(efit,coef=2,highlight=2)
plotMD(efit,column=2)

write.table(topTable(efit, coef=2) ,file="exampleresults2.txt")





