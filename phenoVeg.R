library(tidyverse)

setwd("/scratch/ahc87874/Fall2021Practice/Project")

source("pheno.R")

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Add vegetarian columns
vegqc3<-read.delim("vegQC2_04032021.txt", header=TRUE, sep="\t")

#Inner join
participants2<-as_tibble(inner_join(participants1, vegqc3, by="IID"))
new2<-as_tibble(inner_join(new, vegqc3, by="IID"))

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#PCs
pan<-read_tsv("/scratch/ahc87874/Fall2021Practice/Project/all_pops_non_eur_pruned_within_pop_pc_covs.tsv")
pan<-as_tibble(pan)
pan$s<-as.integer(pan$s)
table(pan$pop, useNA = "always")

bridge<-read.table("/scratch/ahc87874/Fall2021Practice/Project/ukb48818bridge31063.txt")
bridge<-as_tibble(bridge)
colnames(bridge)<-c("IID", "panID")

pan2<-pan%>%select(s, pop)%>%
    left_join(bridge, by=c("s"="panID"))

#Inner join
participants3<-as_tibble(inner_join(participants2, pan2, by="IID"))
new3<-as_tibble(inner_join(new2, pan2, by="IID"))

participants3<-as_tibble(inner_join(participants3, pan, by="s"))
new3<-as_tibble(inner_join(new3, pan, by="s"))

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

participants3 <- participants3 %>% select("FID", "IID")

#Output
outdir="/scratch/ahc87874/Fall2021Practice/Project"

write.table(participants3, 
	paste(outdir, "/GWAS_phenoQC_IDS_M1_Veg.txt",sep=""), 
	row.names=FALSE, quote=FALSE)

write.table(new3, 
	paste(outdir, "/GWAS_pheno_M1_Veg.txt", sep=""),
	row.names=FALSE, quote=FALSE)

write.csv(new3, 
	paste(outdir, "/GWAS_pheno_M1_Veg.csv")
