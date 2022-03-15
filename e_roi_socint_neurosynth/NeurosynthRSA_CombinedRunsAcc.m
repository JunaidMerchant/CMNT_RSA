clear all; close all;
addpath(genpath('/data/bswift-1/jmerch/CAT/code/rsatoolbox-develop'));
addpath(genpath('/data/bswift-1/jmerch/CAT/code/CoSMoMVPA-master'));
addpath('/data/bswift-1/jmerch/CAT/code/NEWSLICETIME');
% Change into project directory
cd('/data/bswift-1/jmerch/CAT/rois/Neurosynth');

% set up cosmo config
config=cosmo_config();

% Define ROIs
rois={'dmPFC.nii.gz' 'lATL.nii.gz' 'lCaudate.nii.gz' 'lCrblm.nii.gz' 'lTPJ.nii.gz' 'pgACC.nii.gz' 'rATL.nii.gz' 'rCrblm.nii.gz' 'rITG.nii.gz' 'rTPJ.nii.gz' 'rvlPFC.nii.gz' 'sgACC.nii.gz' 'vmPFC.nii.gz'};
roi_names={'dmPFC' 'lATL' 'lCaudate' 'lCrblm' 'lTPJ' 'pgACC' 'rATL' 'rCrblm' 'rITG' 'rTPJ' 'rvlPFC' 'sgACC' 'vmPFC'};

% Define paths
sub_path='/data/bswift-1/jmerch/CAT/subs';
roi_path='/data/bswift-1/jmerch/CAT/rois/Neurosynth';

% define subject variables
Orig28={'sub-REDCAT107' 'sub-REDCAT108' 'sub-REDCAT110' 'sub-REDCAT111' 'sub-REDCAT115' 'sub-REDCMNT123' 'sub-REDCMNT125' 'sub-REDCMNT128' 'sub-REDCMNT129' 'sub-REDCMNT130' 'sub-REDCMNT136' 'sub-REDCMNT137' 'sub-REDCMNT138' 'sub-REDCMNT140' 'sub-REDCMNT142' 'sub-REDCMNT144' 'sub-REDCMNT146' 'sub-REDCMNT147' 'sub-REDCMNT151' 'sub-REDCMNT153' 'sub-REDCMNT154' 'sub-REDCMNT157' 'sub-REDCMNT161' 'sub-REDCMNT162' 'sub-REDCMNT166' 'sub-REDCMNT167' 'sub-REDCMNT168' 'sub-REDCMNT170'};
Subs={'sub-REDCAT107' 'sub-REDCAT108' 'sub-REDCAT109' 'sub-REDCAT110' 'sub-REDCAT111' 'sub-REDCAT112' 'sub-REDCAT115' 'sub-REDCAT116' 'sub-REDCAT117' 'sub-REDCAT118' 'sub-REDCAT119' 'sub-REDCAT120' 'sub-REDCAT123' 'sub-REDCAT124' 'sub-REDCAT125' 'sub-REDCAT127' 'sub-REDCAT132' 'sub-REDCAT133' 'sub-REDCAT134' 'sub-REDCAT135' 'sub-REDCAT139' 'sub-REDCAT144' 'sub-REDCAT145' 'sub-REDCAT147' 'sub-REDCAT148' 'sub-REDCAT149' 'sub-REDCAT150' 'sub-REDCAT152' 'sub-REDCAT155' 'sub-REDCAT157' 'sub-REDCAT160' 'sub-REDCAT161' 'sub-REDCAT164' 'sub-REDCAT165' 'sub-REDCAT166' 'sub-REDCAT167' 'sub-REDCAT168' 'sub-REDCAT170' 'sub-REDCAT173' 'sub-REDCAT174' 'sub-REDCAT175' 'sub-REDCAT177' 'sub-REDCAT181' 'sub-REDCAT182' 'sub-REDCAT184' 'sub-REDCAT187' 'sub-REDCAT189' 'sub-REDCAT191' 'sub-REDCAT192' 'sub-REDCMNT123' 'sub-REDCMNT125' 'sub-REDCMNT128' 'sub-REDCMNT129' 'sub-REDCMNT130' 'sub-REDCMNT136' 'sub-REDCMNT137' 'sub-REDCMNT138' 'sub-REDCMNT140' 'sub-REDCMNT142' 'sub-REDCMNT144' 'sub-REDCMNT146' 'sub-REDCMNT147' 'sub-REDCMNT151' 'sub-REDCMNT153' 'sub-REDCMNT154' 'sub-REDCMNT157' 'sub-REDCMNT161' 'sub-REDCMNT162' 'sub-REDCMNT166' 'sub-REDCMNT167' 'sub-REDCMNT168' 'sub-REDCMNT170'};
New44={'sub-REDCAT109','sub-REDCAT112','sub-REDCAT116','sub-REDCAT117','sub-REDCAT118','sub-REDCAT119','sub-REDCAT120','sub-REDCAT123','sub-REDCAT124','sub-REDCAT125','sub-REDCAT127','sub-REDCAT132','sub-REDCAT133','sub-REDCAT134','sub-REDCAT135','sub-REDCAT139','sub-REDCAT144','sub-REDCAT145','sub-REDCAT147','sub-REDCAT148','sub-REDCAT149','sub-REDCAT150','sub-REDCAT152','sub-REDCAT155','sub-REDCAT157','sub-REDCAT160','sub-REDCAT161','sub-REDCAT164','sub-REDCAT165','sub-REDCAT166','sub-REDCAT167','sub-REDCAT168','sub-REDCAT170','sub-REDCAT173','sub-REDCAT174','sub-REDCAT175','sub-REDCAT177','sub-REDCAT181','sub-REDCAT182','sub-REDCAT184','sub-REDCAT187','sub-REDCAT189','sub-REDCAT191','sub-REDCAT192'};
New44indx=[false,false,true,false,false,true,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
Orig28indx=[true,true,false,true,true,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true];

% give indices for 3 run subs
Runs=[4 2 3 4 4 2 4 3 4 3 4 2 4 3 4 3 4 4 4 4 2 4 4 4 4 3 3 3 4 4 4 4 4 3 3 3 3 4 4 4 4 3 4 4 4 4 4 3 2 4 4 4 4 3 4 4 4 4 4 4 4 4 4 3 4 4 3 4 4 4 4 3];

% Define conceptual models
% model1: CM=PM=PMN ~=CNM
model1=[0 1 0 0; 1 0 1 1; 0 1 0 0; 0 1 0 0];
model1cc = pdist(model1, 'euclidean');

% model2: Peer - Character
model2=[0 0 1 1; 0 0 1 1; 1 1 0 0; 1 1 0 0];
model2cc = pdist(model2, 'euclidean');

% model3: Ment - NM
model3=[0 1 0 1; 1 0 1 0; 0 1 0 1; 1 0 1 0];
model3cc = pdist(model3, 'euclidean');

% make cell with models
models=cell(3,1);
models{1}=model1cc; models{2}=model2cc; models{3}=model3cc;
candRDMs=struct('RDM',[],'name',char(),'color',[]);
candRDMs(1).RDM=model1; candRDMs(1).name='model1'; candRDMs(1).color=[1 0 0];
candRDMs(2).RDM=model2; candRDMs(2).name='model2'; candRDMs(2).color=[0 1 0];
candRDMs(3).RDM=model3; candRDMs(3).name='model3'; candRDMs(3).color=[0 0 1];

% INITIALIZE RSA TOOLBOX

userOptions = defineUserOptions();
userOptions.rootPath = roi_path;
userOptions.projectName = 'Item7models';
userOptions.analysisName = 'Roi';
userOptions.maskPath = roi_path;
userOptions.maskNames = roi_names;
userOptions.subjectNames=Subs;
userOptions.voxelSize = [2 2 2];
userOptions.getSPMData = 1==0;
userOptions.conditionLabels = {'CM' 'CNM' 'PM' 'PNM'};
userOptions.conditionColours = [1 0 0 ; 0 1 0 ; 0 0 1 ; 0 0 0 ];
userOptions.RDMcorrelationType='Kendall_taua';
userOptions.RDMrelatednessMultipleTesting='FDR';
userOptions.candRDMdifferencesTest='subjectRFXsignedRank';
userOptions.RDMrelatednessTest = 'subjectRFXsignedRank';
userOptions.RDMrelatednessThreshold = 0.05;
userOptions.figureIndex = [10 11];
userOptions.RDMrelatednessMultipleTesting = 'FDR';
userOptions.candRDMdifferencesThreshold = 0.05;
userOptions.candRDMdifferencesMultipleTesting = 'FDR';
userOptions.rubberbands=false;
userOptions.plotpValues='=';
userOptions.saveFiguresPDF=false;
userOptions.saveFiguresJpg=false;
userOptions.resultsPath=fullfile(roi_path);


%%
% start loop over ROIs
for r = 1:length(rois)
    
    disp('----'); disp('working on:'); disp(roi_names{r}); disp(datetime);
    % define mask
    mask_fn=fullfile(roi_path,rois{r});
    % create empty mat for euclideans distances
    euclideans=zeros(length(Subs),length(model2cc));
    EucRaw=zeros(length(Subs),length(model2cc));

    % create empty vector for counting the number of voxels per ROI (column) for each subject (rows)
    NumVoxPerSub=zeros(length(Subs),1);

    eucRDM=struct('RDM',[],'name',char(),'color',[]);
    
    
    % Creat empty arrays for each model, columns for sample of participants
    M1_taus=zeros(length(Subs),1);
    M2_taus=zeros(length(Subs),1);
    M3_taus=zeros(length(Subs),1);

    
    
    % start loop over subs
    for s = 1:length(Subs)
        
        % select subject data
        ds_fn=fullfile(sub_path,Subs{s},'newST_combinedRuns_Acc',strcat(Subs{s},'_AllCond_T_CombinedRunsAcc.nii.gz'));
        
        % Make mats based on number of runs
        ds_tmp = cosmo_fmri_dataset(ds_fn,...
            'mask',mask_fn,...
            'targets',[1:4]');

        [ds_full,num_vox] = remove_zero_cosmo_ds(ds_tmp);

        NumVoxPerSub(s,1) = num_vox;

        %partitions=zeros(0);
        %for r2 = 1:Runs(s)
        %    partitions=[partitions; ones(4,1)+(r2-1)];
        %end
        %partitions=[ones(4,1); ones(4,1)+1; ones(4,1)+2];
        %Conds=repmat(1:4,1,Runs(s))';
        
        % compute average for each unique target
        ds=cosmo_fx(ds_full, @(x)mean(x,1), 'targets', 1);
        % remove constant features
        ds=cosmo_remove_useless_data(ds);
        
        % calculate euclidean distance between conditions
        tempEuc=cosmo_pdist(ds.samples, 'euclidean');
        EucRaw(s,:) = tempEuc;

        % normalize euclidean distances - subtract minimum and divide by range - and add to euclideans matrix
        euclideans(s,:) = (tempEuc - min(tempEuc))/range(tempEuc);

        % add data to rsa toolbox style structure object
        eucRDM(s).RDM=rsa.rdm.squareRDM(euclideans(s,:));
        eucRDM(s).name=strcat(rois{r},' | ',Subs{s},' | session1');
        eucRDM(s).color=[1 1 1];

        
        
        M1_taus(s,1)=rsa.stat.rankCorr_Kendall_taua(cosmo_pdist(ds.samples,'euclidean')',model1cc');
        M2_taus(s,1)=rsa.stat.rankCorr_Kendall_taua(cosmo_pdist(ds.samples,'euclidean')',model2cc');
        M3_taus(s,1)=rsa.stat.rankCorr_Kendall_taua(cosmo_pdist(ds.samples,'euclidean')',model3cc');

        
        
    end
    
    AvgEucRDM72=rsa.rdm.averageRDMs_subjectSession(eucRDM, 'subject');
    
    % calculate stats using basic sign-rank test on all 72
%     stats_72=rsa.compareRefRDM2candRDMs(eucRDM, candRDMs, userOptions);
    
    save(strcat(roi_path,'/CombinedRunsAcc/',roi_names{1,r},'_72Euc.mat'),'eucRDM','candRDMs','euclideans','M1_taus','M2_taus','M3_taus','AvgEucRDM72', ...
        'EucRaw','NumVoxPerSub');
end