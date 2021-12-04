phenomelt <- melt(pheno, id.vars = c("CSRV", "SSRV"), 
                         measure.vars = c("TotalCholesterol", "LDLCholesterol", "HDLCholesterol", "Triglycerides"))
                         
##Relationship of TotalCholesterol (Model 1)
meannonvegCSRV <- signif(mean(pheno$TotalCholesterol[pheno$CSRV=="Non-Vegetarian"], na.rm=TRUE), digits = 5)
meanvegCSRV <- signif(mean(pheno$TotalCholesterol[pheno$CSRV=="Vegetarian"], na.rm=TRUE), digits = 5)
meannonvegSSRV <- signif(mean(pheno$TotalCholesterol[pheno$SSRV=="Non-Vegetarian"], na.rm=TRUE), digits = 5)
meanvegSSRV <- signif(mean(pheno$TotalCholesterol[pheno$SSRV=="Vegetarian"], na.rm=TRUE), digits = 5)


graph1 <-
ggplot(data = phenomelt, aes(x = CSRV, y = TotalCholesterol, fill = CSRV, color = CSRV)) + 
  geom_boxplot(alpha = 0.3) + 
    ylim(0, 20) + 
  labs(fill = "Diet",
       x = "CSRV",
       y = "Total Cholesterol (mmol/L)",
       title = "Relationship of CSRV & Total Cholesterol",
       subtitle = paste(
         " p-value <", 2.2e-16,
         "\n n =", length(pheno$CSRV[!is.na(pheno$TotalCholesterol) & !is.na(pheno$CSRV)]),
         "\n Mean Non-Veg =", meannonvegCSRV,
         "                        ",
         "Mean Veg =", meanvegCSRV,
         sep = " ")) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") +
  annotate("text", x = .5, y = meannonvegCSRV, label = meannonvegCSRV, color = "#F8766D") +
  annotate("text", x = 1.5, y = meanvegCSRV, label = meanvegCSRV, color = "#00BA38") +
  scale_fill_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  scale_color_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  guides(color = FALSE, fill = FALSE) + 
  scale_x_discrete(labels = c("Vegetarian", "Non-Vegetarian")) + 
  coord_flip()
