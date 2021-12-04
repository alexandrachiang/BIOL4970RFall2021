##Total Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model1.lm <- lm(TotalCholesterol ~ Age + Sex + CSRV, data = pheno)
Model2.lm <- lm(TotalCholesterol ~ Age + Sex + SSRV, data = pheno)

##LDL Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model3.lm <- lm(LDLCholesterol ~ Age + Sex + CSRV, data = pheno)
Model4.lm <- lm(LDLCholesterol ~ Age + Sex + SSRV, data = pheno)

##HDL Cholesterol
##Covariates Age, Sex, BMI, CSRV/SSRV
Model3.lm <- lm(HDLCholesterol ~ Age + Sex + CSRV, data = pheno)
Model4.lm <- lm(HDLCholesterol ~ Age + Sex + SSRV, data = pheno)

##Triglycerides
##Covariates Age, Sex, BMI, CSRV/SSRV
Model3.lm <- lm(Triglycerides ~ Age + Sex + CSRV, data = pheno)
Model4.lm <- lm(Triglycerides ~ Age + Sex + SSRV, data = pheno)
