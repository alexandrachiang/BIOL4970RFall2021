library(tidyverse)
library(qqman)

indir="/scratch/ahc87874/Fall2021Practice/Project/GEM/TotalCholesterol"

for (i in 1:22) {
infile<-read.table(paste(indir, paste("TotalCholesterolxConsistent_Self_Reported_Vegetarian_across_all_24hr-chr", i, sep=""), sep="/"), header=TRUE, stringsAsFactors=FALSE)
infile<-as_tibble(infile) 
colnames(infile)<-c("CHROM", "POS", "ID", "REF", "ALT", "A1", "TEST", "OBS_CT", "BETA", "SE", "T_STAT", "P", "ERRCODE")

#Subset data
infile1<-infile%>%filter(TEST=="ADD")%>%select(CHROM, POS, P, ID)

#Get qqman format
colnames(infile1)<-c("CHR", "BP", "P", "SNP")

#Add to input
rbind(infileall, infile1)
}

#Make manhattan plot
plotoutputpath<-paste(indir, "/plot", sep="")
dir.create(plotoutputpath, showWarnings=FALSE)
plotoutputfile<-paste(plotoutputpath, "/chr1.22man.png", sep="")

png(filename=plotoutputfile, type="cairo")
manhattan(infileall, ylim=c(0,200))
dev.off()
}
