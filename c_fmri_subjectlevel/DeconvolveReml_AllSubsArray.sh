#!/bin/tcsh
#SBATCH --time=16:00:00
#SBATCH --cores=6
#SBATCH --mem=16000
#SBATCH --array=1-72%10
#
# Define all subs
set SUBS = ( "sub-REDCAT107" "sub-REDCAT108" "sub-REDCAT109" "sub-REDCAT110" "sub-REDCAT111" "sub-REDCAT112" "sub-REDCAT115" "sub-REDCAT116" "sub-REDCAT117" "sub-REDCAT118" "sub-REDCAT119" "sub-REDCAT120" "sub-REDCAT123" "sub-REDCAT124" "sub-REDCAT125" "sub-REDCAT127" "sub-REDCAT132" "sub-REDCAT133" "sub-REDCAT134" "sub-REDCAT135" "sub-REDCAT139" "sub-REDCAT144" "sub-REDCAT145" "sub-REDCAT147" "sub-REDCAT148" "sub-REDCAT149" "sub-REDCAT150" "sub-REDCAT152" "sub-REDCAT155" "sub-REDCAT157" "sub-REDCAT160" "sub-REDCAT161" "sub-REDCAT164" "sub-REDCAT165" "sub-REDCAT166" "sub-REDCAT167" "sub-REDCAT168" "sub-REDCAT170" "sub-REDCAT173" "sub-REDCAT174" "sub-REDCAT175" "sub-REDCAT177" "sub-REDCAT181" "sub-REDCAT182" "sub-REDCAT184" "sub-REDCAT187" "sub-REDCAT189" "sub-REDCAT191" "sub-REDCAT192" "sub-REDCMNT123" "sub-REDCMNT125" "sub-REDCMNT128" "sub-REDCMNT129" "sub-REDCMNT130" "sub-REDCMNT136" "sub-REDCMNT137" "sub-REDCMNT138" "sub-REDCMNT140" "sub-REDCMNT142" "sub-REDCMNT144" "sub-REDCMNT146" "sub-REDCMNT147" "sub-REDCMNT151" "sub-REDCMNT153" "sub-REDCMNT154" "sub-REDCMNT157" "sub-REDCMNT161" "sub-REDCMNT162" "sub-REDCMNT166" "sub-REDCMNT167" "sub-REDCMNT168" "sub-REDCMNT170" )

# Define current subject for preprocessing
set sub = $SUBS[${SLURM_ARRAY_TASK_ID}]

# first check to see if this subject has been run
set Test = `ls /data/bswift-1/jmerch/CAT/subs/${sub}/newST_MskScl/*REML+tlrc.BRIK | wc -l`
if ( $Test > 1 ) then
	echo "Looks like you already have $Test REML files!"
	exit;
endif 

# define directories to use
set data_dir = /data/bswift-1/jmerch/CAT/out/fmriprep # preprocessed data
set timing_dir = /data/bswift-1/jmerch/CAT/new_timing_files/by_runs/${sub} # where timing files are
set func_dir = $data_dir/${sub}/func # where function mri data are
set afni_dir = $data_dir/${sub}/afni # some afni files
set out_dir = /data/bswift-1/jmerch/CAT/subs/${sub}/newST_MskScl # output director

# make output directory if it doesnt exist
if ( ! -d /data/bswift-1/jmerch/CAT/subs/${sub}/newST_MskScl ) then
	mkdir /data/bswift-1/jmerch/CAT/subs/${sub}/newST_MskScl
endif

# change in to output directory
cd /data/bswift-1/jmerch/CAT/subs/${sub}/newST_MskScl


echo "-----------------------"
echo "Current Subject: $sub"
echo "-----------------------"
echo " "
### loop through each function run of the subject
foreach r ( `seq 1 4` )
#
	# check to see if necessary data is available
	if ( -f $afni_dir/${sub}_MNIPediatricAsym_masked-scaled-preproc_cmnt_run-0${r}+tlrc.BRIK.gz && -f $timing_dir/CM_run-0${r}.txt && ! -f $out_dir/${sub}_stats_NEWST_run-0${r}_REML+tlrc.BRIK ) then
        echo " "
        echo "-----------------------"        
		echo "current run: $r"
		echo "-----------------------"
		echo " "
        #   Define functional MRI data      
		set c_runs = $afni_dir/${sub}_MNIPediatricAsym_masked-scaled-preproc_cmnt_run-0${r}+tlrc.BRIK.gz
		# Define de-meaned motion file
		set demean = $afni_dir/${sub}-cmnt_run-0${r}-MoParDeMean.1D
		# Define derivative of motion file
		set derv = $afni_dir/${sub}-cmnt_run-0${r}-MoParDerv.1D
		# Define censor file
		set cen = $afni_dir/${sub}-cmnt_run-0${r}-Censor.1D
		#

		# Linear regression
		echo " "
		echo "============================== 3dDeconvolve =============================="
		echo " "
		# start AFNI's 3ddeconvolve
		3dDeconvolve 	\
			-x1D_stop \
			-input $c_runs 	\
			-polort A -jobs 6  	\
			-ortvec $demean demean 	\
			-ortvec $derv derv 	\
			-censor $cen \
			-num_stimts 5 	\
			-stim_times_subtract .625 \
			-stim_times_AM1 1 $timing_dir/CM_run-0${r}.txt 'dmBLOCK(1)' -stim_label 1 CM_G \
			-stim_times_AM1 2 $timing_dir/CNM_run-0${r}.txt 'dmBLOCK(1)' -stim_label 2 CNM_G \
			-stim_times_AM1 3 $timing_dir/PM_run-0${r}.txt 'dmBLOCK(1)' -stim_label 3 PM_G 	\
			-stim_times_AM1 4 $timing_dir/PNM_run-0${r}.txt 'dmBLOCK(1)' -stim_label 4 PNM_G \
			-stim_times 5 $timing_dir/FeedBack_run-0${r}.txt 'BLOCK(2,1)' -stim_label 5 Feedback \
			-num_glt 7 \
			-gltsym 'SYM: PM_G +PNM_G -CM_G -CNM_G' 						-glt_label 1 P-C_G 		\
			-gltsym 'SYM: PM_G +CM_G -PNM_G -CNM_G' 						-glt_label 2 M-NM_G 	\
			-gltsym 'SYM: PM_G -CM_G' 										-glt_label 3 PM-CM_G 	\
			-gltsym 'SYM: PNM_G -CNM_G' 									-glt_label 4 PNM-CNM_G 	\
			-gltsym 'SYM: PM_G -PNM_G' 										-glt_label 5 PM-PNM_G 	\
			-gltsym 'SYM: CM_G -CNM_G' 										-glt_label 6 CM-CNM_G 	\
			-gltsym 'SYM: PM_G -PNM_G -CM_G +CNM_G' 						-glt_label 7 PxM_G 		\
			-mask /data/bswift-1/jmerch/CAT/code/resampledMask.nii \
			-fout -tout \
			-x1D ${sub}.xmat_NEWST_run-0${r}.1D -x1D_uncensored ${sub}.uncensor.xmat_NEWST_run-0${r}.1D \
			-errts ${sub}_errts_NEWST_run-0${r} -fitts ${sub}_fitts_NEWST_run-0${r} -bucket ${sub}_stats_NEWST_run-0${r} -overwrite
		echo " "
		echo " "
		echo "============================== REML =============================="
		echo " "
		# Start AFNI's REML Fit
		3dREMLfit -matrix ${sub}.xmat_NEWST_run-0${r}.1D -input /data/bswift-1/jmerch/CAT/out/fmriprep/${sub}/afni/${sub}_MNIPediatricAsym_masked-scaled-preproc_cmnt_run-0${r}+tlrc.BRIK.gz \
			-mask /data/bswift-1/jmerch/CAT/code/resampledMask.nii \
 			-fout -tout -Rbuck ${sub}_stats_NEWST_run-0${r}_REML -Rvar ${sub}_stats_NEWST_run-0${r}_REMLvar \
 			-Rfitts ${sub}_fitts_NEWST_run-0${r}_REML -Rerrts ${sub}_errts_NEWST_run-0${r}_REML -verb $*
 		echo " "
 		echo " "

 	else 

 		if ( ! -f $afni_dir/${sub}_MNIPediatricAsym_masked-scaled-preproc_cmnt_run-0${r}+tlrc.BRIK.gz ) then
 			echo "missing ${sub}_MNIPediatricAsym_masked-scaled-preproc_cmnt_run-0${r}+tlrc.BRIK.gz"
 		endif

 		if ( ! -f $timing_dir/CM_run-0${r}.txt ) then
 			echo "missing $timing_dir/CM_run-0${r}.txt"
 		endif

 		if ( -f $out_dir/${sub}_stats_NEWST_run-0${r}_REML+tlrc.BRIK ) then
 			echo "$out_dir/${sub}_stats_NEWST_run-0${r}_REML+tlrc.BRIK -- EXISTS!"
 		endif



	endif

end
