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

% INITIALIZE RSA TOOLBOX

userOptions = defineUserOptions();
userOptions.rootPath = roi_path;
userOptions.projectName = 'Neurosynth';
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

% Loop through ROIs
for m = 1:length(rois)
    load(strcat(roi_names{1,m},'_72Euc.mat'),'eucRDM','candRDMs','NumVoxPerSub','EucRaw');
    RoiName=roi_names{1,m};
    userOptions.analysisName = RoiName;
    
    NumSubs=72;
    
    % Check to see if any ROIs have participants with missing data, in
    % which case we can eliminate them
    if sum(all(NumVoxPerSub==0,2))>0
        indx=all(NumVoxPerSub==0,2);
        NumSubs=sum(~indx);
        eucRDM=eucRDM(~indx);
        indx2=find(indx);
        disp('-----------missing---------')
        disp(RoiName)
        for x = indx2
            disp(Subs{x})
        end
        disp('')
        clear indx indx2
    end

    userOptions.figure1filename=strcat(RoiName,'_',num2str(NumSubs),'EucBar');
    userOptions.figure2filename=strcat(RoiName,'_',num2str(NumSubs),'CandRefs');
    stats_72=rsa.compareRefRDM2candRDMs(eucRDM, candRDMs, userOptions);
    
    close all
    save(strcat(roi_names{1,m},'_72Euc.mat'),'stats_72','-append')
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; close all;
cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/CombinedRuns/Neurosynth');
% Define ROIs
rois={'dmPFC.nii.gz' 'lATL.nii.gz' 'lCaudate.nii.gz' 'lCrblm.nii.gz' 'lTPJ.nii.gz' 'pgACC.nii.gz' 'rATL.nii.gz' 'rCrblm.nii.gz' 'rITG.nii.gz' 'rTPJ.nii.gz' 'rvlPFC.nii.gz' 'sgACC.nii.gz' 'vmPFC.nii.gz'};
roi_names={'dmPFC' 'lATL' 'lCaudate' 'lCrblm' 'lTPJ' 'pgACC' 'rATL' 'rCrblm' 'rITG' 'rTPJ' 'rvlPFC' 'sgACC' 'vmPFC'};

% Define paths
sub_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/CombinedRuns/Neurosynth';
roi_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/CombinedRuns/Neurosynth';

% define subject variables
Subs={'sub-REDCAT107' 'sub-REDCAT108' 'sub-REDCAT109' 'sub-REDCAT110' 'sub-REDCAT111' 'sub-REDCAT112' 'sub-REDCAT115' 'sub-REDCAT116' 'sub-REDCAT117' 'sub-REDCAT118' 'sub-REDCAT119' 'sub-REDCAT120' 'sub-REDCAT123' 'sub-REDCAT124' 'sub-REDCAT125' 'sub-REDCAT127' 'sub-REDCAT132' 'sub-REDCAT133' 'sub-REDCAT134' 'sub-REDCAT135' 'sub-REDCAT139' 'sub-REDCAT144' 'sub-REDCAT145' 'sub-REDCAT147' 'sub-REDCAT148' 'sub-REDCAT149' 'sub-REDCAT150' 'sub-REDCAT152' 'sub-REDCAT155' 'sub-REDCAT157' 'sub-REDCAT160' 'sub-REDCAT161' 'sub-REDCAT164' 'sub-REDCAT165' 'sub-REDCAT166' 'sub-REDCAT167' 'sub-REDCAT168' 'sub-REDCAT170' 'sub-REDCAT173' 'sub-REDCAT174' 'sub-REDCAT175' 'sub-REDCAT177' 'sub-REDCAT181' 'sub-REDCAT182' 'sub-REDCAT184' 'sub-REDCAT187' 'sub-REDCAT189' 'sub-REDCAT191' 'sub-REDCAT192' 'sub-REDCMNT123' 'sub-REDCMNT125' 'sub-REDCMNT128' 'sub-REDCMNT129' 'sub-REDCMNT130' 'sub-REDCMNT136' 'sub-REDCMNT137' 'sub-REDCMNT138' 'sub-REDCMNT140' 'sub-REDCMNT142' 'sub-REDCMNT144' 'sub-REDCMNT146' 'sub-REDCMNT147' 'sub-REDCMNT151' 'sub-REDCMNT153' 'sub-REDCMNT154' 'sub-REDCMNT157' 'sub-REDCMNT161' 'sub-REDCMNT162' 'sub-REDCMNT166' 'sub-REDCMNT167' 'sub-REDCMNT168' 'sub-REDCMNT170'};

% INITIALIZE RSA TOOLBOX

userOptions = defineUserOptions();
userOptions.rootPath = roi_path;
userOptions.projectName = 'Neurosynth';
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


for m = 1:length(rois)
    load(strcat(roi_names{1,m},'_72Euc.mat'));
    RoiName=roi_names{1,m};
    userOptions.analysisName = RoiName;
    
    userOptions.figure1filename=strcat(RoiName,'_72EucBar');
    userOptions.figure2filename=strcat(RoiName,'_72CandRefs');
    stats_72=rsa.compareRefRDM2candRDMs(eucRDM, candRDMs, userOptions);
    
    close all
    save(strcat(roi_names{1,m},'_72Euc.mat'),'stats_72','-append')
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; close all;
cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/CombinedRunsAcc/Neurosynth');
% Define ROIs
rois={'dmPFC.nii.gz' 'lATL.nii.gz' 'lCaudate.nii.gz' 'lCrblm.nii.gz' 'lTPJ.nii.gz' 'pgACC.nii.gz' 'rATL.nii.gz' 'rCrblm.nii.gz' 'rITG.nii.gz' 'rTPJ.nii.gz' 'rvlPFC.nii.gz' 'sgACC.nii.gz' 'vmPFC.nii.gz'};
roi_names={'dmPFC' 'lATL' 'lCaudate' 'lCrblm' 'lTPJ' 'pgACC' 'rATL' 'rCrblm' 'rITG' 'rTPJ' 'rvlPFC' 'sgACC' 'vmPFC'};

% Define paths
sub_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/CombinedRunsAcc/Neurosynth';
roi_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/CombinedRunsAcc/Neurosynth';

% define subject variables
Subs={'sub-REDCAT107' 'sub-REDCAT108' 'sub-REDCAT109' 'sub-REDCAT110' 'sub-REDCAT111' 'sub-REDCAT112' 'sub-REDCAT115' 'sub-REDCAT116' 'sub-REDCAT117' 'sub-REDCAT118' 'sub-REDCAT119' 'sub-REDCAT120' 'sub-REDCAT123' 'sub-REDCAT124' 'sub-REDCAT125' 'sub-REDCAT127' 'sub-REDCAT132' 'sub-REDCAT133' 'sub-REDCAT134' 'sub-REDCAT135' 'sub-REDCAT139' 'sub-REDCAT144' 'sub-REDCAT145' 'sub-REDCAT147' 'sub-REDCAT148' 'sub-REDCAT149' 'sub-REDCAT150' 'sub-REDCAT152' 'sub-REDCAT155' 'sub-REDCAT157' 'sub-REDCAT160' 'sub-REDCAT161' 'sub-REDCAT164' 'sub-REDCAT165' 'sub-REDCAT166' 'sub-REDCAT167' 'sub-REDCAT168' 'sub-REDCAT170' 'sub-REDCAT173' 'sub-REDCAT174' 'sub-REDCAT175' 'sub-REDCAT177' 'sub-REDCAT181' 'sub-REDCAT182' 'sub-REDCAT184' 'sub-REDCAT187' 'sub-REDCAT189' 'sub-REDCAT191' 'sub-REDCAT192' 'sub-REDCMNT123' 'sub-REDCMNT125' 'sub-REDCMNT128' 'sub-REDCMNT129' 'sub-REDCMNT130' 'sub-REDCMNT136' 'sub-REDCMNT137' 'sub-REDCMNT138' 'sub-REDCMNT140' 'sub-REDCMNT142' 'sub-REDCMNT144' 'sub-REDCMNT146' 'sub-REDCMNT147' 'sub-REDCMNT151' 'sub-REDCMNT153' 'sub-REDCMNT154' 'sub-REDCMNT157' 'sub-REDCMNT161' 'sub-REDCMNT162' 'sub-REDCMNT166' 'sub-REDCMNT167' 'sub-REDCMNT168' 'sub-REDCMNT170'};

% INITIALIZE RSA TOOLBOX

userOptions = defineUserOptions();
userOptions.rootPath = roi_path;
userOptions.projectName = 'Neurosynth';
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


for m = 1:length(rois)
    load(strcat(roi_names{1,m},'_72Euc.mat'));
    RoiName=roi_names{1,m};
    userOptions.analysisName = RoiName;
    
    userOptions.figure1filename=strcat(RoiName,'_72EucBar');
    userOptions.figure2filename=strcat(RoiName,'_72CandRefs');
    stats_72=rsa.compareRefRDM2candRDMs(eucRDM, candRDMs, userOptions);
    
    close all
    save(strcat(roi_names{1,m},'_72Euc.mat'),'stats_72','-append')
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all;
cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth');
% Define ROIs
rois={'dmPFC.nii.gz' 'lATL.nii.gz' 'lCaudate.nii.gz' 'lCrblm.nii.gz' 'lTPJ.nii.gz' 'pgACC.nii.gz' 'rATL.nii.gz' 'rCrblm.nii.gz' 'rITG.nii.gz' 'rTPJ.nii.gz' 'rvlPFC.nii.gz' 'sgACC.nii.gz' 'vmPFC.nii.gz'};
roi_names={'dmPFC' 'lATL' 'lCaudate' 'lCrblm' 'lTPJ' 'pgACC' 'rATL' 'rCrblm' 'rITG' 'rTPJ' 'rvlPFC' 'sgACC' 'vmPFC'};

% Define paths
sub_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth';
roi_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth';

% define subject variables
Subs={'sub-REDCAT107' 'sub-REDCAT108' 'sub-REDCAT109' 'sub-REDCAT110' 'sub-REDCAT111' 'sub-REDCAT112' 'sub-REDCAT115' 'sub-REDCAT116' 'sub-REDCAT117' 'sub-REDCAT118' 'sub-REDCAT119' 'sub-REDCAT120' 'sub-REDCAT123' 'sub-REDCAT124' 'sub-REDCAT125' 'sub-REDCAT127' 'sub-REDCAT132' 'sub-REDCAT133' 'sub-REDCAT134' 'sub-REDCAT135' 'sub-REDCAT139' 'sub-REDCAT144' 'sub-REDCAT145' 'sub-REDCAT147' 'sub-REDCAT148' 'sub-REDCAT149' 'sub-REDCAT150' 'sub-REDCAT152' 'sub-REDCAT155' 'sub-REDCAT157' 'sub-REDCAT160' 'sub-REDCAT161' 'sub-REDCAT164' 'sub-REDCAT165' 'sub-REDCAT166' 'sub-REDCAT167' 'sub-REDCAT168' 'sub-REDCAT170' 'sub-REDCAT173' 'sub-REDCAT174' 'sub-REDCAT175' 'sub-REDCAT177' 'sub-REDCAT181' 'sub-REDCAT182' 'sub-REDCAT184' 'sub-REDCAT187' 'sub-REDCAT189' 'sub-REDCAT191' 'sub-REDCAT192' 'sub-REDCMNT123' 'sub-REDCMNT125' 'sub-REDCMNT128' 'sub-REDCMNT129' 'sub-REDCMNT130' 'sub-REDCMNT136' 'sub-REDCMNT137' 'sub-REDCMNT138' 'sub-REDCMNT140' 'sub-REDCMNT142' 'sub-REDCMNT144' 'sub-REDCMNT146' 'sub-REDCMNT147' 'sub-REDCMNT151' 'sub-REDCMNT153' 'sub-REDCMNT154' 'sub-REDCMNT157' 'sub-REDCMNT161' 'sub-REDCMNT162' 'sub-REDCMNT166' 'sub-REDCMNT167' 'sub-REDCMNT168' 'sub-REDCMNT170'};

% INITIALIZE RSA TOOLBOX

userOptions = defineUserOptions();
userOptions.rootPath = roi_path;
userOptions.projectName = 'Neurosynth';
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
userOptions.candRDMdifferencesTest='subjectConditionRFXbootstrap';
userOptions.RDMrelatednessTest = 'subjectConditionRFXbootstrap';
userOptions.nBootstrap=10000;

for m = 9:length(rois)
    load(strcat(roi_names{1,m},'_72Euc.mat'));
    RoiName=roi_names{1,m};
    userOptions.analysisName = RoiName;
    
    userOptions.figure1filename=strcat('Boot10k72EucBar_',RoiName);
    userOptions.figure2filename=strcat('Boot10k72EucBar_',RoiName);
    stats_Boot10k72=rsa.compareRefRDM2candRDMs(eucRDM, candRDMs, userOptions);
    
    close all
    save(strcat(roi_names{1,m},'_72Euc.mat'),'stats_Boot10k72','-append')
end
