#!/bin/tcsh
#SBATCH --time=16:00:00
#SBATCH --cores=6
#SBATCH --mem=16000
#SBATCH --array=1-72%10
#

set SUBS = ( "sub-REDCAT107" "sub-REDCAT108" "sub-REDCAT109" "sub-REDCAT110" "sub-REDCAT111" "sub-REDCAT112" "sub-REDCAT115" "sub-REDCAT116" "sub-REDCAT117" "sub-REDCAT118" "sub-REDCAT119" "sub-REDCAT120" "sub-REDCAT123" "sub-REDCAT124" "sub-REDCAT125" "sub-REDCAT127" "sub-REDCAT132" "sub-REDCAT133" "sub-REDCAT134" "sub-REDCAT135" "sub-REDCAT139" "sub-REDCAT144" "sub-REDCAT145" "sub-REDCAT147" "sub-REDCAT148" "sub-REDCAT149" "sub-REDCAT150" "sub-REDCAT152" "sub-REDCAT155" "sub-REDCAT157" "sub-REDCAT160" "sub-REDCAT161" "sub-REDCAT164" "sub-REDCAT165" "sub-REDCAT166" "sub-REDCAT167" "sub-REDCAT168" "sub-REDCAT170" "sub-REDCAT173" "sub-REDCAT174" "sub-REDCAT175" "sub-REDCAT177" "sub-REDCAT181" "sub-REDCAT182" "sub-REDCAT184" "sub-REDCAT187" "sub-REDCAT189" "sub-REDCAT191" "sub-REDCAT192" "sub-REDCMNT123" "sub-REDCMNT125" "sub-REDCMNT128" "sub-REDCMNT129" "sub-REDCMNT130" "sub-REDCMNT136" "sub-REDCMNT137" "sub-REDCMNT138" "sub-REDCMNT140" "sub-REDCMNT142" "sub-REDCMNT144" "sub-REDCMNT146" "sub-REDCMNT147" "sub-REDCMNT151" "sub-REDCMNT153" "sub-REDCMNT154" "sub-REDCMNT157" "sub-REDCMNT161" "sub-REDCMNT162" "sub-REDCMNT166" "sub-REDCMNT167" "sub-REDCMNT168" "sub-REDCMNT170" )

set sub = $SUBS[${SLURM_ARRAY_TASK_ID}]

echo "-----------------------"
echo "Current Subject: $sub"
echo "-----------------------"
echo " "

# Set up main variables
set data_dir = /data/bswift-1/jmerch/CAT/subs
set timing_dir = /data/bswift-1/jmerch/CAT/new_timing_files/
set func_dir = $data_dir/${sub}/prep/

# Set up functional data
set c_runs = `ls $func_dir/${sub}_MNIPediatricAsym_masked-scaled-preproc_cmnt_run-0*+tlrc.BRIK.gz`

# Check to see if all censor file is created:
if ( ! -f $func_dir/${sub}_CensorAll.txt ) then
	cat `ls $func_dir/${sub}-cmnt_run-0*-Censor.1D` > $func_dir/${sub}_CensorAll.txt
endif
set cen = $func_dir/${sub}_CensorAll.txt

# check to see if all MoParDeMean is created: 
if ( ! -f $func_dir/${sub}_MoParDeMeanAll.txt ) then
	cat `ls $func_dir/${sub}-cmnt_run-0*-MoParDeMean.1D` > $func_dir/${sub}_MoParDeMeanAll.txt
endif
set demean = $func_dir/${sub}_MoParDeMeanAll.txt

# check to see if MoParDerv is created: 
if ( ! -f $func_dir/${sub}_MoParDervAll.txt ) then
	cat `ls $func_dir/${sub}-cmnt_run-0*-MoParDerv.1D` > $func_dir/${sub}_MoParDervAll.txt
endif
set derv = $func_dir/${sub}_MoParDervAll.txt


############################################################
## START ON COMBINED RUNS ACCURACY
cd /data/bswift-1/jmerch/CAT/subs/${sub}/newST_combinedRuns_Acc
# Linear regression
echo " "
echo "============================== 3dDeconvolve Combined Acc=============================="
echo " "

3dDeconvolve 	\
	-x1D_stop \
	-input $c_runs 	\
	-polort A -jobs 6  	\
	-ortvec $demean demean 	\
	-ortvec $derv derv 	\
	-censor $cen \
	-num_stimts 6 	\
	-stim_times_subtract .625 \
	-stim_times_AM1 1 $timing_dir/good_accuracy_combined_runs/${sub}/CM_AllRuns.txt 'dmBLOCK(1)' -stim_label 1 CM_G \
	-stim_times_AM1 2 $timing_dir/good_accuracy_combined_runs/${sub}/CNM_AllRuns.txt 'dmBLOCK(1)' -stim_label 2 CNM_G \
	-stim_times_AM1 3 $timing_dir/good_accuracy_combined_runs/${sub}/PM_AllRuns.txt 'dmBLOCK(1)' -stim_label 3 PM_G 	\
	-stim_times_AM1 4 $timing_dir/good_accuracy_combined_runs/${sub}/PNM_AllRuns.txt 'dmBLOCK(1)' -stim_label 4 PNM_G \
	-stim_times 5 $timing_dir/good_accuracy_combined_runs/${sub}/FeedBack_AllRuns.txt 'BLOCK(2,1)' -stim_label 5 Feedback \
	-stim_times_AM1 6 $timing_dir/good_accuracy_combined_runs/${sub}/Wrong_AllRuns.txt 'dmBLOCK(1)' -stim_label 6 Wrong_G \
	-num_glt 7 \
	-gltsym 'SYM: PM_G +PNM_G -CM_G -CNM_G' -glt_label 1 P-C_G \
	-gltsym 'SYM: PM_G +CM_G -PNM_G -CNM_G' -glt_label 2 M-NM_G 	\
	-gltsym 'SYM: PM_G -CM_G' -glt_label 3 PM-CM_G 	\
	-gltsym 'SYM: PNM_G -CNM_G' 	-glt_label 4 PNM-CNM_G 	\
	-gltsym 'SYM: PM_G -PNM_G' -glt_label 5 PM-PNM_G 	\
	-gltsym 'SYM: CM_G -CNM_G' -glt_label 6 CM-CNM_G 	\
	-gltsym 'SYM: PM_G -PNM_G -CM_G +CNM_G' -glt_label 7 PxM_G \
	-mask /data/bswift-1/jmerch/CAT/code/resampledMask.nii \
	-fout -tout \
	-x1D ${sub}.xmat_CombinedRunsAcc.1D -x1D_uncensored ${sub}.uncensor.xmat_CombinedRunsAcc.1D \
	-errts ${sub}_errts_CombinedRunsAcc -fitts ${sub}_fitts_CombinedRunsAcc -bucket ${sub}_stats_CombinedRunsAcc -overwrite

echo " "
echo " "
echo "============================== REML Combined Acc=============================="
echo " "
3dREMLfit -matrix ${sub}.xmat_CombinedRunsAcc.1D \
 -input "${c_runs}" \
 -mask /data/bswift-1/jmerch/CAT/code/resampledMask.nii \
 -fout -tout -Rbuck ${sub}_stats_CombinedRunsAcc_REML -Rvar ${sub}_stats_CombinedRunsAcc_REMLvar \
 -Rfitts ${sub}_fitts_CombinedRunsAcc_REML -Rerrts ${sub}_errts_CombinedRunsAcc_REML -verb $*
############################################################




