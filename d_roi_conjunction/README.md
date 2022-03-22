# File Details for d_roi_conjunction/

ConjunctionRSA_MskScl.m - script that extracts data from conjunction ROIs and calculates euclidean distances between conditions, and saves data in .mat files. uses functions from CosmoMVPA toolbox

ConjunctionStats_MskScl.m - script that runs model fit analysis using RSA toolbox (Nils et al., 2014) after ROI data is extracted and distances are calculated using above script

Conj_GetData4Bayes_MskScl.m - script that takes data from .mat files and organizes into a tab-delimited text file as required by AFNI's RBA program

ConjunctionRSA_CombinedRunsAcc.m - same as above, but for the supplementary analyses using only accurate trials

remove_zero_cosmo_ds.m - this is a function I created to handle missing data from voxels. The recommended workflow for the CosmoMVPA toolbox actually ends up covering up the missing data, which can be problematic for ROIs near the edge of the brain (like the ATL we are interested in)

