# File Details for f_searchlight/

Model1_SL_CombinedRunsAcc.sh - script for group-level assessment of Model 1 fit using AFNI's 3dttest++ for the supplemental analysis using only accurate trials

Model1_SL_MskScl.sh - script for group-level assessment of Model 1 fit using AFNI's 3dttest++

Model1minM2_SL_CombinedRunsAcc.sh - script for group-level assessment of Model 1 > Model 2 contrast using AFNI's 3dttest++ for the supplemental analysis using only accurate trials

Model1minM2_SL_MskScl.sh - script for group-level assessment of Model 1 > Model 2 contrast using AFNI's 3dttest++

Model2_SL_CombinedRunsAcc.sh - script for group-level assessment of Model 2 fit using AFNI's 3dttest++ for the supplemental analysis using only accurate trials

Model2_SL_MskScl.sh - script for group-level assessment of Model 2 fit using AFNI's 3dttest++

Model3_SL_CombinedRunsAcc.sh - script for group-level assessment of Model 3 fit using AFNI's 3dttest++ for the supplemental analysis using only accurate trials

Model3_SL_MskScl.sh - script for group-level assessment of Model 3 fit using AFNI's 3dttest++

RunSearchlight_Models1to3_CombinedRunsAcc.sh - wrapper shell script for running searchlights on high performance computing cluster using SLURM for the supplemental analysis using only accurate trials

RunSearchlight_Models1to3_MskScl_AltTauZ.sh - wrapper shell script for running searchlights on high performance computing cluster using SLURM

SearchlightRSA_Models1to3_CombinedRunsAcc.m - script for calculating subject-level searchlight of Models 1-3 fit using CosmoMVPA toolbox for the supplemental analysis using only accurate trials

SearchlightRSA_Models1to3_MskScl_AltTauZ.m - script for calculating subject-level searchlight of Models 1-3 fit using CosmoMVPA toolbox 

remove_zero_cosmo_ds.m - this is a function I created to handle missing data from voxels. The recommended workflow for the CosmoMVPA toolbox actually ends up covering up the missing data, which can be problematic for ROIs near the edge of the brain (like the ATL we are interested in)

tau2z.m - this function converts from Kendall's Tau to Z using the appropriate formula, i.e. https://www.statisticshowto.com/kendalls-tau/

