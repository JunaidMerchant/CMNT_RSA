# File Details for b_fmri_preprocessing/

BidsConvert.sh - wrapper script that uses dcm2niix for converting dicoms into BIDS organizational structure for use with fMRIprep

BidsConvertParameters.sh - parameters used by the BidsConvert script for naming files

ExtractRegressors.R - gets relevant motion/nuissance parameters from the fMRIprep outputs for use with AFNI modeling. Called on by the PostPrep script

FreesurferFmriprep_AllSubsArray.sh - script for preprocessing data through fMRIprep on a high performance computing cluster using SLURM. First does free surfer to help cut down on time. 

PostPrep.sh - does some additional processing steps after fMRIprep that make it ready for use with AFNI modeling.

