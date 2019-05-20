##
## CMS4 vs others : TOP1, CES2
##
##
##

library(ggplot2)
library(ggpubr)

subset <- cbind(t(expression.data), clinical.data)
CMS4 <- subset[ ,"CMS_Caller"] == 4
subset <- cbind(subset, CMS4)

ggboxplot(data=subset, "CMS_Caller", "TOP1")
ggboxplot(data=subset, "CMS_Caller", "CES2")

p <- ggboxplot(data=subset, "CMS4", "TOP1")
p+ stat_compare_means()

p <- ggboxplot(data=subset, "CMS4", "CES2")
p+ stat_compare_means()

# Set FDR threshold:
FDR.filter <- 0.2
FDR.filtered.subset <- subset[subset[ ,"CMS_Caller_FDR"]<=0.2, ]

CMS4.filtered <- FDR.filtered.subset[ ,"CMS_Caller"] == "4"
FDR.filtered.subset <- cbind(FDR.filtered.subset, CMS4.filtered)

ggboxplot(data=FDR.filtered.subset, "CMS_Caller", "TOP1")
ggboxplot(data=FDR.filtered.subset, "CMS_Caller", "CES2")

p <- ggboxplot(data=FDR.filtered.subset, "CMS4.filtered", "TOP1")
p+ stat_compare_means()

p <- ggboxplot(data=FDR.filtered.subset, "CMS4.filtered", "CES2")
p+ stat_compare_means()

