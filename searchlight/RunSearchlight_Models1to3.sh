#!/bin/bash
#SBATCH --time=168:00:00
#SBATCH --cores=8
#SBATCH --mem=16000

cd /data/bswift-1/jmerch/CAT/code
module load matlab
matlab -nodesktop -nodisplay -nosplash -r "cd /data/bswift-1/jmerch/CAT/code ; SearchlightRSA_Models1to3 $1 ; quit"


