#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH --cores=4
#SBATCH --mem=8000

cd /data/bswift-1/jmerch/CAT/code/NEWSLICETIME
# module load matlab
matlab -nodesktop -nodisplay -nosplash -r "cd /data/bswift-1/jmerch/CAT/code/NEWSLICETIME ; SearchlightRSA_Models1to3_MskScl_AltTauZ $1 ; quit"


