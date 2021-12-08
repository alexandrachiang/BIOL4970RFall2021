##Total Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model1.lm <- lm(TotalCholesterol ~ Age + Sex + CSRV, data = pheno)
Model2.lm <- lm(TotalCholesterol ~ Age + Sex + SSRV, data = pheno)

##LDL Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model3.lm <- lm(LDLCholesterol ~ Age + Sex + CSRV, data = pheno)
Model4.lm <- lm(LDLCholesterol ~ Age + Sex + SSRV, data = pheno)

##HDL Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model5.lm <- lm(HDLCholesterol ~ Age + Sex + CSRV, data = pheno)
Model6.lm <- lm(HDLCholesterol ~ Age + Sex + SSRV, data = pheno)

##Triglycerides
##Covariates Age, Sex, CSRV/SSRV
Model7.lm <- lm(Triglycerides ~ Age + Sex + CSRV, data = pheno)
Model8.lm <- lm(Triglycerides ~ Age + Sex + SSRV, data = pheno)

summary(Model1.lm)
summary(Model2.lm)
summary(Model3.lm)
summary(Model4.lm)
summary(Model5.lm)
summary(Model6.lm)
summary(Model7.lm)
summary(Model8.lm)

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Males Only
##Total Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model1.lm <- lm(TotalCholesterol ~ Age + CSRV, data = pheno[pheno$Sex=="Male",])
Model2.lm <- lm(TotalCholesterol ~ Age + SSRV, data = pheno[pheno$Sex=="Male",])

##LDL Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model3.lm <- lm(LDLCholesterol ~ Age + CSRV, data = pheno[pheno$Sex=="Male",])
Model4.lm <- lm(LDLCholesterol ~ Age + SSRV, data = pheno[pheno$Sex=="Male",])

##HDL Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model5.lm <- lm(HDLCholesterol ~ Age + CSRV, data = pheno[pheno$Sex=="Male",])
Model6.lm <- lm(HDLCholesterol ~ Age + SSRV, data = pheno[pheno$Sex=="Male",])

##Triglycerides
##Covariates Age, Sex, CSRV/SSRV
Model7.lm <- lm(Triglycerides ~ Age + CSRV, data = pheno[pheno$Sex=="Male",])
Model8.lm <- lm(Triglycerides ~ Age + SSRV, data = pheno[pheno$Sex=="Male",])

summary(Model1.lm)
summary(Model2.lm)
summary(Model3.lm)
summary(Model4.lm)
summary(Model5.lm)
summary(Model6.lm)
summary(Model7.lm)
summary(Model8.lm)

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Females Only
##Total Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model1.lm <- lm(TotalCholesterol ~ Age + CSRV, data = pheno[pheno$Sex=="Female",])
Model2.lm <- lm(TotalCholesterol ~ Age + SSRV, data = pheno[pheno$Sex=="Female",])

##LDL Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model3.lm <- lm(LDLCholesterol ~ Age + CSRV, data = pheno[pheno$Sex=="Female",])
Model4.lm <- lm(LDLCholesterol ~ Age + SSRV, data = pheno[pheno$Sex=="Female",])

##HDL Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model5.lm <- lm(HDLCholesterol ~ Age + CSRV, data = pheno[pheno$Sex=="Female",])
Model6.lm <- lm(HDLCholesterol ~ Age + SSRV, data = pheno[pheno$Sex=="Female",])

##Triglycerides
##Covariates Age, Sex, CSRV/SSRV
Model7.lm <- lm(Triglycerides ~ Age + CSRV, data = pheno[pheno$Sex=="Female",])
Model8.lm <- lm(Triglycerides ~ Age + SSRV, data = pheno[pheno$Sex=="Female",])

summary(Model1.lm)
summary(Model2.lm)
summary(Model3.lm)
summary(Model4.lm)
summary(Model5.lm)
summary(Model6.lm)
summary(Model7.lm)
summary(Model8.lm)
