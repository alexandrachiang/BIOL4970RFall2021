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
