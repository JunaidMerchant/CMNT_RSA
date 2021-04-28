#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --mem=24000
#SBATCH --array=109,119,120,165,167,192 
#SBATCH --mail-user=jmerch@terpmail.umd.edu
#SBATCH --mail-type=ALL
#
#
Sub=sub-REDCAT${SLURM_ARRAY_TASK_ID}
#
#
module load freesurfer
#
echo "------------------------------------------------------------------"
echo "started freesurfer"
echo ${Sub}
date
echo "------------------------------------------------------------------"
#
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
#
export SINGULARITYENV_TEMPLATEFLOW_HOME=/home/${USER}/templateflow
#
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
