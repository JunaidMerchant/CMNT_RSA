# File Details for e_roi_socint_neurosynth/

NS_GetData4Bayes_MskScl.m - script that takes data from .mat files and organizes into a tab-delimited text file as required by AFNI's RBA program

NS_GetData4Bayes_MskScl_3n4GoodRuns.m - script that takes data from .mat files and organizes into a tab-delimited text file as required by AFNI's RBA program for supplemental analysis comparing participant with 2+, 3+ and 4 good runs

NS_RoiDatStats_MskScl.m - script that extracts data from conjunction ROIs and calculates euclidean distances between conditions, and saves data in .mat files. uses functions from CosmoMVPA toolbox

NeuroSynthStats_MskScl.m - script that runs model fit analysis using RSA toolbox (Nils et al., 2014) after ROI data is extracted and distances are calculated using above script

NeurosynthRSA_CombinedRunsAcc.m - script that extracts data from conjunction ROIs and calculates euclidean distances between conditions, and saves data in .mat files. uses functions from CosmoMVPA toolbox for supplemental analysis using only accurate trials

remove_zero_cosmo_ds.m - this is a function I created to handle missing data from voxels. The recommended workflow for the CosmoMVPA toolbox actually ends up covering up the missing data, which can be problematic for ROIs near the edge of the brain (like the ATL we are interested in)

tau2z.m - this function converts from Kendall's Tau to Z using the appropriate formula, i.e. https://www.statisticshowto.com/kendalls-tau/

