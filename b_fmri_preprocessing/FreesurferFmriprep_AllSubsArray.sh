#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --mem=24000
#SBATCH --array=0-71%10

# Define all subs
Subs=("sub-REDCAT107" "sub-REDCAT108" "sub-REDCAT109" "sub-REDCAT110" "sub-REDCAT111" "sub-REDCAT112" "sub-REDCAT115" "sub-REDCAT116" "sub-REDCAT117" "sub-REDCAT118" "sub-REDCAT119" "sub-REDCAT120" "sub-REDCAT123" "sub-REDCAT124" "sub-REDCAT125" "sub-REDCAT127" "sub-REDCAT132" "sub-REDCAT133" "sub-REDCAT134" "sub-REDCAT135" "sub-REDCAT139" "sub-REDCAT144" "sub-REDCAT145" "sub-REDCAT147" "sub-REDCAT148" "sub-REDCAT149" "sub-REDCAT150" "sub-REDCAT152" "sub-REDCAT155" "sub-REDCAT157" "sub-REDCAT160" "sub-REDCAT161" "sub-REDCAT164" "sub-REDCAT165" "sub-REDCAT166" "sub-REDCAT167" "sub-REDCAT168" "sub-REDCAT170" "sub-REDCAT173" "sub-REDCAT174" "sub-REDCAT175" "sub-REDCAT177" "sub-REDCAT181" "sub-REDCAT182" "sub-REDCAT184" "sub-REDCAT187" "sub-REDCAT189" "sub-REDCAT191" "sub-REDCAT192" "sub-REDCMNT123" "sub-REDCMNT125" "sub-REDCMNT128" "sub-REDCMNT129" "sub-REDCMNT130" "sub-REDCMNT136" "sub-REDCMNT137" "sub-REDCMNT138" "sub-REDCMNT140" "sub-REDCMNT142" "sub-REDCMNT144" "sub-REDCMNT146" "sub-REDCMNT147" "sub-REDCMNT151" "sub-REDCMNT153" "sub-REDCMNT154" "sub-REDCMNT157" "sub-REDCMNT161" "sub-REDCMNT162" "sub-REDCMNT166" "sub-REDCMNT167" "sub-REDCMNT168" "sub-REDCMNT170")
#
# Define current subject for preprocessing
Sub=${Subs[${SLURM_ARRAY_TASK_ID}]}

#
# load freesurfer module
module load freesurfer
#
echo "------------------------------------------------------------------"
echo "started freesurfer"
echo ${Sub}
date
echo "------------------------------------------------------------------"
#
# Run recon-all on subject
recon-all -i /data/bswift-1/jmerch/CAT/in/${Sub}/anat/${Sub}_T1w.nii.gz -openmp 6 -s ${Sub} -sd /data/bswift-1/jmerch/CAT/out/freesurfer -all -parallel
#
#
echo "------------------------------------------------------------------"
echo "Ended freesurfer"
echo ${Sub}
date
echo "------------------------------------------------------------------"
#


# load the singularity module
module load singularity/2.6.0
#
#
# You can change the 4 lines below, I just like having it time stamp it
echo "------------------------------------------------------------------"
echo "Starting fMRIprep at:"
echo working on ${Sub}
date
echo "------------------------------------------------------------------"
#
# 
# export local template flow directory for fmriprep to access
export SINGULARITYENV_TEMPLATEFLOW_HOME=/home/${USER}/templateflow
#
# Run fmriprep using singularity container
singularity run --cleanenv \
--home /data/bswift-1/${USER}:/home/${USER} \
--bind /data/bswift-1/${USER}/templateflow:/home/${USER}/templateflow \
/data/bswift-1/jmerch/fmriprep-1.4.1.simg \
/home/jmerch/CAT/in /home/jmerch/CAT/out participant \
--participant-label ${Sub} \
-w /home/jmerch/CAT/out/working \
--skull-strip-template MNI152NLin2009cAsym --output-spaces MNIPediatricAsym:cohort-4:res-2 MNI152NLin2009cAsym:res-2 \
--use-aroma \
--nthreads 6 --n_cpus 6 --omp-nthreads 6 \
--mem-mb 24000 \
--cifti-output \
--resource-monitor \
--skip_bids_validation \
--no-submm-recon \
--fs-license-file /home/jmerch/license.txt
#
echo "------------------------------------------------------------------"
echo "Ended fMRIprep"
echo ${Sub}
date
echo "------------------------------------------------------------------"
