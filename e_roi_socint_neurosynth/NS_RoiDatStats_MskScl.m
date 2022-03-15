
clear all; close all;
cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/MskScl');

% Define ROIs
rois={'dmPFC.nii.gz' 'lATL.nii.gz' 'lCaudate.nii.gz' 'lCrblm.nii.gz' 'lTPJ.nii.gz' 'pgACC.nii.gz' 'rATL.nii.gz' 'rCrblm.nii.gz' 'rITG.nii.gz' 'rTPJ.nii.gz' 'rvlPFC.nii.gz' 'sgACC.nii.gz' 'vmPFC.nii.gz'};
roi_names={'dmPFC' 'lATL' 'lCaudate' 'lCrblm' 'lTPJ' 'pgACC' 'rATL' 'rCrblm' 'rITG' 'rTPJ' 'rvlPFC' 'sgACC' 'vmPFC'};

% Define paths
sub_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/MskScl';
roi_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/MskScl';

% define subject variables
Subs={'sub-REDCAT107' 'sub-REDCAT108' 'sub-REDCAT109' 'sub-REDCAT110' 'sub-REDCAT111' 'sub-REDCAT112' 'sub-REDCAT115' 'sub-REDCAT116' 'sub-REDCAT117' 'sub-REDCAT118' 'sub-REDCAT119' 'sub-REDCAT120' 'sub-REDCAT123' 'sub-REDCAT124' 'sub-REDCAT125' 'sub-REDCAT127' 'sub-REDCAT132' 'sub-REDCAT133' 'sub-REDCAT134' 'sub-REDCAT135' 'sub-REDCAT139' 'sub-REDCAT144' 'sub-REDCAT145' 'sub-REDCAT147' 'sub-REDCAT148' 'sub-REDCAT149' 'sub-REDCAT150' 'sub-REDCAT152' 'sub-REDCAT155' 'sub-REDCAT157' 'sub-REDCAT160' 'sub-REDCAT161' 'sub-REDCAT164' 'sub-REDCAT165' 'sub-REDCAT166' 'sub-REDCAT167' 'sub-REDCAT168' 'sub-REDCAT170' 'sub-REDCAT173' 'sub-REDCAT174' 'sub-REDCAT175' 'sub-REDCAT177' 'sub-REDCAT181' 'sub-REDCAT182' 'sub-REDCAT184' 'sub-REDCAT187' 'sub-REDCAT189' 'sub-REDCAT191' 'sub-REDCAT192' 'sub-REDCMNT123' 'sub-REDCMNT125' 'sub-REDCMNT128' 'sub-REDCMNT129' 'sub-REDCMNT130' 'sub-REDCMNT136' 'sub-REDCMNT137' 'sub-REDCMNT138' 'sub-REDCMNT140' 'sub-REDCMNT142' 'sub-REDCMNT144' 'sub-REDCMNT146' 'sub-REDCMNT147' 'sub-REDCMNT151' 'sub-REDCMNT153' 'sub-REDCMNT154' 'sub-REDCMNT157' 'sub-REDCMNT161' 'sub-REDCMNT162' 'sub-REDCMNT166' 'sub-REDCMNT167' 'sub-REDCMNT168' 'sub-REDCMNT170'};

% give indices for 3 run subs
Runs=[4 2 3 4 4 2 4 3 4 3 4 2 4 3 4 3 4 4 4 4 2 4 4 4 4 3 3 3 4 4 4 4 4 3 3 3 3 4 4 4 4 3 4 4 4 4 4 3 2 4 4 4 4 3 4 4 4 4 4 4 4 4 4 3 4 4 3 4 4 4 4 3];

% model1: CM=PM=PMN ~=CNM
model1=[0 1 0 0; 1 0 1 1; 0 1 0 0; 0 1 0 0];
model1cc = pdist(model1, 'euclidean');

% model2: Peer - Character
model2=[0 0 1 1; 0 0 1 1; 1 1 0 0; 1 1 0 0];
model2cc = pdist(model2, 'euclidean');

% model3: Ment - NM
model3=[0 1 0 1; 1 0 1 0; 0 1 0 1; 1 0 1 0];
model3cc = pdist(model3, 'euclidean');

% INITIALIZE RSA TOOLBOX
userOptions = defineUserOptions();
userOptions.rootPath = roi_path;
userOptions.projectName = 'Conj';
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
userOptions.rubberbands=true;
userOptions.plotpValues='=';
userOptions.saveFiguresPDF=false;
userOptions.saveFiguresJpg=true;
userOptions.resultsPath=fullfile(roi_path,'Graphs');

Mats=dir('*.mat');


for m = 1:length(Mats)
    load(Mats(m).name,'euclideans','EucRaw','RoiDat_MskScl','eucRDM');
    RoiDat=RoiDat_MskScl;
    clear RoiDat_MskScl
    RoiName=roi_names{1,m};
    userOptions.analysisName = RoiName;
    
    % Create structure for different euclideans
    Eucs=struct('AllRun',[],'AllRunMC',[],'AvgRunMC',[],'AllRunRes',[],'AvgRunRes',[]);
    
    % Create structure for different eucRDMs
    EucRDMs=struct('AllRunMC',eucRDM(:),'AvgRunMC',eucRDM(:),'AllRunRes',eucRDM(:),'AvgRunRes',eucRDM(:));
        
    % Create empty matrix to add results of ranksum test to
    % columns are p, h, ranksum, and z
    RankSumTestAllRuns=struct('M1',[],'M2',[],'M3',[]);
    RankSumTestAvgRuns=struct('M1',[],'M2',[],'M3',[]);
    
    % Create structure to add model fit taus to after mean centering
    % voxels from mean ROI activation. Will include all 3 models in one
    Taus=struct('AllRunMC',[],'AvgRunMC',[],'AllRunRes',[],'AvgRunRes',[]);
    
    % Create structure for mean univariate activation
    MeanUni=struct('AllRun',[],'AvgRun',[]);
    
    % create empty matrix for distance between univariate
    UniDist=zeros(72,6);
    
    % Loop through subjects
    for s = 1:72
        
        % Get mean Unis
        MeanUni(s).AllRun=mean(RoiDat(s).ds_no_zeros.samples,2);
        MeanUni(s).AvgRun=mean(RoiDat(s).ds_unique_no_constant.samples,2)';
        
        % separate out the 
        tmp_ds_AllRuns=RoiDat(s).ds_no_zeros;
        tmp_ds_AllRunsMC=RoiDat(s).ds_no_zeros;
        tmp_ds_AllRunsMC.samples=tmp_ds_AllRuns.samples-MeanUni(s).AllRun;
        tmp_ds_AllRunsMC_Avgd=cosmo_fx(tmp_ds_AllRunsMC, @(x)mean(x,1), 'targets', 1);
        
        
        
        % loop through runs to get euclideans per distances per run
        EucsByRun=[]; EucsByRunMC=[]; 
        for r = 1:4:length(MeanUni(s).AllRun)
            EucsByRun=[EucsByRun;  cosmo_pdist(tmp_ds_AllRuns.samples(r:r+3,:), 'euclidean')];
            EucsByRunMC=[EucsByRunMC;  cosmo_pdist(tmp_ds_AllRunsMC.samples(r:r+3,:), 'euclidean')];
        end
        
        % Add to structure
        Eucs(s).AllRun=EucsByRun;
        Eucs(s).AllRunMC=EucsByRunMC;
        EucsByRunMC_avg=mean(EucsByRunMC);
        
        
        % Add to RDM structure of RSA toolbox
        EucRDMs.AllRunMC(s).RDM=rsa.rdm.squareRDM(EucsByRunMC_avg);
        
        % calculate taus
        Taus.AllRunMC(s,:)=[rsa.stat.rankCorr_Kendall_taua(EucsByRunMC_avg',model1cc') ...
            rsa.stat.rankCorr_Kendall_taua(EucsByRunMC_avg',model2cc') ...
            rsa.stat.rankCorr_Kendall_taua(EucsByRunMC_avg',model3cc')];
        
        %clear EucsByRun EucsByRunMC EucsByRunMC_avg
        
        %% Start doing rank sum test based on multiple runs
        % get number of runs
        NumRuns=length(MeanUni(s).AllRun)/4;
        
        M1=repmat(model1cc,1,NumRuns)'>1;
        M2=repmat(model2cc,1,NumRuns)'>1;
        M3=repmat(model3cc,1,NumRuns)'>1;
        

        
        EucByRunVec=reshape(EucsByRun',[NumRuns*6,1]);
        
        [p,h,stats]=ranksum(EucByRunVec(M1),EucByRunVec(~M1));
        if ~isfield(stats,'zval')
            stats.zval=NaN;
        end
        RankSumTestAllRuns.M1(s,:)=[p h stats.ranksum stats.zval];
        
        [p,h,stats]=ranksum(EucByRunVec(M2),EucByRunVec(~M2));
        if ~isfield(stats,'zval')
            stats.zval=NaN;
        end
        RankSumTestAllRuns.M2(s,:)=[p h stats.ranksum stats.zval];
        
        [p,h,stats]=ranksum(EucByRunVec(M3),EucByRunVec(~M3));
        if ~isfield(stats,'zval')
            stats.zval=NaN;
        end
        RankSumTestAllRuns.M3(s,:)=[p h stats.ranksum stats.zval];
        
        clear p h stats M1 M2 M3

        % 
        tmp_ds_AvgRuns=RoiDat(s).ds_unique_no_constant;
        
        tmp_ds_AvgRunsMC=tmp_ds_AvgRuns;
        tmp_ds_AvgRunsMC.samples=tmp_ds_AvgRuns.samples-MeanUni(s).AvgRun';
        
        AvgRunMC_Euc=cosmo_pdist(tmp_ds_AvgRunsMC.samples, 'euclidean')';
        Eucs(s).AvgRunMC=AvgRunMC_Euc';
        EucRDMs.AvgRunMC(s).RDM=rsa.rdm.squareRDM(AvgRunMC_Euc');
        
        Taus.AvgRunMC(s,:)=[rsa.stat.rankCorr_Kendall_taua(AvgRunMC_Euc,model1cc') ...
            rsa.stat.rankCorr_Kendall_taua(AvgRunMC_Euc,model2cc') ...
            rsa.stat.rankCorr_Kendall_taua(AvgRunMC_Euc,model3cc')];
        
        M1=model1cc'>1; M2=model2cc'>1; M3=model3cc'>1;
        
        [p,h,stats]=ranksum(AvgRunMC_Euc(M1),AvgRunMC_Euc(~M1));
        if ~isfield(stats,'zval')
            stats.zval=NaN;
        end
        RankSumTestAvgRuns.M1(s,:)=[p h stats.ranksum stats.zval];
        
        [p,h,stats]=ranksum(AvgRunMC_Euc(M2),AvgRunMC_Euc(~M2));
        if ~isfield(stats,'zval')
            stats.zval=NaN;
        end
        RankSumTestAvgRuns.M2(s,:)=[p h stats.ranksum stats.zval];
        
        [p,h,stats]=ranksum(AvgRunMC_Euc(M3),AvgRunMC_Euc(~M3));
        if ~isfield(stats,'zval')
            stats.zval=NaN;
        end
        RankSumTestAvgRuns.M3(s,:)=[p h stats.ranksum stats.zval];
        
        UniDist(s,:)=cosmo_pdist(MeanUni(s).AvgRun', 'euclidean');
        
        Mdl=fitlm(UniDist(s,:)',mean(Eucs(s).AllRun)');
        Eucs(s).AllRunRes=Mdl.Residuals.Raw';
        EucRDMs.AllRunRes(s).RDM=rsa.rdm.squareRDM(Eucs(s).AllRunRes');
        Taus.AllRunRes(s,:)=[rsa.stat.rankCorr_Kendall_taua(Eucs(s).AllRunRes',model1cc') ...
            rsa.stat.rankCorr_Kendall_taua(Eucs(s).AllRunRes',model2cc') ...
            rsa.stat.rankCorr_Kendall_taua(Eucs(s).AllRunRes',model3cc')];
        
        Mdl=fitlm(UniDist(s,:)',EucRaw(s,:)');
        Eucs(s).AvgRunRes=Mdl.Residuals.Raw';
        EucRDMs.AvgRunRes(s).RDM=rsa.rdm.squareRDM(Eucs(s).AvgRunRes');
        Taus.AvgRunRes(s,:)=[rsa.stat.rankCorr_Kendall_taua(Eucs(s).AvgRunRes',model1cc') ...
            rsa.stat.rankCorr_Kendall_taua(Eucs(s).AvgRunRes',model2cc') ...
            rsa.stat.rankCorr_Kendall_taua(Eucs(s).AvgRunRes',model3cc')];
        
    end
    save(Mats(m).name,'Eucs', 'EucRDMs', 'RankSumTestAllRuns', 'RankSumTestAvgRuns', 'Taus', 'MeanUni', 'UniDist', '-append')
end