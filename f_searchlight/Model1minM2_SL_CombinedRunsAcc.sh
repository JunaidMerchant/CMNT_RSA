#!/bin/bash
#
#SBATCH --time=48:00:00
#SBATCH --cores=8
#SBATCH --mem=42000
#SBATCH --output=M1minM2_CombinedRunsAcc.log
#module load afni
# apply any data directories with variables
cd /data/bswift-1/jmerch/CAT/searchlight/rx_CombinedRunsAcc
echo --------------------------------
echo "starting at:"
date
echo --------------------------------
3dttest++                \
-prefix M1minM2_AltZ_SL    	\
-setA 	Model1 \
sub-REDCAT107	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT107_searchlight_model1_AltZ.nii"	\
sub-REDCAT108	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT108_searchlight_model1_AltZ.nii"	\
sub-REDCAT109	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT109_searchlight_model1_AltZ.nii"	\
sub-REDCAT110	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT110_searchlight_model1_AltZ.nii"	\
sub-REDCAT111	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT111_searchlight_model1_AltZ.nii"	\
sub-REDCAT112	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT112_searchlight_model1_AltZ.nii"	\
sub-REDCAT115	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT115_searchlight_model1_AltZ.nii"	\
sub-REDCAT116	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT116_searchlight_model1_AltZ.nii"	\
sub-REDCAT117	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT117_searchlight_model1_AltZ.nii"	\
sub-REDCAT118	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT118_searchlight_model1_AltZ.nii"	\
sub-REDCAT119	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT119_searchlight_model1_AltZ.nii"	\
sub-REDCAT120	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT120_searchlight_model1_AltZ.nii"	\
sub-REDCAT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT123_searchlight_model1_AltZ.nii"	\
sub-REDCAT124	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT124_searchlight_model1_AltZ.nii"	\
sub-REDCAT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT125_searchlight_model1_AltZ.nii"	\
sub-REDCAT127	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT127_searchlight_model1_AltZ.nii"	\
sub-REDCAT132	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT132_searchlight_model1_AltZ.nii"	\
sub-REDCAT133	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT133_searchlight_model1_AltZ.nii"	\
sub-REDCAT134	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT134_searchlight_model1_AltZ.nii"	\
sub-REDCAT135	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT135_searchlight_model1_AltZ.nii"	\
sub-REDCAT139	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT139_searchlight_model1_AltZ.nii"	\
sub-REDCAT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT144_searchlight_model1_AltZ.nii"	\
sub-REDCAT145	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT145_searchlight_model1_AltZ.nii"	\
sub-REDCAT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT147_searchlight_model1_AltZ.nii"	\
sub-REDCAT148	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT148_searchlight_model1_AltZ.nii"	\
sub-REDCAT149	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT149_searchlight_model1_AltZ.nii"	\
sub-REDCAT150	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT150_searchlight_model1_AltZ.nii"	\
sub-REDCAT152	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT152_searchlight_model1_AltZ.nii"	\
sub-REDCAT155	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT155_searchlight_model1_AltZ.nii"	\
sub-REDCAT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT157_searchlight_model1_AltZ.nii"	\
sub-REDCAT160	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT160_searchlight_model1_AltZ.nii"	\
sub-REDCAT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT161_searchlight_model1_AltZ.nii"	\
sub-REDCAT164	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT164_searchlight_model1_AltZ.nii"	\
sub-REDCAT165	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT165_searchlight_model1_AltZ.nii"	\
sub-REDCAT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT166_searchlight_model1_AltZ.nii"	\
sub-REDCAT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT167_searchlight_model1_AltZ.nii"	\
sub-REDCAT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT168_searchlight_model1_AltZ.nii"	\
sub-REDCAT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT170_searchlight_model1_AltZ.nii"	\
sub-REDCAT173	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT173_searchlight_model1_AltZ.nii"	\
sub-REDCAT174	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT174_searchlight_model1_AltZ.nii"	\
sub-REDCAT175	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT175_searchlight_model1_AltZ.nii"	\
sub-REDCAT177	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT177_searchlight_model1_AltZ.nii"	\
sub-REDCAT181	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT181_searchlight_model1_AltZ.nii"	\
sub-REDCAT182	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT182_searchlight_model1_AltZ.nii"	\
sub-REDCAT184	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT184_searchlight_model1_AltZ.nii"	\
sub-REDCAT187	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT187_searchlight_model1_AltZ.nii"	\
sub-REDCAT189	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT189_searchlight_model1_AltZ.nii"	\
sub-REDCAT191	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT191_searchlight_model1_AltZ.nii"	\
sub-REDCAT192	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT192_searchlight_model1_AltZ.nii"	\
sub-REDCMNT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT123_searchlight_model1_AltZ.nii"	\
sub-REDCMNT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT125_searchlight_model1_AltZ.nii"	\
sub-REDCMNT128	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT128_searchlight_model1_AltZ.nii"	\
sub-REDCMNT129	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT129_searchlight_model1_AltZ.nii"	\
sub-REDCMNT130	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT130_searchlight_model1_AltZ.nii"	\
sub-REDCMNT136	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT136_searchlight_model1_AltZ.nii"	\
sub-REDCMNT137	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT137_searchlight_model1_AltZ.nii"	\
sub-REDCMNT138	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT138_searchlight_model1_AltZ.nii"	\
sub-REDCMNT140	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT140_searchlight_model1_AltZ.nii"	\
sub-REDCMNT142	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT142_searchlight_model1_AltZ.nii"	\
sub-REDCMNT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT144_searchlight_model1_AltZ.nii"	\
sub-REDCMNT146	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT146_searchlight_model1_AltZ.nii"	\
sub-REDCMNT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT147_searchlight_model1_AltZ.nii"	\
sub-REDCMNT151	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT151_searchlight_model1_AltZ.nii"	\
sub-REDCMNT153	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT153_searchlight_model1_AltZ.nii"	\
sub-REDCMNT154	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT154_searchlight_model1_AltZ.nii"	\
sub-REDCMNT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT157_searchlight_model1_AltZ.nii"	\
sub-REDCMNT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT161_searchlight_model1_AltZ.nii"	\
sub-REDCMNT162	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT162_searchlight_model1_AltZ.nii"	\
sub-REDCMNT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT166_searchlight_model1_AltZ.nii"	\
sub-REDCMNT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT167_searchlight_model1_AltZ.nii"	\
sub-REDCMNT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT168_searchlight_model1_AltZ.nii"	\
sub-REDCMNT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT170_searchlight_model1_AltZ.nii"	\
-setB 	Model2 \
sub-REDCAT107	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT107_searchlight_model2_AltZ.nii"	\
sub-REDCAT108	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT108_searchlight_model2_AltZ.nii"	\
sub-REDCAT109	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT109_searchlight_model2_AltZ.nii"	\
sub-REDCAT110	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT110_searchlight_model2_AltZ.nii"	\
sub-REDCAT111	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT111_searchlight_model2_AltZ.nii"	\
sub-REDCAT112	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT112_searchlight_model2_AltZ.nii"	\
sub-REDCAT115	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT115_searchlight_model2_AltZ.nii"	\
sub-REDCAT116	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT116_searchlight_model2_AltZ.nii"	\
sub-REDCAT117	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT117_searchlight_model2_AltZ.nii"	\
sub-REDCAT118	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT118_searchlight_model2_AltZ.nii"	\
sub-REDCAT119	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT119_searchlight_model2_AltZ.nii"	\
sub-REDCAT120	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT120_searchlight_model2_AltZ.nii"	\
sub-REDCAT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT123_searchlight_model2_AltZ.nii"	\
sub-REDCAT124	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT124_searchlight_model2_AltZ.nii"	\
sub-REDCAT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT125_searchlight_model2_AltZ.nii"	\
sub-REDCAT127	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT127_searchlight_model2_AltZ.nii"	\
sub-REDCAT132	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT132_searchlight_model2_AltZ.nii"	\
sub-REDCAT133	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT133_searchlight_model2_AltZ.nii"	\
sub-REDCAT134	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT134_searchlight_model2_AltZ.nii"	\
sub-REDCAT135	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT135_searchlight_model2_AltZ.nii"	\
sub-REDCAT139	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT139_searchlight_model2_AltZ.nii"	\
sub-REDCAT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT144_searchlight_model2_AltZ.nii"	\
sub-REDCAT145	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT145_searchlight_model2_AltZ.nii"	\
sub-REDCAT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT147_searchlight_model2_AltZ.nii"	\
sub-REDCAT148	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT148_searchlight_model2_AltZ.nii"	\
sub-REDCAT149	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT149_searchlight_model2_AltZ.nii"	\
sub-REDCAT150	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT150_searchlight_model2_AltZ.nii"	\
sub-REDCAT152	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT152_searchlight_model2_AltZ.nii"	\
sub-REDCAT155	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT155_searchlight_model2_AltZ.nii"	\
sub-REDCAT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT157_searchlight_model2_AltZ.nii"	\
sub-REDCAT160	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT160_searchlight_model2_AltZ.nii"	\
sub-REDCAT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT161_searchlight_model2_AltZ.nii"	\
sub-REDCAT164	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT164_searchlight_model2_AltZ.nii"	\
sub-REDCAT165	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT165_searchlight_model2_AltZ.nii"	\
sub-REDCAT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT166_searchlight_model2_AltZ.nii"	\
sub-REDCAT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT167_searchlight_model2_AltZ.nii"	\
sub-REDCAT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT168_searchlight_model2_AltZ.nii"	\
sub-REDCAT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT170_searchlight_model2_AltZ.nii"	\
sub-REDCAT173	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT173_searchlight_model2_AltZ.nii"	\
sub-REDCAT174	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT174_searchlight_model2_AltZ.nii"	\
sub-REDCAT175	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT175_searchlight_model2_AltZ.nii"	\
sub-REDCAT177	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT177_searchlight_model2_AltZ.nii"	\
sub-REDCAT181	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT181_searchlight_model2_AltZ.nii"	\
sub-REDCAT182	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT182_searchlight_model2_AltZ.nii"	\
sub-REDCAT184	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT184_searchlight_model2_AltZ.nii"	\
sub-REDCAT187	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT187_searchlight_model2_AltZ.nii"	\
sub-REDCAT189	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT189_searchlight_model2_AltZ.nii"	\
sub-REDCAT191	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT191_searchlight_model2_AltZ.nii"	\
sub-REDCAT192	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT192_searchlight_model2_AltZ.nii"	\
sub-REDCMNT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT123_searchlight_model2_AltZ.nii"	\
sub-REDCMNT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT125_searchlight_model2_AltZ.nii"	\
sub-REDCMNT128	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT128_searchlight_model2_AltZ.nii"	\
sub-REDCMNT129	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT129_searchlight_model2_AltZ.nii"	\
sub-REDCMNT130	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT130_searchlight_model2_AltZ.nii"	\
sub-REDCMNT136	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT136_searchlight_model2_AltZ.nii"	\
sub-REDCMNT137	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT137_searchlight_model2_AltZ.nii"	\
sub-REDCMNT138	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT138_searchlight_model2_AltZ.nii"	\
sub-REDCMNT140	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT140_searchlight_model2_AltZ.nii"	\
sub-REDCMNT142	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT142_searchlight_model2_AltZ.nii"	\
sub-REDCMNT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT144_searchlight_model2_AltZ.nii"	\
sub-REDCMNT146	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT146_searchlight_model2_AltZ.nii"	\
sub-REDCMNT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT147_searchlight_model2_AltZ.nii"	\
sub-REDCMNT151	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT151_searchlight_model2_AltZ.nii"	\
sub-REDCMNT153	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT153_searchlight_model2_AltZ.nii"	\
sub-REDCMNT154	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT154_searchlight_model2_AltZ.nii"	\
sub-REDCMNT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT157_searchlight_model2_AltZ.nii"	\
sub-REDCMNT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT161_searchlight_model2_AltZ.nii"	\
sub-REDCMNT162	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT162_searchlight_model2_AltZ.nii"	\
sub-REDCMNT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT166_searchlight_model2_AltZ.nii"	\
sub-REDCMNT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT167_searchlight_model2_AltZ.nii"	\
sub-REDCMNT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT168_searchlight_model2_AltZ.nii"	\
sub-REDCMNT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT170_searchlight_model2_AltZ.nii"	\
-mask /data/bswift-1/jmerch/CAT/code/resampledMask.nii  
#-Clustsim \
#-prefix_clustsim M1minM2_AltZ_SL_Clust


cd /data/bswift-1/jmerch/CAT/searchlight/rx_CombinedRunsAcc
echo --------------------------------
echo "starting at:"
date
echo --------------------------------
3dttest++                \
-prefix M1minM2_Tau_SL    	\
-setA 	Model1 \
sub-REDCAT107	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT107_searchlight_model1_Tau.nii"	\
sub-REDCAT108	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT108_searchlight_model1_Tau.nii"	\
sub-REDCAT109	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT109_searchlight_model1_Tau.nii"	\
sub-REDCAT110	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT110_searchlight_model1_Tau.nii"	\
sub-REDCAT111	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT111_searchlight_model1_Tau.nii"	\
sub-REDCAT112	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT112_searchlight_model1_Tau.nii"	\
sub-REDCAT115	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT115_searchlight_model1_Tau.nii"	\
sub-REDCAT116	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT116_searchlight_model1_Tau.nii"	\
sub-REDCAT117	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT117_searchlight_model1_Tau.nii"	\
sub-REDCAT118	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT118_searchlight_model1_Tau.nii"	\
sub-REDCAT119	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT119_searchlight_model1_Tau.nii"	\
sub-REDCAT120	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT120_searchlight_model1_Tau.nii"	\
sub-REDCAT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT123_searchlight_model1_Tau.nii"	\
sub-REDCAT124	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT124_searchlight_model1_Tau.nii"	\
sub-REDCAT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT125_searchlight_model1_Tau.nii"	\
sub-REDCAT127	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT127_searchlight_model1_Tau.nii"	\
sub-REDCAT132	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT132_searchlight_model1_Tau.nii"	\
sub-REDCAT133	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT133_searchlight_model1_Tau.nii"	\
sub-REDCAT134	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT134_searchlight_model1_Tau.nii"	\
sub-REDCAT135	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT135_searchlight_model1_Tau.nii"	\
sub-REDCAT139	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT139_searchlight_model1_Tau.nii"	\
sub-REDCAT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT144_searchlight_model1_Tau.nii"	\
sub-REDCAT145	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT145_searchlight_model1_Tau.nii"	\
sub-REDCAT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT147_searchlight_model1_Tau.nii"	\
sub-REDCAT148	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT148_searchlight_model1_Tau.nii"	\
sub-REDCAT149	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT149_searchlight_model1_Tau.nii"	\
sub-REDCAT150	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT150_searchlight_model1_Tau.nii"	\
sub-REDCAT152	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT152_searchlight_model1_Tau.nii"	\
sub-REDCAT155	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT155_searchlight_model1_Tau.nii"	\
sub-REDCAT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT157_searchlight_model1_Tau.nii"	\
sub-REDCAT160	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT160_searchlight_model1_Tau.nii"	\
sub-REDCAT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT161_searchlight_model1_Tau.nii"	\
sub-REDCAT164	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT164_searchlight_model1_Tau.nii"	\
sub-REDCAT165	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT165_searchlight_model1_Tau.nii"	\
sub-REDCAT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT166_searchlight_model1_Tau.nii"	\
sub-REDCAT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT167_searchlight_model1_Tau.nii"	\
sub-REDCAT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT168_searchlight_model1_Tau.nii"	\
sub-REDCAT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT170_searchlight_model1_Tau.nii"	\
sub-REDCAT173	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT173_searchlight_model1_Tau.nii"	\
sub-REDCAT174	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT174_searchlight_model1_Tau.nii"	\
sub-REDCAT175	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT175_searchlight_model1_Tau.nii"	\
sub-REDCAT177	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT177_searchlight_model1_Tau.nii"	\
sub-REDCAT181	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT181_searchlight_model1_Tau.nii"	\
sub-REDCAT182	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT182_searchlight_model1_Tau.nii"	\
sub-REDCAT184	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT184_searchlight_model1_Tau.nii"	\
sub-REDCAT187	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT187_searchlight_model1_Tau.nii"	\
sub-REDCAT189	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT189_searchlight_model1_Tau.nii"	\
sub-REDCAT191	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT191_searchlight_model1_Tau.nii"	\
sub-REDCAT192	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT192_searchlight_model1_Tau.nii"	\
sub-REDCMNT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT123_searchlight_model1_Tau.nii"	\
sub-REDCMNT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT125_searchlight_model1_Tau.nii"	\
sub-REDCMNT128	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT128_searchlight_model1_Tau.nii"	\
sub-REDCMNT129	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT129_searchlight_model1_Tau.nii"	\
sub-REDCMNT130	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT130_searchlight_model1_Tau.nii"	\
sub-REDCMNT136	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT136_searchlight_model1_Tau.nii"	\
sub-REDCMNT137	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT137_searchlight_model1_Tau.nii"	\
sub-REDCMNT138	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT138_searchlight_model1_Tau.nii"	\
sub-REDCMNT140	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT140_searchlight_model1_Tau.nii"	\
sub-REDCMNT142	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT142_searchlight_model1_Tau.nii"	\
sub-REDCMNT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT144_searchlight_model1_Tau.nii"	\
sub-REDCMNT146	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT146_searchlight_model1_Tau.nii"	\
sub-REDCMNT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT147_searchlight_model1_Tau.nii"	\
sub-REDCMNT151	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT151_searchlight_model1_Tau.nii"	\
sub-REDCMNT153	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT153_searchlight_model1_Tau.nii"	\
sub-REDCMNT154	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT154_searchlight_model1_Tau.nii"	\
sub-REDCMNT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT157_searchlight_model1_Tau.nii"	\
sub-REDCMNT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT161_searchlight_model1_Tau.nii"	\
sub-REDCMNT162	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT162_searchlight_model1_Tau.nii"	\
sub-REDCMNT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT166_searchlight_model1_Tau.nii"	\
sub-REDCMNT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT167_searchlight_model1_Tau.nii"	\
sub-REDCMNT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT168_searchlight_model1_Tau.nii"	\
sub-REDCMNT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT170_searchlight_model1_Tau.nii"	\
-setB 	Model2 \
sub-REDCAT107	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT107_searchlight_model2_Tau.nii"	\
sub-REDCAT108	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT108_searchlight_model2_Tau.nii"	\
sub-REDCAT109	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT109_searchlight_model2_Tau.nii"	\
sub-REDCAT110	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT110_searchlight_model2_Tau.nii"	\
sub-REDCAT111	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT111_searchlight_model2_Tau.nii"	\
sub-REDCAT112	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT112_searchlight_model2_Tau.nii"	\
sub-REDCAT115	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT115_searchlight_model2_Tau.nii"	\
sub-REDCAT116	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT116_searchlight_model2_Tau.nii"	\
sub-REDCAT117	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT117_searchlight_model2_Tau.nii"	\
sub-REDCAT118	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT118_searchlight_model2_Tau.nii"	\
sub-REDCAT119	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT119_searchlight_model2_Tau.nii"	\
sub-REDCAT120	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT120_searchlight_model2_Tau.nii"	\
sub-REDCAT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT123_searchlight_model2_Tau.nii"	\
sub-REDCAT124	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT124_searchlight_model2_Tau.nii"	\
sub-REDCAT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT125_searchlight_model2_Tau.nii"	\
sub-REDCAT127	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT127_searchlight_model2_Tau.nii"	\
sub-REDCAT132	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT132_searchlight_model2_Tau.nii"	\
sub-REDCAT133	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT133_searchlight_model2_Tau.nii"	\
sub-REDCAT134	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT134_searchlight_model2_Tau.nii"	\
sub-REDCAT135	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT135_searchlight_model2_Tau.nii"	\
sub-REDCAT139	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT139_searchlight_model2_Tau.nii"	\
sub-REDCAT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT144_searchlight_model2_Tau.nii"	\
sub-REDCAT145	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT145_searchlight_model2_Tau.nii"	\
sub-REDCAT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT147_searchlight_model2_Tau.nii"	\
sub-REDCAT148	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT148_searchlight_model2_Tau.nii"	\
sub-REDCAT149	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT149_searchlight_model2_Tau.nii"	\
sub-REDCAT150	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT150_searchlight_model2_Tau.nii"	\
sub-REDCAT152	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT152_searchlight_model2_Tau.nii"	\
sub-REDCAT155	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT155_searchlight_model2_Tau.nii"	\
sub-REDCAT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT157_searchlight_model2_Tau.nii"	\
sub-REDCAT160	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT160_searchlight_model2_Tau.nii"	\
sub-REDCAT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT161_searchlight_model2_Tau.nii"	\
sub-REDCAT164	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT164_searchlight_model2_Tau.nii"	\
sub-REDCAT165	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT165_searchlight_model2_Tau.nii"	\
sub-REDCAT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT166_searchlight_model2_Tau.nii"	\
sub-REDCAT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT167_searchlight_model2_Tau.nii"	\
sub-REDCAT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT168_searchlight_model2_Tau.nii"	\
sub-REDCAT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT170_searchlight_model2_Tau.nii"	\
sub-REDCAT173	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT173_searchlight_model2_Tau.nii"	\
sub-REDCAT174	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT174_searchlight_model2_Tau.nii"	\
sub-REDCAT175	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT175_searchlight_model2_Tau.nii"	\
sub-REDCAT177	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT177_searchlight_model2_Tau.nii"	\
sub-REDCAT181	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT181_searchlight_model2_Tau.nii"	\
sub-REDCAT182	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT182_searchlight_model2_Tau.nii"	\
sub-REDCAT184	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT184_searchlight_model2_Tau.nii"	\
sub-REDCAT187	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT187_searchlight_model2_Tau.nii"	\
sub-REDCAT189	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT189_searchlight_model2_Tau.nii"	\
sub-REDCAT191	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT191_searchlight_model2_Tau.nii"	\
sub-REDCAT192	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCAT192_searchlight_model2_Tau.nii"	\
sub-REDCMNT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT123_searchlight_model2_Tau.nii"	\
sub-REDCMNT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT125_searchlight_model2_Tau.nii"	\
sub-REDCMNT128	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT128_searchlight_model2_Tau.nii"	\
sub-REDCMNT129	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT129_searchlight_model2_Tau.nii"	\
sub-REDCMNT130	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT130_searchlight_model2_Tau.nii"	\
sub-REDCMNT136	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT136_searchlight_model2_Tau.nii"	\
sub-REDCMNT137	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT137_searchlight_model2_Tau.nii"	\
sub-REDCMNT138	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT138_searchlight_model2_Tau.nii"	\
sub-REDCMNT140	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT140_searchlight_model2_Tau.nii"	\
sub-REDCMNT142	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT142_searchlight_model2_Tau.nii"	\
sub-REDCMNT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT144_searchlight_model2_Tau.nii"	\
sub-REDCMNT146	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT146_searchlight_model2_Tau.nii"	\
sub-REDCMNT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT147_searchlight_model2_Tau.nii"	\
sub-REDCMNT151	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT151_searchlight_model2_Tau.nii"	\
sub-REDCMNT153	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT153_searchlight_model2_Tau.nii"	\
sub-REDCMNT154	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT154_searchlight_model2_Tau.nii"	\
sub-REDCMNT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT157_searchlight_model2_Tau.nii"	\
sub-REDCMNT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT161_searchlight_model2_Tau.nii"	\
sub-REDCMNT162	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT162_searchlight_model2_Tau.nii"	\
sub-REDCMNT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT166_searchlight_model2_Tau.nii"	\
sub-REDCMNT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT167_searchlight_model2_Tau.nii"	\
sub-REDCMNT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT168_searchlight_model2_Tau.nii"	\
sub-REDCMNT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/sub-REDCMNT170_searchlight_model2_Tau.nii"	\
-mask /data/bswift-1/jmerch/CAT/code/resampledMask.nii  
#-Clustsim \
#-prefix_clustsim M1minM2_Tau_SL_Clust