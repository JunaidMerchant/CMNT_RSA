#!/bin/bash
#SBATCH --time=1:00:00
#SBATCH --cores=2
#SBATCH --mem=4000
#SBATCH --array=0-71%10

# Define all subs
Subs=("sub-REDCAT107" "sub-REDCAT108" "sub-REDCAT109" "sub-REDCAT110" "sub-REDCAT111" "sub-REDCAT112" "sub-REDCAT115" "sub-REDCAT116" "sub-REDCAT117" "sub-REDCAT118" "sub-REDCAT119" "sub-REDCAT120" "sub-REDCAT123" "sub-REDCAT124" "sub-REDCAT125" "sub-REDCAT127" "sub-REDCAT132" "sub-REDCAT133" "sub-REDCAT134" "sub-REDCAT135" "sub-REDCAT139" "sub-REDCAT144" "sub-REDCAT145" "sub-REDCAT147" "sub-REDCAT148" "sub-REDCAT149" "sub-REDCAT150" "sub-REDCAT152" "sub-REDCAT155" "sub-REDCAT157" "sub-REDCAT160" "sub-REDCAT161" "sub-REDCAT164" "sub-REDCAT165" "sub-REDCAT166" "sub-REDCAT167" "sub-REDCAT168" "sub-REDCAT170" "sub-REDCAT173" "sub-REDCAT174" "sub-REDCAT175" "sub-REDCAT177" "sub-REDCAT181" "sub-REDCAT182" "sub-REDCAT184" "sub-REDCAT187" "sub-REDCAT189" "sub-REDCAT191" "sub-REDCAT192" "sub-REDCMNT123" "sub-REDCMNT125" "sub-REDCMNT128" "sub-REDCMNT129" "sub-REDCMNT130" "sub-REDCMNT136" "sub-REDCMNT137" "sub-REDCMNT138" "sub-REDCMNT140" "sub-REDCMNT142" "sub-REDCMNT144" "sub-REDCMNT146" "sub-REDCMNT147" "sub-REDCMNT151" "sub-REDCMNT153" "sub-REDCMNT154" "sub-REDCMNT157" "sub-REDCMNT161" "sub-REDCMNT162" "sub-REDCMNT166" "sub-REDCMNT167" "sub-REDCMNT168" "sub-REDCMNT170")

# Define current subject for preprocessing
s=${Subs[${SLURM_ARRAY_TASK_ID}]}

#
cd /data/bswift-1/jmerch/CAT/subs/${s}/newST_combinedRuns_Acc
#
#
#
echo "============================"
echo working on $s
date
#
#
if [[ ! -f ${s}_AllCond_T_CombinedRunsAcc.nii.gz && -f ${s}_stats_CombinedRunsAcc_REML+tlrc.BRIK ]]; then
echo -run $x
date
3dAFNItoNIFTI -prefix ${s}_1CM_T_CombinedRunsAcc.nii.gz ${s}_stats_CombinedRunsAcc_REML+tlrc[CM_G#0_Tstat]
3dAFNItoNIFTI -prefix ${s}_2CNM_T_CombinedRunsAcc.nii.gz ${s}_stats_CombinedRunsAcc_REML+tlrc[CNM_G#0_Tstat]
3dAFNItoNIFTI -prefix ${s}_3PM_T_CombinedRunsAcc.nii.gz ${s}_stats_CombinedRunsAcc_REML+tlrc[PM_G#0_Tstat]
3dAFNItoNIFTI -prefix ${s}_4PNM_T_CombinedRunsAcc.nii.gz ${s}_stats_CombinedRunsAcc_REML+tlrc[PNM_G#0_Tstat]
fslmerge -a ${s}_AllCond_T_CombinedRunsAcc $(ls ${s}_*T_CombinedRunsAcc.nii.gz)
else
echo -run $x already done or NA
fi
#

