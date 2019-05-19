##
## 3. CMS classification by NTP method
##
library(edgeR)

exp.data <- raw.expression.data
template <- templates.CMS
colnames(template) <- c("entrez", "class", "probe")

exp.data <- ematAdjust(exp.data, normMethod = "quantile")
ntp.result <- ntp(exp.data, template, doPlot=TRUE, nPerm=1000)

