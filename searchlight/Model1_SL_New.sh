#!/bin/bash
#
#SBATCH --time=48:00:00
#SBATCH --cores=8
#SBATCH --mem=42000
#SBATCH --output=M1SL2.log
module load afni
# apply any data directories with variables
cd /data/bswift-1/jmerch/CAT/searchlight/afni2
echo --------------------------------
echo "starting at:"
date
echo --------------------------------
3dttest++                \
-prefix /data/bswift-1/jmerch/CAT/searchlight/afni2/M1SL2    	\
-setA 	M1SL2 \
sub-REDCAT107	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT107_searchlight_model1.nii"	\
sub-REDCAT108	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT108_searchlight_model1.nii"	\
sub-REDCAT109	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT109_searchlight_model1.nii"	\
sub-REDCAT110	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT110_searchlight_model1.nii"	\
sub-REDCAT111	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT111_searchlight_model1.nii"	\
sub-REDCAT112	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT112_searchlight_model1.nii"	\
sub-REDCAT115	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT115_searchlight_model1.nii"	\
sub-REDCAT116	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT116_searchlight_model1.nii"	\
sub-REDCAT117	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT117_searchlight_model1.nii"	\
sub-REDCAT118	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT118_searchlight_model1.nii"	\
sub-REDCAT119	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT119_searchlight_model1.nii"	\
sub-REDCAT120	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT120_searchlight_model1.nii"	\
sub-REDCAT123	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT123_searchlight_model1.nii"	\
sub-REDCAT124	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT124_searchlight_model1.nii"	\
sub-REDCAT125	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT125_searchlight_model1.nii"	\
sub-REDCAT127	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT127_searchlight_model1.nii"	\
sub-REDCAT132	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT132_searchlight_model1.nii"	\
sub-REDCAT133	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT133_searchlight_model1.nii"	\
sub-REDCAT134	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT134_searchlight_model1.nii"	\
sub-REDCAT135	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT135_searchlight_model1.nii"	\
sub-REDCAT139	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT139_searchlight_model1.nii"	\
sub-REDCAT144	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT144_searchlight_model1.nii"	\
sub-REDCAT145	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT145_searchlight_model1.nii"	\
sub-REDCAT147	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT147_searchlight_model1.nii"	\
sub-REDCAT148	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT148_searchlight_model1.nii"	\
sub-REDCAT149	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT149_searchlight_model1.nii"	\
sub-REDCAT150	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT150_searchlight_model1.nii"	\
sub-REDCAT152	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT152_searchlight_model1.nii"	\
sub-REDCAT155	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT155_searchlight_model1.nii"	\
sub-REDCAT157	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT157_searchlight_model1.nii"	\
sub-REDCAT160	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT160_searchlight_model1.nii"	\
sub-REDCAT161	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT161_searchlight_model1.nii"	\
sub-REDCAT164	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT164_searchlight_model1.nii"	\
sub-REDCAT165	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT165_searchlight_model1.nii"	\
sub-REDCAT166	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT166_searchlight_model1.nii"	\
sub-REDCAT167	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT167_searchlight_model1.nii"	\
sub-REDCAT168	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT168_searchlight_model1.nii"	\
sub-REDCAT170	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT170_searchlight_model1.nii"	\
sub-REDCAT173	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT173_searchlight_model1.nii"	\
sub-REDCAT174	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT174_searchlight_model1.nii"	\
sub-REDCAT175	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT175_searchlight_model1.nii"	\
sub-REDCAT177	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT177_searchlight_model1.nii"	\
sub-REDCAT181	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT181_searchlight_model1.nii"	\
sub-REDCAT182	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT182_searchlight_model1.nii"	\
sub-REDCAT184	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT184_searchlight_model1.nii"	\
sub-REDCAT187	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT187_searchlight_model1.nii"	\
sub-REDCAT189	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT189_searchlight_model1.nii"	\
sub-REDCAT191	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT191_searchlight_model1.nii"	\
sub-REDCAT192	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCAT192_searchlight_model1.nii"	\
sub-REDCMNT123	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT123_searchlight_model1.nii"	\
sub-REDCMNT125	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT125_searchlight_model1.nii"	\
sub-REDCMNT128	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT128_searchlight_model1.nii"	\
sub-REDCMNT129	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT129_searchlight_model1.nii"	\
sub-REDCMNT130	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT130_searchlight_model1.nii"	\
sub-REDCMNT136	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT136_searchlight_model1.nii"	\
sub-REDCMNT137	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT137_searchlight_model1.nii"	\
sub-REDCMNT138	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT138_searchlight_model1.nii"	\
sub-REDCMNT140	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT140_searchlight_model1.nii"	\
sub-REDCMNT142	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT142_searchlight_model1.nii"	\
sub-REDCMNT144	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT144_searchlight_model1.nii"	\
sub-REDCMNT146	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT146_searchlight_model1.nii"	\
sub-REDCMNT147	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT147_searchlight_model1.nii"	\
sub-REDCMNT151	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT151_searchlight_model1.nii"	\
sub-REDCMNT153	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT153_searchlight_model1.nii"	\
sub-REDCMNT154	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT154_searchlight_model1.nii"	\
sub-REDCMNT157	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT157_searchlight_model1.nii"	\
sub-REDCMNT161	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT161_searchlight_model1.nii"	\
sub-REDCMNT162	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT162_searchlight_model1.nii"	\
sub-REDCMNT166	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT166_searchlight_model1.nii"	\
sub-REDCMNT167	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT167_searchlight_model1.nii"	\
sub-REDCMNT168	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT168_searchlight_model1.nii"	\
sub-REDCMNT170	"/data/bswift-1/jmerch/CAT/searchlight/fx2/sub-REDCMNT170_searchlight_model1.nii"	\
-mask /data/bswift-1/jmerch/CAT/code/resampledMask.nii  \
-Clustsim \
-prefix_clustsim M1SL2_Clust
