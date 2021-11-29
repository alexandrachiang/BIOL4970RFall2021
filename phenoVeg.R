#Add vegetarian columns

library(tidyverse)

setwd("/scratch/ahc87874/Fall2021Practice/Project")

source("pheno.R")

vegqc3<-read.delim("vegQC2_04032021.txt", header=TRUE, sep="\t")

#Inner join
participants2<-as_tibble(inner_join(participants1, vegqc3, by="IID"))
new2<-as_tibble(inner_join(new, vegqc3, by="IID"))

#Output
outdir="/scratch/ahc87874/Fall2021Practice/Project"

write.table(participants2, 
	paste(outdir, "/GWAS_phenoQC_IDS_M1_Veg.txt",sep=""), 
	row.names=FALSE, quote=FALSE)

write.table(new2, 
	paste(outdir, "/GWAS_pheno_M1_Veg.txt", sep=""),
	row.names=FALSE, quote=FALSE)

write.csv(new2, 
	paste(outdir, "/GWAS_pheno_M1_Veg.csv")
