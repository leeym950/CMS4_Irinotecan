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
