##
## 1. Importing data & Pre-processing ####################################################################
##
if(!require(dplyr)) install.packages("dplyr")
library(dplyr)
library(BiocGenerics)
library(CMScaller)

datadir <- "C:/Users/leeym/Desktop/Personal/BI/Projects/Data/"

## Read data from file | "datadir" must be set | Do only once
raw.clinical.data <- read.delim(paste0(datadir, "rectal_data_summary2_processed.csv"), sep=',', row.names=1)
raw.expression.data <- read.delim(paste0(datadir, "cc.gene_count.set.vst.float.txt"))
# if only one gene expression is 0, remove the entire row.
raw.expression.data[raw.expression.data == 0] <- NA
raw.expression.data <- raw.expression.data[complete.cases(raw.expression.data), ]
substring(colnames(raw.expression.data),4,4) <- "-" # genes.RPS row.names are in "KR0.0000" but in Dataset, it's "KR0-0000". Thus change .(dot) to "-"

## Type column names you want to extract
## If not set, all data will be extracted
extract.from.clinical.data <- c("survival.time", "survival", "DFS.time", "recurrence", "pCR", "CMS_Caller", "CMS_Caller_FDR")
extract.from.expression.data <- c("TOP1","CES2")

## Extracting data
## If extracting vector is empty, then get the full data
if(length(extract.from.clinical.data) != 0) { # if not empty,
  clinical.data <- select(raw.clinical.data, extract.from.clinical.data) # extract specific data
} else { # if empty
  clinical.data <- raw.clinical.data # extract all
}

if(length(extract.from.expression.data) != 0) {
  expression.data <- raw.expression.data[extract.from.expression.data, ]
} else {
  expression.data <- raw.expression.data
}

