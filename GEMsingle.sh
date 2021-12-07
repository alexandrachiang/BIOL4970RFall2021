#!/bin/bash
#SBATCH --partition=batch
#SBATCH --job-name=GEMSSRVvsTri
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=144:00:00
#SBATCH --mem=30000
#SBATCH --output=GEMSSRVvsTri.%j.out
#SBATCH --error=GEMSSRVvsTri.%j.err
#SBATCH --array=1-22

i=$SLURM_ARRAY_TASK_ID

cd /scratch/ahc87874/Fall2021Practice/Project

#ml PLINK/2.00-alpha2.3-x86_64-20210920-dev
ml GEM/1.4.1-foss-2019b


genoindir=("/scratch/ahc87874/Fall2021Practice/Project/genoQC2")
phenodir=("/scratch/ahc87874/Fall2021Practice/Project/pheno2")
outdir=("/scratch/ahc87874/Fall2021Practice/Project/GEMsingle2/SSRVvsTri")

phenotypes=("TotalCholesterol")
#"TotalCholesterol" "LDLCholesterol" "HDLCholesterol" "Triglycerides"

exposures=("Self_Reported_Vegetarian_plus_strict_initial_and24")
#"Consistent_Self_Reported_Vegetarian_across_all_24hr" "Self_Reported_Vegetarian_plus_strict_initial_and24

for j in ${phenotypes[@]} 
        do

for e in ${exposures[@]} 
        do

mkdir -p $outdir/$j

echo running "$j" and "$e"


GEM \
--bgen $genoindir/chr"$i".bgen \
--sample $genoindir/chr"$i".sample \
--pheno-file $phenodir/GWAS_pheno_M1_Veg.csv \
--sampleid-name IID \
--pheno-name $j \
--covar-names Age Sex Geno_batch BMI statins \
center1 center2 center3 center4 center5 \
center6 center7 center8 center9 center10 \
center11 center12 center13 center14 center15 \
center16 center17 center18 center20 center21 \
PC1 PC2 PC3 PC4 PC5 PC6 PC7 PC8 PC9 PC10 \
--robust 1 \
--exposure-names "$e" \
--out $outdir/$j/"$j"x"$e"-chr"$i"

done
done
