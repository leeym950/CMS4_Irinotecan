##
## 3. CMS classification by NTP method
##
library(edgeR)
library(CMScaller)

exp.data <- datExpr
template <- templates.CMS
colnames(template) <- c("entrez", "class", "probe")

## data is already adjusted
# exp.data <- ematAdjust(exp.data, normMethod = "none")

ntp.result <- ntp(exp.data, template, doPlot=TRUE, nPerm=1000)

# filter the result by FDR
FDR.thres <- 0.2
FDR.filter <- ntp.result$FDR <= 0.2
FDR.filtered.ntp.result <- ntp.result[FDR.filter, ]
