library(tidyverse)
library(qqman)

indir="/scratch/ahc87874/Fall2021Practice/Project/GEM/LDLCholesterol"
#"/scratch/ahc87874/Fall2021Practice/Project/GEM/TotalCholesterol" "/scratch/ahc87874/Fall2021Practice/Project/GEM/LDLCholesterol" "/scratch/ahc87874/Fall2021Practice/Project/GEMsingle/SSRVvsTri/Triglycerides"
#"TotalCholesterol" "LDLCholesterol" "HDLCholesterol" "Triglycerides"

for (i in 1:22) {
infile<-read.table(paste(indir, paste("LDLCholesterolxSelf_Reported_Vegetarian_plus_strict_initial_and24-chr", i, sep=""), sep="/"), header=TRUE, stringsAsFactors=FALSE)
#"TotalCholesterolxConsistent_Self_Reported_Vegetarian_across_all_24hr-chr" "TotalCholesterolxSelf_Reported_Vegetarian_plus_strict_initial_and24-chr"
#"LDLCholesterolxConsistent_Self_Reported_Vegetarian_across_all_24hr-chr" "LDLCholesterolxSelf_Reported_Vegetarian_plus_strict_initial_and24-chr"
#"TriglyceridesxSelf_Reported_Vegetarian_plus_strict_initial_and24-chr"	
	
infile<-as_tibble(infile) 
  
#names(infile)<-c("CHROM", "POS", "ID", "REF", "ALT", "A1", "TEST", "OBS_CT", "BETA", "SE", "T_STAT", "P", "ERRCODE")
#[1] "SNPID"
#[2] "RSID"
#[3] "CHR"
#[4] "POS"
#[5] "Non_Effect_Allele"
#[6] "Effect_Allele"
#[7] "N_Samples"
#[8] "AF"
#[9] "N_Consistent_Self_Reported_Vegetarian_across_all_24hr_1"
#[10] "AF_Consistent_Self_Reported_Vegetarian_across_all_24hr_1"
#[11] "N_Consistent_Self_Reported_Vegetarian_across_all_24hr_0"
#[12] "AF_Consistent_Self_Reported_Vegetarian_across_all_24hr_0"
#[13] "Beta_Marginal"
#[14] "robust_SE_Beta_Marginal"
#[15] "Beta_G.Consistent_Self_Reported_Vegetarian_across_all_24hr"
#[16] "robust_SE_Beta_G.Consistent_Self_Reported_Vegetarian_across_all_24hr"
#[17] "robust_P_Value_Marginal"
#[18] "robust_P_Value_Interaction"
#[19] "robust_P_Value_Joint"
  
#Subset data
infile1<-infile%>%select(CHR, POS, robust_P_Value_Joint, RSID)

#Get qqman format
colnames(infile1)<-c("CHR", "BP", "P", "SNP")

#Add to input
if (i == 1) {
	infileall<-infile1
} else {
	infileall<-rbind(infileall, infile1)
}

}

outdir="/scratch/ahc87874/Fall2021Practice/Project/SNPs"
#Make table of sig SNPs (P < 5e-8)
sigSNPs<-infileall%>%filter(P<=5e-8)
write.table(sigSNPs, 
	paste(outdir, "/TrixSSRVsigSNPs.txt", sep=""),
	row.names=FALSE, quote=FALSE)
	
#Make table of top 10 SNPs
attach(infileall)
newdata <- infileall[order(P),]
newdata <- newdata[1:10,]
write.table(newdata, 
	paste(outdir, "/TrixSSRVtopSNPs.txt", sep=""),
	row.names=FALSE, quote=FALSE)
	
pvalue<-newdata[10,3]

#Make manhattan plot
outdir="/scratch/ahc87874/Fall2021Practice/Project/manplots"
plotoutputfile<-paste(outdir, "/TriglyceridesxSelf_Reported_Vegetarian_plus_strict_initial_and24.png", sep="")

png(filename=plotoutputfile, type="cairo")
manhattan(infileall, ylim=c(0,200), col = c("deepskyblue1", "black"), cex = 0.6, suggestiveline = T, genomewideline = T, main = "Manhattan Plot of TAG x SSRV", highlight = newdata, annotatePval = pvalue)
#firebrick1 deepskyblue1
dev.off()

#Make qq plot
outdir="/scratch/ahc87874/Fall2021Practice/Project/qqplots"
plotoutputfile<-paste(outdir, "/TriglyceridesxSelf_Reported_Vegetarian_plus_strict_initial_and24.png", sep="")

png(filename=plotoutputfile, type="cairo")
qq(gwasResults$P, main = "Q-Q plot of TAG x SSRV GWAS p-values")
dev.off()
