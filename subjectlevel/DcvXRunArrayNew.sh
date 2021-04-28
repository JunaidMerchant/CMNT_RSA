#!/bin/tcsh
#SBATCH --time=168:00:00
#SBATCH --cores=6
#SBATCH --mem=24000
#SBATCH --array=119,120,154,160,161,164,165,166,167,168,170,173,174,175,177,181,182,184,187,189,191,192%10
#
# This script is set up to concatenate various regressors of no interest and do a linear regression via 3dDeconvolve
# NOTE: you need to edit the actual command to include your HRF and contrasts
#
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# Script assumes that all runs to be included will have the same naming convention below:
#
# Assumed directory structure and naming (if different, change script):
# data_dir/
#	subject_ID/
#		bold/
#		   {subj}_{study_id}_?.pb04.scale+tlrc.BRIK
#
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

set sub = sub-REDCAT${SLURM_ARRAY_TASK_ID}

set data_dir = /data/bswift-1/jmerch/CAT/newsubs
set timing_dir = $data_dir/${sub}/afni

cd /data/bswift-1/jmerch/CAT/newsubs/${sub}/afni

echo "Current Subject: $sub"
### CHANGES HERE!!!
foreach r ( `seq 1 4` )
#
	if ( -f ${sub}_MNIPediatricAsym_preproc_cmnt_run-0${r}+tlrc.BRIK && -f ${sub}-cmnt_run-0${r}-MoParDeMean.1D) then
                
		echo "current run: $r"
                
		set c_runs = ${sub}_MNIPediatricAsym_preproc_cmnt_run-0${r}+tlrc.BRIK
		#
		set demean = ${sub}-cmnt_run-0${r}-MoParDeMean.1D
		#
		set derv = ${sub}-cmnt_run-0${r}-MoParDerv.1D
		#
		set cen = ${sub}-cmnt_run-0${r}-Censor.1D
		#

		# Linear regression
		echo " "
		echo "============================== 3dDeconvolve =============================="
		### CHANGES HERE!!!
		3dDeconvolve 	\
			-x1D_stop \
			-input $c_runs 	\
			-polort A -jobs 6  	\
			-ortvec $demean demean 	\
			-ortvec $derv derv 	\
			-censor $cen \
			-num_stimts 8 	\
			-stim_times 1 $timing_dir/CM_feedback_run-0${r}.txt 'BLOCK(2,1)' -stim_label 1 CM_F \
			-stim_times_AM1 2 $timing_dir/CM_run-0${r}.txt 'dmBLOCK(1)' -stim_label 2 CM_G \
			-stim_times 3 $timing_dir/CNM_feedback_run-0${r}.txt 'BLOCK(2,1)' -stim_label 3 CNM_F 	\
			-stim_times_AM1 4 $timing_dir/CNM_run-0${r}.txt 'dmBLOCK(1)' -stim_label 4 CNM_G \
			-stim_times 5 $timing_dir/PM_feedback_run-0${r}.txt 'BLOCK(2,1)' -stim_label 5 PM_F 		\
			-stim_times_AM1 6 $timing_dir/PM_run-0${r}.txt 'dmBLOCK(1)' -stim_label 6 PM_G 	\
			-stim_times 7 $timing_dir/PNM_feedback_run-0${r}.txt 'BLOCK(2,1)' -stim_label 7 PNM_F 	\
			-stim_times_AM1 8 $timing_dir/PNM_run-0${r}.txt 'dmBLOCK(1)' -stim_label 8 PNM_G \
			-num_glt 14 \
			-gltsym 'SYM: PM_G +PNM_G -CM_G -CNM_G' 						-glt_label 1 P-C_G 		\
			-gltsym 'SYM: PM_G +CM_G -PNM_G -CNM_G' 						-glt_label 2 M-NM_G 	\
			-gltsym 'SYM: PM_G -CM_G' 										-glt_label 3 PM-CM_G 	\
			-gltsym 'SYM: PNM_G -CNM_G' 									-glt_label 4 PNM-CNM_G 	\
			-gltsym 'SYM: PM_G -PNM_G' 										-glt_label 5 PM-PNM_G 	\
			-gltsym 'SYM: CM_G -CNM_G' 										-glt_label 6 CM-CNM_G 	\
			-gltsym 'SYM: PM_G -PNM_G -CM_G +CNM_G' 						-glt_label 7 PxM_G 		\
			-gltsym 'SYM: PM_F +PNM_F -CM_F -CNM_F' 						-glt_label 8 P-C_F 		\
			-gltsym 'SYM: PM_F +CM_F -PNM_F -CNM_F' 						-glt_label 9 M-NM_F 	\
			-gltsym 'SYM: PM_F -CM_F' 										-glt_label 10 PM-CM_F 	\
			-gltsym 'SYM: PNM_F -CNM_F' 									-glt_label 11 PNM-CNM_F \
			-gltsym 'SYM: PM_F -PNM_F' 										-glt_label 12 PM-PNM_F 	\
			-gltsym 'SYM: CM_F -CNM_F' 										-glt_label 13 CM-CNM_F 	\
			-gltsym 'SYM: PM_F -PNM_F -CM_F +CNM_F' 						-glt_label 14 PxM_F 	\
			-fout -tout \
			-x1D ${sub}.xmat_dm_run-0${r}.1D -x1D_uncensored ${sub}.uncensor.xmat_dm_run-0${r}.1D \
			-errts ${sub}_errts_dm_run-0${r} -fitts ${sub}_fitts_dm_run-0${r} -bucket ${sub}_stats_dm_run-0${r} -overwrite

		cd ${timing_dir}

		more /data/bswift-1/jmerch/CAT/code/TcshTemplate.tcsh > ${sub}_run-0${r}_reml.tcsh
		chmod 775 ${sub}_stats_dm_run-0${r}.REML_cmd
		more ${sub}_stats_dm_run-0${r}.REML_cmd >> ${sub}_run-0${r}_reml.tcsh

		chmod +x ${sub}_run-0${r}_reml.tcsh
		./${sub}_run-0${r}_reml.tcsh


	endif

end

