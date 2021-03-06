library(tidyverse)
library(plyr)
library(dplyr)
library(ggnewscale)
library(utils)
library(reshape2)

setwd("/scratch/ahc87874/Fall2021Practice/Project/pheno")

pheno<-as_tibble(read.csv("GWAS_pheno_M1_Veg.csv"))

colnames(pheno)[35]<-"CSRV"
colnames(pheno)[36]<-"SSRV"

pheno$Sex[pheno$Sex==1] <- "Female"
pheno$Sex[pheno$Sex==0] <- "Male"
pheno$Sex <- as.factor(pheno$Sex)
 
pheno$CSRV[pheno$CSRV==0] <- "Non-Vegetarian"
pheno$CSRV[pheno$CSRV==1] <- "Vegetarian"
pheno$CSRV <- as.factor(pheno$CSRV)

pheno$SSRV[pheno$SSRV==0] <- "Non-Vegetarian"
pheno$SSRV[pheno$SSRV==1] <- "Vegetarian"
pheno$SSRV <- as.factor(pheno$SSRV)

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Make histograms of Age, Sex, and BMI
AgeHist <- ggplot(pheno, aes(x = Age, fill = Sex)) +
  geom_histogram(breaks = seq(35, 75, 5), position = "dodge", color = "white") +
  scale_x_continuous(breaks = seq(35, 75, 5)) +
  labs(fill = "Sex",
       x = "Age",
       y = "Count",
       title = "Distribution of Age") + 
  theme(plot.title = element_text(hjust = 0.5))
  
BMIHist <- ggplot(pheno, aes(x = BMI, fill = Sex)) +
  geom_histogram(breaks = seq(10, 75, 5), position = "dodge", color = "white") +
  scale_x_continuous(breaks = seq(10, 75, 5)) +
  labs(fill = "Sex",
       x = "BMI",
       y = "Count",
       title = "Distribution of BMI") + 
  theme(plot.title = element_text(hjust = 0.5))
   
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Make boxplots of CSRV & SSRV vs TotalCholesterol, LDLCholesterol, HDLCholesterol, Triglycerides

##Relationship of CSRV & Total Cholesterol (Model 1)
meannonveg1 <- signif(mean(pheno$TotalCholesterol[pheno$CSRV=="Non-Vegetarian"], na.rm=TRUE), digits = 5)
meanveg1 <- signif(mean(pheno$TotalCholesterol[pheno$CSRV=="Vegetarian"], na.rm=TRUE), digits = 5)
    
xlab1 <-paste(levels(pheno$CSRV[!is.na(pheno$TotalCholesterol) & !is.na(pheno$CSRV)]),"\n(N=",table(pheno$CSRV[!is.na(pheno$TotalCholesterol) & !is.na(pheno$CSRV)]),")",sep="")

graphCSRVTotal <-
ggplot(data = pheno[!is.na(pheno$CSRV),], aes(x = CSRV, y = TotalCholesterol, fill = CSRV, color = CSRV)) + 
  geom_boxplot(alpha = 0.3) + 
    ylim(0, 17) + 
  labs(fill = "Diet",
       x = "CSRV",
       y = "Total Cholesterol (mmol/L)",
       title = "Relationship of CSRV & Total Cholesterol",
       subtitle = paste(
         " p-value <", 2.2e-16,
         "\n n =", length(pheno$CSRV[!is.na(pheno$TotalCholesterol) & !is.na(pheno$CSRV)]),
         "\n Mean Non-Veg =", meannonveg1,
         "                        ",
         "Mean Veg =", meanveg1,
         sep = " ")) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") +
  annotate("text", x = .5, y = meannonveg1, label = meannonveg1, color = "#F8766D") +
  annotate("text", x = 1.5, y = meanveg1, label = meanveg1, color = "#00BA38") +
  scale_fill_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  scale_color_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  guides(color = FALSE, fill = FALSE) + 
  scale_x_discrete(labels = xlab1) + 
  coord_flip()

##Relationship of SSRV & Total Cholesterol (Model 3)
meannonveg3 <- signif(mean(pheno$TotalCholesterol[pheno$SSRV=="Non-Vegetarian"], na.rm=TRUE), digits = 5)
meanveg3 <- signif(mean(pheno$TotalCholesterol[pheno$SSRV=="Vegetarian"], na.rm=TRUE), digits = 5)
    
xlab3 <-paste(levels(pheno$SSRV[!is.na(pheno$TotalCholesterol) & !is.na(pheno$SSRV)]),"\n(N=",table(pheno$SSRV[!is.na(pheno$TotalCholesterol) & !is.na(pheno$SSRV)]),")",sep="")

graphSSRVTotal <-
ggplot(data = pheno[!is.na(pheno$SSRV),], aes(x = SSRV, y = TotalCholesterol, fill = SSRV, color = SSRV)) + 
  geom_boxplot(alpha = 0.3) + 
    ylim(0, 17) + 
  labs(fill = "Diet",
       x = "SSRV",
       y = "Total Cholesterol (mmol/L)",
       title = "Relationship of SSRV & Total Cholesterol",
       subtitle = paste(
         " p-value <", 2.2e-16,
         "\n n =", length(pheno$SSRV[!is.na(pheno$TotalCholesterol) & !is.na(pheno$SSRV)]),
         "\n Mean Non-Veg =", meannonveg3,
         "                        ",
         "Mean Veg =", meanveg3,
         sep = " ")) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") +
  annotate("text", x = .5, y = meannonveg3, label = meannonveg3, color = "#F8766D") +
  annotate("text", x = 1.5, y = meanveg3, label = meanveg3, color = "#00BA38") +
  scale_fill_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  scale_color_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  guides(color = FALSE, fill = FALSE) + 
  scale_x_discrete(labels = xlab3) + 
  coord_flip()

##Relationship of CSRV & LDL Cholesterol
meannonveg5 <- signif(mean(pheno$LDLCholesterol[pheno$CSRV=="Non-Vegetarian"], na.rm=TRUE), digits = 5)
meanveg5 <- signif(mean(pheno$LDLCholesterol[pheno$CSRV=="Vegetarian"], na.rm=TRUE), digits = 5)
    
xlab5 <-paste(levels(pheno$CSRV[!is.na(pheno$LDLCholesterol) & !is.na(pheno$CSRV)]),"\n(N=",table(pheno$CSRV[!is.na(pheno$LDLCholesterol) & !is.na(pheno$CSRV)]),")",sep="")

graphCSRVLDL <-
ggplot(data = pheno[!is.na(pheno$CSRV),], aes(x = CSRV, y = LDLCholesterol, fill = CSRV, color = CSRV)) + 
  geom_boxplot(alpha = 0.3) + 
    ylim(0, 10) + 
  labs(fill = "Diet",
       x = "CSRV",
       y = "LDL Cholesterol (mmol/L)",
       title = "Relationship of CSRV & LDL Cholesterol",
       subtitle = paste(
         " p-value <", 2.2e-16,
         "\n n =", length(pheno$CSRV[!is.na(pheno$LDLCholesterol) & !is.na(pheno$CSRV)]),
         "\n Mean Non-Veg =", meannonveg5,
         "                        ",
         "Mean Veg =", meanveg5,
         sep = " ")) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") +
  annotate("text", x = .5, y = meannonveg5, label = meannonveg5, color = "#F8766D") +
  annotate("text", x = 1.5, y = meanveg5, label = meanveg5, color = "#00BA38") +
  scale_fill_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  scale_color_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  guides(color = FALSE, fill = FALSE) + 
  scale_x_discrete(labels = xlab5) + 
  coord_flip()

##Relationship of SSRV & LDL Cholesterol
meannonveg7 <- signif(mean(pheno$LDLCholesterol[pheno$SSRV=="Non-Vegetarian"], na.rm=TRUE), digits = 5)
meanveg7 <- signif(mean(pheno$LDLCholesterol[pheno$SSRV=="Vegetarian"], na.rm=TRUE), digits = 5)
    
xlab7 <-paste(levels(pheno$SSRV[!is.na(pheno$LDLCholesterol) & !is.na(pheno$SSRV)]),"\n(N=",table(pheno$SSRV[!is.na(pheno$LDLCholesterol) & !is.na(pheno$SSRV)]),")",sep="")

graphSSRVLDL <-
ggplot(data = pheno[!is.na(pheno$SSRV),], aes(x = SSRV, y = LDLCholesterol, fill = SSRV, color = SSRV)) + 
  geom_boxplot(alpha = 0.3) + 
    ylim(0, 10) + 
  labs(fill = "Diet",
       x = "SSRV",
       y = "LDL Cholesterol (mmol/L)",
       title = "Relationship of SSRV & LDL Cholesterol",
       subtitle = paste(
         " p-value <", 2.2e-16,
         "\n n =", length(pheno$SSRV[!is.na(pheno$LDLCholesterol) & !is.na(pheno$SSRV)]),
         "\n Mean Non-Veg =", meannonveg7,
         "                        ",
         "Mean Veg =", meanveg7,
         sep = " ")) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") +
  annotate("text", x = .5, y = meannonveg7, label = meannonveg7, color = "#F8766D") +
  annotate("text", x = 1.5, y = meanveg7, label = meanveg7, color = "#00BA38") +
  scale_fill_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  scale_color_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  guides(color = FALSE, fill = FALSE) + 
  scale_x_discrete(labels = xlab7) + 
  coord_flip()

##Relationship of CSRV & HDL Cholesterol
meannonveg9 <- signif(mean(pheno$HDLCholesterol[pheno$CSRV=="Non-Vegetarian"], na.rm=TRUE), digits = 5)
meanveg9 <- signif(mean(pheno$HDLCholesterol[pheno$CSRV=="Vegetarian"], na.rm=TRUE), digits = 5)
    
xlab9 <-paste(levels(pheno$CSRV[!is.na(pheno$HDLCholesterol) & !is.na(pheno$CSRV)]),"\n(N=",table(pheno$CSRV[!is.na(pheno$HDLCholesterol) & !is.na(pheno$CSRV)]),")",sep="")

graphCSRVHDL <-
ggplot(data = pheno[!is.na(pheno$CSRV),], aes(x = CSRV, y = HDLCholesterol, fill = CSRV, color = CSRV)) + 
  geom_boxplot(alpha = 0.3) + 
    ylim(0, 4.3) + 
  labs(fill = "Diet",
       x = "CSRV",
       y = "HDL Cholesterol (mmol/L)",
       title = "Relationship of CSRV & HDL Cholesterol",
       subtitle = paste(
         " p-value <", 2.2e-16,
         "\n n =", length(pheno$CSRV[!is.na(pheno$HDLCholesterol) & !is.na(pheno$CSRV)]),
         "\n Mean Non-Veg =", meannonveg9,
         "                        ",
         "Mean Veg =", meanveg9,
         sep = " ")) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") +
  annotate("text", x = .5, y = meannonveg9, label = meannonveg9, color = "#F8766D") +
  annotate("text", x = 1.5, y = meanveg9, label = meanveg9, color = "#00BA38") +
  scale_fill_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  scale_color_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  guides(color = FALSE, fill = FALSE) + 
  scale_x_discrete(labels = xlab9) + 
  coord_flip()

##Relationship of SSRV & HDL Cholesterol
meannonveg11 <- signif(mean(pheno$HDLCholesterol[pheno$SSRV=="Non-Vegetarian"], na.rm=TRUE), digits = 5)
meanveg11 <- signif(mean(pheno$HDLCholesterol[pheno$SSRV=="Vegetarian"], na.rm=TRUE), digits = 5)
    
xlab11 <-paste(levels(pheno$SSRV[!is.na(pheno$HDLCholesterol) & !is.na(pheno$SSRV)]),"\n(N=",table(pheno$SSRV[!is.na(pheno$HDLCholesterol) & !is.na(pheno$SSRV)]),")",sep="")

graphSSRVHDL <-
ggplot(data = pheno[!is.na(pheno$SSRV),], aes(x = SSRV, y = HDLCholesterol, fill = SSRV, color = SSRV)) + 
  geom_boxplot(alpha = 0.3) + 
    ylim(0, 4.3) + 
  labs(fill = "Diet",
       x = "SSRV",
       y = "HDL Cholesterol (mmol/L)",
       title = "Relationship of SSRV & HDL Cholesterol",
       subtitle = paste(
         " p-value <", 2.2e-16,
         "\n n =", length(pheno$SSRV[!is.na(pheno$HDLCholesterol) & !is.na(pheno$SSRV)]),
         "\n Mean Non-Veg =", meannonveg11,
         "                        ",
         "Mean Veg =", meanveg11,
         sep = " ")) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") +
  annotate("text", x = .5, y = meannonveg11, label = meannonveg11, color = "#F8766D") +
  annotate("text", x = 1.5, y = meanveg11, label = meanveg11, color = "#00BA38") +
  scale_fill_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  scale_color_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  guides(color = FALSE, fill = FALSE) + 
  scale_x_discrete(labels = xlab11) + 
  coord_flip()

##Relationship of CSRV & Triglycerides
meannonveg13 <- signif(mean(pheno$Triglycerides[pheno$CSRV=="Non-Vegetarian"], na.rm=TRUE), digits = 5)
meanveg13 <- signif(mean(pheno$Triglycerides[pheno$CSRV=="Vegetarian"], na.rm=TRUE), digits = 5)
    
xlab13 <-paste(levels(pheno$CSRV[!is.na(pheno$Triglycerides) & !is.na(pheno$CSRV)]),"\n(N=",table(pheno$CSRV[!is.na(pheno$Triglycerides) & !is.na(pheno$CSRV)]),")",sep="")

graphCSRVTri <-
ggplot(data = pheno[!is.na(pheno$CSRV),], aes(x = CSRV, y = Triglycerides, fill = CSRV, color = CSRV)) + 
  geom_boxplot(alpha = 0.3) + 
    ylim(0, 12) + 
  labs(fill = "Diet",
       x = "CSRV",
       y = "Triglycerides (mmol/L)",
       title = "Relationship of CSRV & Triglycerides",
       subtitle = paste(
         " p-value <", 2.2e-16,
         "\n n =", length(pheno$CSRV[!is.na(pheno$Triglycerides) & !is.na(pheno$CSRV)]),
         "\n Mean Non-Veg =", meannonveg13,
         "                        ",
         "Mean Veg =", meanveg13,
         sep = " ")) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") +
  annotate("text", x = .5, y = meannonveg13, label = meannonveg13, color = "#F8766D") +
  annotate("text", x = 1.5, y = meanveg13, label = meanveg13, color = "#00BA38") +
  scale_fill_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  scale_color_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  guides(color = FALSE, fill = FALSE) + 
  scale_x_discrete(labels = xlab13) + 
  coord_flip()

##Relationship of SSRV & Triglycerides
meannonveg15 <- signif(mean(pheno$Triglycerides[pheno$SSRV=="Non-Vegetarian"], na.rm=TRUE), digits = 5)
meanveg15 <- signif(mean(pheno$Triglycerides[pheno$SSRV=="Vegetarian"], na.rm=TRUE), digits = 5)
    
xlab15 <-paste(levels(pheno$SSRV[!is.na(pheno$Triglycerides) & !is.na(pheno$SSRV)]),"\n(N=",table(pheno$SSRV[!is.na(pheno$Triglycerides) & !is.na(pheno$SSRV)]),")",sep="")

graphSSRVTri <-
ggplot(data = pheno[!is.na(pheno$SSRV),], aes(x = SSRV, y = Triglycerides, fill = SSRV, color = SSRV)) + 
  geom_boxplot(alpha = 0.3) + 
    ylim(0, 12) + 
  labs(fill = "Diet",
       x = "SSRV",
       y = "Triglycerides (mmol/L)",
       title = "Relationship of SSRV & Triglycerides",
       subtitle = paste(
         " p-value <", 2.2e-16,
         "\n n =", length(pheno$SSRV[!is.na(pheno$Triglycerides) & !is.na(pheno$SSRV)]),
         "\n Mean Non-Veg =", meannonveg15,
         "                        ",
         "Mean Veg =", meanveg15,
         sep = " ")) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") +
  annotate("text", x = .5, y = meannonveg15, label = meannonveg15, color = "#F8766D") +
  annotate("text", x = 1.5, y = meanveg15, label = meanveg15, color = "#00BA38") +
  scale_fill_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  scale_color_manual(labels = c("Non-Vegetarian", "Vegetarian"), values = c("#F8766D", "#00BA38")) + 
  guides(color = FALSE, fill = FALSE) + 
  scale_x_discrete(labels = xlab15) + 
  coord_flip()

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

##PNGs
setwd("/scratch/ahc87874/Fall2021Practice/Project/graphs")

png(filename="AgeHist.png", type="cairo", width=500, height=300)
AgeHist
dev.off()

png(filename="BMIHist.png", type="cairo", width=500, height=300)
BMIHist
dev.off()

png(filename="CSRVvsTotal.png", type="cairo", width=500, height=275)
graphCSRVTotal
dev.off()

png(filename="SSRVvsTotal.png", type="cairo", width=500, height=275)
graphSSRVTotal
dev.off()

png(filename="CSRVvsLDL.png", type="cairo", width=500, height=275)
graphCSRVLDL
dev.off()

png(filename="SSRVvsLDL.png", type="cairo", width=500, height=275)
graphSSRVLDL
dev.off()

png(filename="CSRVvsHDL.png", type="cairo", width=500, height=275)
graphCSRVHDL
dev.off()

png(filename="SSRVvsHDL.png", type="cairo", width=500, height=275)
graphSSRVHDL
dev.off()

png(filename="CSRVvsTri.png", type="cairo", width=500, height=275)
graphCSRVTri
dev.off()

png(filename="SSRVvsTri.png", type="cairo", width=500, height=275)
graphSSRVTri
dev.off()
