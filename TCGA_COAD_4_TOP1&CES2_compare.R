##
## CMS4 vs others : TOP1, CES2
##
##
##

library(ggplot2)
library(ggpubr)

subset <- cbind(t(expression.data), ntp.result)

CMS4 <- subset[ ,"prediction"] == "CMS4"
subset <- cbind(subset, CMS4)

ggboxplot(data=subset, "prediction", "TOP1")
ggboxplot(data=subset, "prediction", "CES2")

p <- ggboxplot(data=subset, "CMS4", "TOP1")
p+ stat_compare_means() + stat_mean()

p <- ggboxplot(data=subset, "CMS4", "CES2")
p+ stat_compare_means()

# Set FDR threshold:
FDR.filter <- 0.2
FDR.filtered.subset <- subset[subset[ ,"FDR"]<=0.2, ]

CMS4.filtered <- FDR.filtered.subset[ ,"prediction"] == "CMS4"
FDR.filtered.subset <- cbind(FDR.filtered.subset, CMS4.filtered)

ggboxplot(data=FDR.filtered.subset, "prediction", "TOP1")
ggboxplot(data=FDR.filtered.subset, "prediction", "CES2")

p <- ggboxplot(data=FDR.filtered.subset, "CMS4.filtered", "TOP1")
p+ stat_compare_means()

p <- ggboxplot(data=FDR.filtered.subset, "CMS4.filtered", "CES2")
p+ stat_compare_means()
