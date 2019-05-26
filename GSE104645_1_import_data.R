if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
if(!require("GEOquery")){
  BiocManager::install("GEOquery") # install GEOquery library
}
library(GEOquery)

GSE104645 <- getGEO("GSE104645") # get dataset

datExpr <- exprs(GSE104645[[1]]) # extract expression profile

# Table for conversion: GPL6480 agilent feature to HUGO symbol
convtable <- read.delim("GPL6480_Conversion.txt", sep="\t") 

rows <- c()
for (i in rownames(datExpr)){
  sym <- as.character(convtable[convtable$ID == i, "GENE_SYMBOL"])
  rows <- append(rows,sym)
}
rows <- rows[complete.cases(rows)]

row.names(datExpr) <- rows
datExpr <- datExpr[row.names(datExpr) != "", ]
