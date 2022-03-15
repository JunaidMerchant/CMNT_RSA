function SearchlightRSA_Models1to3_CombinedRunsAcc(SUB)

close all; clearvars -except SUB
addpath(genpath('/data/bswift-1/jmerch/CAT/code/rsatoolbox-develop'));
addpath(genpath('/data/bswift-1/jmerch/CAT/code/CoSMoMVPA-master'));
addpath('/data/bswift-1/jmerch/CAT/code/NEWSLICETIME');
% Define sub list
Subs={'sub-REDCAT107' 'sub-REDCAT108' 'sub-REDCAT109' 'sub-REDCAT110' 'sub-REDCAT111' 'sub-REDCAT112' 'sub-REDCAT115' 'sub-REDCAT116' 'sub-REDCAT117' 'sub-REDCAT118' 'sub-REDCAT119' 'sub-REDCAT120' 'sub-REDCAT123' 'sub-REDCAT124' 'sub-REDCAT125' 'sub-REDCAT127' 'sub-REDCAT132' 'sub-REDCAT133' 'sub-REDCAT134' 'sub-REDCAT135' 'sub-REDCAT139' 'sub-REDCAT144' 'sub-REDCAT145' 'sub-REDCAT147' 'sub-REDCAT148' 'sub-REDCAT149' 'sub-REDCAT150' 'sub-REDCAT152' 'sub-REDCAT155' 'sub-REDCAT157' 'sub-REDCAT160' 'sub-REDCAT161' 'sub-REDCAT164' 'sub-REDCAT165' 'sub-REDCAT166' 'sub-REDCAT167' 'sub-REDCAT168' 'sub-REDCAT170' 'sub-REDCAT173' 'sub-REDCAT174' 'sub-REDCAT175' 'sub-REDCAT177' 'sub-REDCAT181' 'sub-REDCAT182' 'sub-REDCAT184' 'sub-REDCAT187' 'sub-REDCAT189' 'sub-REDCAT191' 'sub-REDCAT192' 'sub-REDCMNT123' 'sub-REDCMNT125' 'sub-REDCMNT128' 'sub-REDCMNT129' 'sub-REDCMNT130' 'sub-REDCMNT136' 'sub-REDCMNT137' 'sub-REDCMNT138' 'sub-REDCMNT140' 'sub-REDCMNT142' 'sub-REDCMNT144' 'sub-REDCMNT146' 'sub-REDCMNT147' 'sub-REDCMNT151' 'sub-REDCMNT153' 'sub-REDCMNT154' 'sub-REDCMNT157' 'sub-REDCMNT161' 'sub-REDCMNT162' 'sub-REDCMNT166' 'sub-REDCMNT167' 'sub-REDCMNT168' 'sub-REDCMNT170'};

% give indices for 3 run subs
Runs=[4 2 3 4 4 2 4 3 4 3 4 2 4 3 4 3 4 4 4 4 2 4 4 4 4 3 3 3 4 4 4 4 4 3 3 3 3 4 4 4 4 3 4 4 4 4 4 3 2 4 4 4 4 3 4 4 4 4 4 4 4 4 4 3 4 4 3 4 4 4 4 3];

% define models
model1=[0 1 0 0; 1 0 1 1; 0 1 0 0; 0 1 0 0];
model2=[0 0 1 1; 0 0 1 1; 1 1 0 0; 1 1 0 0];
model3=[0 1 0 1; 1 0 1 0; 0 1 0 1; 1 0 1 0];


% define s index 
s=find(strcmp(Subs,SUB));

% define config variables
config=cosmo_config();
config.tutorial_data_path='/data/bswift-1/jmerch/CAT/subs';
data_path=fullfile(config.tutorial_data_path);
study_path=data_path;
config.output_data_path='/data/bswift-1/jmerch/CAT/searchlight/fx1to3_CombinedRunsAcc/';
sub=Subs{s};

% echo subject
disp('--------------------------------------------------')
disp(strcat('working on: ',sub))
datetime

% get subject data
sub_path=fullfile(study_path,sub,'newST_combinedRuns_Acc');
mask_fn='/data/bswift-1/jmerch/CAT/code/resampledMask.nii';
ds_fn=fullfile(sub_path,strcat(Subs{s},'_AllCond_T_CombinedRunsAcc.nii.gz'));

% create full cosmo dataset
ds_tmp = cosmo_fmri_dataset(ds_fn,...
    'mask',mask_fn,...
    'targets',[1:4]');

[ds_full,num_vox] = remove_zero_cosmo_ds(ds_tmp);

% create average cosmo dataset
ds=cosmo_fx(ds_full, @(x)mean(x,1), 'targets', 1);

% define dsm measure
measure = @cosmo_target_dsm_corr_measure;
measure_args = struct();
measure_args.metric = 'euclidean';
measure_args.type = 'Kendall';
measure_args.center_data=true;

%% Define target dsm model 1
measure_args.target_dsm = model1;

voxel_count=100;

nbrhood=cosmo_spherical_neighborhood(ds,'count',voxel_count);
%glm_dsm_results = cosmo_searchlight(ds,nbrhood,measure,measure_args);
output_path=config.output_data_path;

%cosmo_map2fmri(glm_dsm_results, ...
%fullfile(output_path,strcat(sub,'_searchlight_model1_Tau.nii')));

% R to Z
%glm_dsm_results2=glm_dsm_results;
%glm_dsm_results2.samples=atanh(glm_dsm_results2.samples);
%cosmo_map2fmri(glm_dsm_results2, ...
%fullfile(output_path,strcat(sub,'_searchlight_model1_FisherZ.nii')));



% glm_dsm_results.samples=tau2z(glm_dsm_results.samples);
% 
% cosmo_map2fmri(glm_dsm_results, ...
% fullfile(output_path,strcat(sub,'_searchlight_model1_AltZ.nii')));


% disp('--------------------------------------------------')
% disp('Model 1 Complete!')
%% Model2
clear glm_dsm_results

measure_args.target_dsm = model2;
glm_dsm_results = cosmo_searchlight(ds,nbrhood,measure,measure_args);

cosmo_map2fmri(glm_dsm_results, ...
fullfile(output_path,strcat(sub,'_searchlight_model2_Tau.nii')));

% R to Z
glm_dsm_results2=glm_dsm_results;
glm_dsm_results2.samples=atanh(glm_dsm_results2.samples);
cosmo_map2fmri(glm_dsm_results2, ...
fullfile(output_path,strcat(sub,'_searchlight_model2_FisherZ.nii')));



% glm_dsm_results.samples=tau2z(glm_dsm_results.samples);
% 
% cosmo_map2fmri(glm_dsm_results, ...
% fullfile(output_path,strcat(sub,'_searchlight_model2_AltZ.nii')));

disp('--------------------------------------------------')
disp('Model 2 Complete!')
%% Model3
clear glm_dsm_results

measure_args.target_dsm = model3;
glm_dsm_results = cosmo_searchlight(ds,nbrhood,measure,measure_args);

cosmo_map2fmri(glm_dsm_results, ...
fullfile(output_path,strcat(sub,'_searchlight_model3_Tau.nii')));

% R to Z
glm_dsm_results2=glm_dsm_results;
glm_dsm_results2.samples=atanh(glm_dsm_results2.samples);
cosmo_map2fmri(glm_dsm_results2, ...
fullfile(output_path,strcat(sub,'_searchlight_model3_FisherZ.nii')));



% glm_dsm_results.samples=tau2z(glm_dsm_results.samples);
% 
% cosmo_map2fmri(glm_dsm_results, ...
% fullfile(output_path,strcat(sub,'_searchlight_model3_AltZ.nii')));


disp('--------------------------------------------------')
disp('Model 3 Complete!')
datetime
end











