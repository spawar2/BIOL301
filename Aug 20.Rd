# Author: Pawar, date: Aug 20, 2021, purpose: Perform microarray analysis

# Install library/package "affy"

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("affy")

# Read the package in R

library(affy)

