##Total Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model1.lm <- lm(TotalCholesterol ~ Age + Sex + BMI + CSRV, data = pheno)
Model2.lm <- lm(TotalCholesterol ~ Age + Sex + BMI + SSRV, data = pheno)

##LDL Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model3.lm <- lm(LDLCholesterol ~ Age + Sex + BMI + CSRV, data = pheno)
Model4.lm <- lm(LDLCholesterol ~ Age + Sex + BMI + SSRV, data = pheno)

##HDL Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model5.lm <- lm(HDLCholesterol ~ Age + Sex + BMI + CSRV, data = pheno)
Model6.lm <- lm(HDLCholesterol ~ Age + Sex + BMI + SSRV, data = pheno)

##Triglycerides
##Covariates Age, Sex, BMI, CSRV/SSRV
Model7.lm <- lm(Triglycerides ~ Age + Sex + BMI + CSRV, data = pheno)
Model8.lm <- lm(Triglycerides ~ Age + Sex + BMI + SSRV, data = pheno)

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

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

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Males Only
##Total Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model1.lm <- lm(TotalCholesterol ~ Age + Sex + BMI + CSRV, data = pheno[pheno$Sex=="Male",])
Model2.lm <- lm(TotalCholesterol ~ Age + Sex + BMI + SSRV, data = pheno[pheno$Sex=="Male",])

##LDL Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model3.lm <- lm(LDLCholesterol ~ Age + Sex + BMI + CSRV, data = pheno[pheno$Sex=="Male",])
Model4.lm <- lm(LDLCholesterol ~ Age + Sex + BMI + SSRV, data = pheno[pheno$Sex=="Male",])

##HDL Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model5.lm <- lm(HDLCholesterol ~ Age + Sex + BMI + CSRV, data = pheno[pheno$Sex=="Male",])
Model6.lm <- lm(HDLCholesterol ~ Age + Sex + BMI + SSRV, data = pheno[pheno$Sex=="Male",])

##Triglycerides
##Covariates Age, Sex, BMI, CSRV/SSRV
Model7.lm <- lm(Triglycerides ~ Age + Sex + BMI + CSRV, data = pheno[pheno$Sex=="Male",])
Model8.lm <- lm(Triglycerides ~ Age + Sex + BMI + SSRV, data = pheno[pheno$Sex=="Male",])

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Males Only
##Total Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model1.lm <- lm(TotalCholesterol ~ Age + Sex + CSRV, data = pheno[pheno$Sex=="Male",])
Model2.lm <- lm(TotalCholesterol ~ Age + Sex + SSRV, data = pheno[pheno$Sex=="Male",])

##LDL Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model3.lm <- lm(LDLCholesterol ~ Age + Sex + CSRV, data = pheno[pheno$Sex=="Male",])
Model4.lm <- lm(LDLCholesterol ~ Age + Sex + SSRV, data = pheno[pheno$Sex=="Male",])

##HDL Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model5.lm <- lm(HDLCholesterol ~ Age + Sex + CSRV, data = pheno[pheno$Sex=="Male",])
Model6.lm <- lm(HDLCholesterol ~ Age + Sex + SSRV, data = pheno[pheno$Sex=="Male",])

##Triglycerides
##Covariates Age, Sex, CSRV/SSRV
Model7.lm <- lm(Triglycerides ~ Age + Sex + CSRV, data = pheno[pheno$Sex=="Male",])
Model8.lm <- lm(Triglycerides ~ Age + Sex + SSRV, data = pheno[pheno$Sex=="Male",])

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Females Only
##Total Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model1.lm <- lm(TotalCholesterol ~ Age + Sex + BMI + CSRV, data = pheno[pheno$Sex=="Female",])
Model2.lm <- lm(TotalCholesterol ~ Age + Sex + BMI + SSRV, data = pheno[pheno$Sex=="Female",])

##LDL Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model3.lm <- lm(LDLCholesterol ~ Age + Sex + BMI + CSRV, data = pheno[pheno$Sex=="Female",])
Model4.lm <- lm(LDLCholesterol ~ Age + Sex + BMI + SSRV, data = pheno[pheno$Sex=="Female",])

##HDL Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model5.lm <- lm(HDLCholesterol ~ Age + Sex + BMI + CSRV, data = pheno[pheno$Sex=="Female",])
Model6.lm <- lm(HDLCholesterol ~ Age + Sex + BMI + SSRV, data = pheno[pheno$Sex=="Female",])

##Triglycerides
##Covariates Age, Sex, BMI, CSRV/SSRV
Model7.lm <- lm(Triglycerides ~ Age + Sex + BMI + CSRV, data = pheno[pheno$Sex=="Female",])
Model8.lm <- lm(Triglycerides ~ Age + Sex + BMI + SSRV, data = pheno[pheno$Sex=="Female",])

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

#Females Only
##Total Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model1.lm <- lm(TotalCholesterol ~ Age + Sex + CSRV, data = pheno[pheno$Sex=="Female",])
Model2.lm <- lm(TotalCholesterol ~ Age + Sex + SSRV, data = pheno[pheno$Sex=="Female",])

##LDL Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model3.lm <- lm(LDLCholesterol ~ Age + Sex + CSRV, data = pheno[pheno$Sex=="Female",])
Model4.lm <- lm(LDLCholesterol ~ Age + Sex + SSRV, data = pheno[pheno$Sex=="Female",])

##HDL Cholesterol
##Covariates Age, Sex, CSRV/SSRV
Model5.lm <- lm(HDLCholesterol ~ Age + Sex + CSRV, data = pheno[pheno$Sex=="Female",])
Model6.lm <- lm(HDLCholesterol ~ Age + Sex + SSRV, data = pheno[pheno$Sex=="Female",])

##Triglycerides
##Covariates Age, Sex, CSRV/SSRV
Model7.lm <- lm(Triglycerides ~ Age + Sex + CSRV, data = pheno[pheno$Sex=="Female",])
Model8.lm <- lm(Triglycerides ~ Age + Sex + SSRV, data = pheno[pheno$Sex=="Female",])

