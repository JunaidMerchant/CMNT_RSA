#!/bin/tcsh
#
#SBATCH --time=48:00:00
#SBATCH --cores=8
#SBATCH --mem=42000
#SBATCH --output=M1SLNewST.log

#module load afni/20.2.14
# apply any data directories with variables
cd /data/bswift-1/jmerch/CAT/searchlight/rx_MskScl
echo --------------------------------
echo "AltZ"
echo "starting at:"
date
echo --------------------------------
3dttest++                \
-prefix Model1_AltZ_searchlight    	\
-setA 	Model1_AltZsearchlight \
sub-REDCAT107	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT107_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT108	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT108_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT109	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT109_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT110	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT110_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT111	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT111_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT112	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT112_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT115	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT115_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT116	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT116_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT117	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT117_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT118	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT118_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT119	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT119_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT120	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT120_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT123_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT124	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT124_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT125_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT127	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT127_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT132	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT132_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT133	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT133_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT134	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT134_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT135	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT135_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT139	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT139_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT144_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT145	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT145_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT147_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT148	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT148_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT149	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT149_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT150	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT150_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT152	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT152_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT155	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT155_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT157_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT160	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT160_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT161_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT164	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT164_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT165	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT165_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT166_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT167_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT168_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT170_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT173	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT173_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT174	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT174_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT175	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT175_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT177	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT177_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT181	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT181_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT182	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT182_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT184	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT184_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT187	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT187_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT189	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT189_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT191	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT191_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCAT192	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT192_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT123_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT125_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT128	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT128_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT129	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT129_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT130	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT130_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT136	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT136_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT137	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT137_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT138	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT138_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT140	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT140_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT142	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT142_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT144_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT146	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT146_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT147_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT151	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT151_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT153	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT153_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT154	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT154_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT157_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT161_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT162	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT162_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT166_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT167_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT168_searchlight_MskScl_model1_AltZ.nii"	\
sub-REDCMNT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT170_searchlight_MskScl_model1_AltZ.nii"	\
-mask /data/bswift-1/jmerch/CAT/code/resampledMask.nii  \
-Clustsim \
-prefix_clustsim Model1_AltZ_searchlight_Clust
#
#
#
#########################################################################################
echo --------------------------------
echo "FisherZ"
echo "starting at:"
date
echo --------------------------------
3dttest++                \
-prefix Model1_FisherZ_searchlight    	\
-setA 	Model1_FisherZsearchlight \
sub-REDCAT107	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT107_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT108	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT108_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT109	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT109_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT110	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT110_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT111	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT111_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT112	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT112_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT115	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT115_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT116	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT116_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT117	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT117_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT118	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT118_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT119	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT119_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT120	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT120_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT123_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT124	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT124_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT125_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT127	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT127_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT132	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT132_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT133	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT133_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT134	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT134_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT135	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT135_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT139	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT139_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT144_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT145	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT145_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT147_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT148	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT148_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT149	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT149_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT150	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT150_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT152	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT152_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT155	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT155_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT157_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT160	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT160_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT161_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT164	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT164_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT165	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT165_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT166_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT167_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT168_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT170_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT173	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT173_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT174	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT174_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT175	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT175_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT177	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT177_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT181	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT181_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT182	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT182_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT184	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT184_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT187	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT187_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT189	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT189_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT191	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT191_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCAT192	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT192_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT123_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT125_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT128	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT128_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT129	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT129_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT130	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT130_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT136	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT136_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT137	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT137_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT138	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT138_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT140	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT140_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT142	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT142_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT144_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT146	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT146_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT147_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT151	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT151_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT153	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT153_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT154	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT154_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT157_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT161_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT162	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT162_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT166_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT167_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT168_searchlight_MskScl_model1_FisherZ.nii"	\
sub-REDCMNT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT170_searchlight_MskScl_model1_FisherZ.nii"	\
-mask /data/bswift-1/jmerch/CAT/code/resampledMask.nii  \
-Clustsim \
-prefix_clustsim Model1_FisherZ_searchlight_Clust
#
#
#
#########################################################################################
echo --------------------------------
echo "Tau"
echo "starting at:"
date
echo --------------------------------
3dttest++ \
-prefix Model1_Tau_searchlight \
-setA 	Model1_Tausearchlight \
sub-REDCAT107	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT107_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT108	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT108_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT109	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT109_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT110	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT110_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT111	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT111_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT112	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT112_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT115	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT115_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT116	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT116_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT117	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT117_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT118	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT118_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT119	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT119_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT120	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT120_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT123_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT124	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT124_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT125_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT127	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT127_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT132	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT132_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT133	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT133_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT134	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT134_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT135	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT135_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT139	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT139_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT144_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT145	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT145_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT147_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT148	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT148_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT149	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT149_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT150	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT150_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT152	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT152_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT155	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT155_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT157_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT160	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT160_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT161_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT164	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT164_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT165	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT165_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT166_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT167_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT168_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT170_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT173	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT173_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT174	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT174_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT175	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT175_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT177	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT177_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT181	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT181_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT182	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT182_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT184	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT184_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT187	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT187_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT189	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT189_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT191	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT191_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCAT192	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCAT192_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT123	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT123_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT125	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT125_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT128	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT128_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT129	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT129_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT130	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT130_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT136	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT136_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT137	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT137_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT138	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT138_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT140	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT140_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT142	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT142_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT144	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT144_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT146	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT146_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT147	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT147_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT151	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT151_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT153	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT153_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT154	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT154_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT157	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT157_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT161	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT161_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT162	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT162_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT166	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT166_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT167	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT167_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT168	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT168_searchlight_MskScl_model1_Tau.nii"	\
sub-REDCMNT170	"/data/bswift-1/jmerch/CAT/searchlight/fx1to3_MskScl_AltTauZ/sub-REDCMNT170_searchlight_MskScl_model1_Tau.nii"	\
-mask /data/bswift-1/jmerch/CAT/code/resampledMask.nii  \
-Clustsim \
-prefix_clustsim Model1_Tau_searchlight_Clust