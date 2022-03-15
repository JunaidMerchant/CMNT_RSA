clear all; close all;
addpath('/Users/junaid/Desktop/DSCN/CMNT_RSA/code/NEWSLICETIME');
cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/MskScl');
rois={'dmPFC.nii.gz' 'lATL.nii.gz' 'lCaudate.nii.gz' 'lCrblm.nii.gz' 'lTPJ.nii.gz' 'pgACC.nii.gz' 'rATL.nii.gz' 'rCrblm.nii.gz' 'rITG.nii.gz' 'rTPJ.nii.gz' 'rvlPFC.nii.gz' 'sgACC.nii.gz' 'vmPFC.nii.gz'};
roi_names={'dmPFC' 'lATL' 'lCaudate' 'lCrblm' 'lTPJ' 'pgACC' 'rATL' 'rCrblm' 'rITG' 'rTPJ' 'rvlPFC' 'sgACC' 'vmPFC'};

% Define paths
sub_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/MskScl';
roi_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/MskScl';


Mats=dir('*Euc.mat');

Models={'M1_taus','M2_taus','M3_taus'};

Subs={'sub-REDCAT107' 'sub-REDCAT108' 'sub-REDCAT109' 'sub-REDCAT110' 'sub-REDCAT111' 'sub-REDCAT112' 'sub-REDCAT115' 'sub-REDCAT116' 'sub-REDCAT117' 'sub-REDCAT118' 'sub-REDCAT119' 'sub-REDCAT120' 'sub-REDCAT123' 'sub-REDCAT124' 'sub-REDCAT125' 'sub-REDCAT127' 'sub-REDCAT132' 'sub-REDCAT133' 'sub-REDCAT134' 'sub-REDCAT135' 'sub-REDCAT139' 'sub-REDCAT144' 'sub-REDCAT145' 'sub-REDCAT147' 'sub-REDCAT148' 'sub-REDCAT149' 'sub-REDCAT150' 'sub-REDCAT152' 'sub-REDCAT155' 'sub-REDCAT157' 'sub-REDCAT160' 'sub-REDCAT161' 'sub-REDCAT164' 'sub-REDCAT165' 'sub-REDCAT166' 'sub-REDCAT167' 'sub-REDCAT168' 'sub-REDCAT170' 'sub-REDCAT173' 'sub-REDCAT174' 'sub-REDCAT175' 'sub-REDCAT177' 'sub-REDCAT181' 'sub-REDCAT182' 'sub-REDCAT184' 'sub-REDCAT187' 'sub-REDCAT189' 'sub-REDCAT191' 'sub-REDCAT192' 'sub-REDCMNT123' 'sub-REDCMNT125' 'sub-REDCMNT128' 'sub-REDCMNT129' 'sub-REDCMNT130' 'sub-REDCMNT136' 'sub-REDCMNT137' 'sub-REDCMNT138' 'sub-REDCMNT140' 'sub-REDCMNT142' 'sub-REDCMNT144' 'sub-REDCMNT146' 'sub-REDCMNT147' 'sub-REDCMNT151' 'sub-REDCMNT153' 'sub-REDCMNT154' 'sub-REDCMNT157' 'sub-REDCMNT161' 'sub-REDCMNT162' 'sub-REDCMNT166' 'sub-REDCMNT167' 'sub-REDCMNT168' 'sub-REDCMNT170'};

Age=[12.6300000000000,11.4700000000000,13.5200000000000,12.9500000000000,11.1700000000000,12.0400000000000,10.1300000000000,12.3300000000000,11.9100000000000,11.2100000000000,14.2100000000000,11.4900000000000,10.4200000000000,12.1400000000000,10.4400000000000,10.2400000000000,10.3100000000000,10.3600000000000,9.42000000000000,8.41000000000000,9.98000000000000,9.87000000000000,9.78000000000000,9.55000000000000,9.50000000000000,8.24000000000000,8.89000000000000,9.98000000000000,11.4200000000000,11.5100000000000,8.64000000000000,8.70000000000000,9.64000000000000,8,8.39000000000000,8,9.32000000000000,13.0600000000000,12.6600000000000,12.3800000000000,14.3300000000000,14.4500000000000,13.2400000000000,14.6300000000000,12.1600000000000,13.5900000000000,12.1200000000000,13,13,10.8400000000000,11.2000000000000,9.07000000000000,8.79000000000000,11.0200000000000,10.4400000000000,12.9700000000000,10.5200000000000,9.14000000000000,8.76000000000000,8.96000000000000,9.87000000000000,8.18000000000000,9.42000000000000,9.07000000000000,9.95000000000000,10.7500000000000,9.30000000000000,11.5000000000000,12.7800000000000,8.55000000000000,9.20000000000000,12.6100000000000]';

Gender = {'F' 'M' 'F' 'F' 'M' 'M' 'M' 'M' 'M' 'F' 'M' 'F' 'F' 'M' 'M' 'M' 'M' 'M' 'M' 'M' 'F' 'F' 'M' 'M' 'M' 'F' 'M' 'M' 'F' 'M' 'F' 'F' 'F' 'M' 'F' 'M' 'F' 'M' 'M' 'M' 'M' 'M' 'M' 'F' 'M' 'M' 'M' 'M' 'M' 'M' 'F' 'F' 'F' 'M' 'M' 'M' 'F' 'F' 'M' 'M' 'F' 'F' 'F' 'F' 'F' 'F' 'M' 'F' 'M' 'M' 'M' 'M'};

ConjDat=struct('Subj',char(),'ROI',char(),'Tau',[],'TauToZ',[],'Age',[],'Gender',{});

Runs=[4 2 3 4 4 2 4 3 4 3 4 2 4 3 4 3 4 4 4 4 2 4 4 4 4 3 3 3 4 4 4 4 4 3 3 3 3 4 4 4 4 3 4 4 4 4 4 3 2 4 4 4 4 3 4 4 4 4 4 4 4 4 4 3 4 4 3 4 4 4 4 3];

Run3indx=Runs>2;
Run4indx=Runs>3;

count=1;
% Loop through the .mat files for each ROI
for m = 1:length(Mats)
    
    % Loop through different models
    for t = 1:length(Models)
        
        % create variable name of current model to load from .mat file
        CurMod=strcat('M',num2str(t),'_taus');
        
        % load model fit data 
        load(Mats(m).name,CurMod)
        
        % Use eval function to assign to Taus
        Taus=eval(CurMod);
        
        % Loop through subjects
        for s = 1:length(Subs)
            % get subject id, roi name, tau, and z
            ConjDat(count).Subj=Subs{1,s};
            ConjDat(count).ROI=strcat(roi_names{1,m},'_M',num2str(t));
            ConjDat(count).Tau=Taus(s);
            ConjDat(count).TauToZ=tau2z(Taus(s));
            ConjDat(count).Age=Age(s);
            ConjDat(count).Gender=Gender{s};
            count=count+1;
        end
        
        % Clear variables 
        clear *_taus Taus CurMod
        
    end
end

ConjDatTable=struct2table(ConjDat);

Runs=[4 2 3 4 4 2 4 3 4 3 4 2 4 3 4 3 4 4 4 4 2 4 4 4 4 3 3 3 4 4 4 4 4 3 3 3 3 4 4 4 4 3 4 4 4 4 4 3 2 4 4 4 4 3 4 4 4 4 4 4 4 4 4 3 4 4 3 4 4 4 4 3];

Run3indx=Runs>2;
Run4indx=Runs>3;

Run3indx2808=repmat(Run3indx',39,1);
Run4indx2808=repmat(Run4indx',39,1);
Subs_3Good=Subs(Run3indx)';
Subs_4Good=Subs(Run4indx)';

ConjDatTable_3Good=ConjDatTable(Run3indx2808,:);
ConjDatTable_4Good=ConjDatTable(Run4indx2808,:);


writetable(ConjDatTable_3Good,'Bayes/AllModels_Tau_Z_Age_3GoodRuns.txt','Delimiter','\t');
writetable(ConjDatTable_4Good,'Bayes/AllModels_Tau_Z_Age_4GoodRuns.txt','Delimiter','\t');


%% Do some graphing

clear ConjDat* *indx2808 count
SubFigLetter={'A)' 'B)' 'C)' 'D)' 'E)' 'F)' 'G)' 'H)' 'I)' 'J)' 'K)' 'L)' 'M)'};
Models={'Model1' 'Model2' 'Model3'};
Groups={'3Runs67' '4Runs49' 'All72'};
for m = 1:length(Mats)
    load(Mats(m).name,'M1_taus','M2_taus','M3_taus');
    RoiName=roi_names{1,m};
    
    Means=[mean(M1_taus(Run3indx',1)) mean(M1_taus(Run4indx',1)) mean(M1_taus(:,1));
        mean(M2_taus(Run3indx',1)) mean(M2_taus(Run4indx',1)) mean(M2_taus(:,1));
        mean(M3_taus(Run3indx',1)) mean(M3_taus(Run4indx',1)) mean(M3_taus(:,1))];
    
    Errors=[(std(M1_taus(Run3indx',1))/sqrt(67)) (std(M1_taus(Run4indx',1))/sqrt(49)) (std(M1_taus(:,1))/sqrt(72));
        (std(M2_taus(Run3indx',1))/sqrt(67)) (std(M2_taus(Run4indx',1))/sqrt(49)) (std(M2_taus(:,1))/sqrt(72));
        (std(M3_taus(Run3indx',1))/sqrt(67)) (std(M3_taus(Run4indx',1))/sqrt(49)) (std(M3_taus(:,1))/sqrt(72))];
    
    Ps=[signrank(M1_taus(Run3indx',1),0,'tail','right','method','exact') signrank(M1_taus(Run4indx',1),0,'tail','right','method','exact') signrank(M1_taus,0,'tail','right','method','exact');
        signrank(M2_taus(Run3indx',1),0,'tail','right','method','exact') signrank(M2_taus(Run4indx',1),0,'tail','right','method','exact') signrank(M2_taus,0,'tail','right','method','exact');
        signrank(M3_taus(Run3indx',1),0,'tail','right','method','exact') signrank(M3_taus(Run4indx',1),0,'tail','right','method','exact') signrank(M3_taus,0,'tail','right','method','exact')];
    
     b=bar(Means,'grouped');
    b(1).FaceColor='red'; b(2).FaceColor='blue'; b(3).FaceColor=[.6 .6 .6];
    hold on
    % Find the number of groups and the number of bars in each group
    ngroups = size(Means, 1);
    nbars = size(Means, 2);
    % Calculate the width for each bar group
    groupwidth = min(0.8, nbars/(nbars + 1.5));
    for i = 1:nbars
        % Calculate center of each bar
        x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
        errorbar(x, Means(:,i), Errors(:,i), 'k', 'linestyle', 'none');
        text(x-.09,[-.01 -.01 -.01],num2str(round(Ps(:,i),3)),'FontSize',10,'FontWeight','bold');
    end
    text(0.52,-.01,'p = ','FontSize',10,'FontWeight','bold')
    set(gca, 'XTickLabel', {'Model 1' 'Model 2' 'Model 3'});
    legend('3 Good Runs N=67','4 Good Runs N=49','All N=72');
    xlabel( 'Conceptual Models' ,'FontSize',11,'FontWeight','bold')
    ylabel( 'Model Fit (Kendalls Tau)' ,'FontSize',11,'FontWeight','bold')
    
    title([SubFigLetter{m},' Model Fits to ',RoiName],'FontSize',12)
    
    saveas(gcf,strcat('Graphs/',RoiName,'_BarxGoodRunGroups.png'));
    close all
    
    
end



%% Redo for Combined Runs Accuracy

clear all; close all;
addpath('/Users/junaid/Desktop/DSCN/CMNT_RSA/code/NEWSLICETIME');
cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/CombinedRunsAcc');
rois={'dmPFC.nii.gz' 'lATL.nii.gz' 'lCaudate.nii.gz' 'lCrblm.nii.gz' 'lTPJ.nii.gz' 'pgACC.nii.gz' 'rATL.nii.gz' 'rCrblm.nii.gz' 'rITG.nii.gz' 'rTPJ.nii.gz' 'rvlPFC.nii.gz' 'sgACC.nii.gz' 'vmPFC.nii.gz'};
roi_names={'dmPFC' 'lATL' 'lCaudate' 'lCrblm' 'lTPJ' 'pgACC' 'rATL' 'rCrblm' 'rITG' 'rTPJ' 'rvlPFC' 'sgACC' 'vmPFC'};

% Define paths
sub_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/CombinedRunsAcc';
roi_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/CombinedRunsAcc';


Mats=dir('*Euc.mat');

Models={'M1_taus','M2_taus','M3_taus'};

Subs={'sub-REDCAT107' 'sub-REDCAT108' 'sub-REDCAT109' 'sub-REDCAT110' 'sub-REDCAT111' 'sub-REDCAT112' 'sub-REDCAT115' 'sub-REDCAT116' 'sub-REDCAT117' 'sub-REDCAT118' 'sub-REDCAT119' 'sub-REDCAT120' 'sub-REDCAT123' 'sub-REDCAT124' 'sub-REDCAT125' 'sub-REDCAT127' 'sub-REDCAT132' 'sub-REDCAT133' 'sub-REDCAT134' 'sub-REDCAT135' 'sub-REDCAT139' 'sub-REDCAT144' 'sub-REDCAT145' 'sub-REDCAT147' 'sub-REDCAT148' 'sub-REDCAT149' 'sub-REDCAT150' 'sub-REDCAT152' 'sub-REDCAT155' 'sub-REDCAT157' 'sub-REDCAT160' 'sub-REDCAT161' 'sub-REDCAT164' 'sub-REDCAT165' 'sub-REDCAT166' 'sub-REDCAT167' 'sub-REDCAT168' 'sub-REDCAT170' 'sub-REDCAT173' 'sub-REDCAT174' 'sub-REDCAT175' 'sub-REDCAT177' 'sub-REDCAT181' 'sub-REDCAT182' 'sub-REDCAT184' 'sub-REDCAT187' 'sub-REDCAT189' 'sub-REDCAT191' 'sub-REDCAT192' 'sub-REDCMNT123' 'sub-REDCMNT125' 'sub-REDCMNT128' 'sub-REDCMNT129' 'sub-REDCMNT130' 'sub-REDCMNT136' 'sub-REDCMNT137' 'sub-REDCMNT138' 'sub-REDCMNT140' 'sub-REDCMNT142' 'sub-REDCMNT144' 'sub-REDCMNT146' 'sub-REDCMNT147' 'sub-REDCMNT151' 'sub-REDCMNT153' 'sub-REDCMNT154' 'sub-REDCMNT157' 'sub-REDCMNT161' 'sub-REDCMNT162' 'sub-REDCMNT166' 'sub-REDCMNT167' 'sub-REDCMNT168' 'sub-REDCMNT170'};

Age=[12.6300000000000,11.4700000000000,13.5200000000000,12.9500000000000,11.1700000000000,12.0400000000000,10.1300000000000,12.3300000000000,11.9100000000000,11.2100000000000,14.2100000000000,11.4900000000000,10.4200000000000,12.1400000000000,10.4400000000000,10.2400000000000,10.3100000000000,10.3600000000000,9.42000000000000,8.41000000000000,9.98000000000000,9.87000000000000,9.78000000000000,9.55000000000000,9.50000000000000,8.24000000000000,8.89000000000000,9.98000000000000,11.4200000000000,11.5100000000000,8.64000000000000,8.70000000000000,9.64000000000000,8,8.39000000000000,8,9.32000000000000,13.0600000000000,12.6600000000000,12.3800000000000,14.3300000000000,14.4500000000000,13.2400000000000,14.6300000000000,12.1600000000000,13.5900000000000,12.1200000000000,13,13,10.8400000000000,11.2000000000000,9.07000000000000,8.79000000000000,11.0200000000000,10.4400000000000,12.9700000000000,10.5200000000000,9.14000000000000,8.76000000000000,8.96000000000000,9.87000000000000,8.18000000000000,9.42000000000000,9.07000000000000,9.95000000000000,10.7500000000000,9.30000000000000,11.5000000000000,12.7800000000000,8.55000000000000,9.20000000000000,12.6100000000000]';


ConjDat=struct('Subj',char(),'ROI',char(),'Tau',[],'TauToZ',[],'Age',[]);


count=1;
% Loop through the .mat files for each ROI
for m = 1:length(Mats)
    
    % Loop through different models
    for t = 1:length(Models)
        
        % create variable name of current model to load from .mat file
        CurMod=strcat('M',num2str(t),'_taus');
        
        % load model fit data 
        load(Mats(m).name,CurMod)
        
        % Use eval function to assign to Taus
        Taus=eval(CurMod);
        
        % Loop through subjects
        for s = 1:length(Subs)
            % get subject id, roi name, tau, and z
            ConjDat(count).Subj=Subs{1,s};
            ConjDat(count).ROI=strcat(roi_names{1,m},'_M',num2str(t));
            ConjDat(count).Tau=Taus(s);
            ConjDat(count).TauToZ=tau2z(Taus(s));
            ConjDat(count).Age=Age(s);
            count=count+1;
        end
        
        % Clear variables 
        clear *_taus Taus CurMod
        
    end
end

ConjDatTable=struct2table(ConjDat);

M1indx=contains(table2cell(ConjDatTable(:,2)),'_M1');
M2indx=contains(table2cell(ConjDatTable(:,2)),'_M2');
M3indx=contains(table2cell(ConjDatTable(:,2)),'_M3');

M1table=ConjDatTable(M1indx,:);
M2table=ConjDatTable(M2indx,:);
M3table=ConjDatTable(M3indx,:);

M1table.ROI=strrep(M1table.ROI,'_M1','');
M2table.ROI=strrep(M2table.ROI,'_M2','');
M3table.ROI=strrep(M3table.ROI,'_M3','');

writetable(ConjDatTable,'Bayes/AllModels_Tau_Z_Age.txt','Delimiter','\t');
writetable(M1table,'Bayes/Model1_Tau_Z_Age.txt','Delimiter','\t');
writetable(M2table,'Bayes/Model2_Tau_Z_Age.txt','Delimiter','\t');
writetable(M3table,'Bayes/Model3_Tau_Z_Age.txt','Delimiter','\t');

writetable(M1table(:,[1,2,4]),'Bayes/Model1_Z.txt','Delimiter','\t');
writetable(M1table(:,[1,2,4,5]),'Bayes/Model1_Z_Age.txt','Delimiter','\t');
writetable(M1table(:,[1,2,3,5]),'Bayes/Model1_Tau_Age.txt','Delimiter','\t');
writetable(M1table(:,[1,2,3]),'Bayes/Model1_Tau.txt','Delimiter','\t');

writetable(M2table(:,[1,2,4]),'Bayes/Model2_Z.txt','Delimiter','\t');
writetable(M2table(:,[1,2,4,5]),'Bayes/Model2_Z_Age.txt','Delimiter','\t');
writetable(M2table(:,[1,2,3,5]),'Bayes/Model2_Tau_Age.txt','Delimiter','\t');
writetable(M2table(:,[1,2,3]),'Bayes/Model2_Tau.txt','Delimiter','\t');

writetable(M3table(:,[1,2,4]),'Bayes/Model3_Z.txt','Delimiter','\t');
writetable(M3table(:,[1,2,4,5]),'Bayes/Model3_Z_Age.txt','Delimiter','\t');
writetable(M3table(:,[1,2,3,5]),'Bayes/Model3_Tau_Age.txt','Delimiter','\t');
writetable(M3table(:,[1,2,3]),'Bayes/Model3_Tau.txt','Delimiter','\t');
   
%% Combine MskScl with other data for analyses
clear all; close all;
addpath('/Users/junaid/Desktop/DSCN/CMNT_RSA/code/NEWSLICETIME');
cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/MskScl');
rois={'dmPFC.nii.gz' 'lATL.nii.gz' 'lCaudate.nii.gz' 'lCrblm.nii.gz' 'lTPJ.nii.gz' 'pgACC.nii.gz' 'rATL.nii.gz' 'rCrblm.nii.gz' 'rITG.nii.gz' 'rTPJ.nii.gz' 'rvlPFC.nii.gz' 'sgACC.nii.gz' 'vmPFC.nii.gz'};
roi_names={'dmPFC' 'lATL' 'lCaudate' 'lCrblm' 'lTPJ' 'pgACC' 'rATL' 'rCrblm' 'rITG' 'rTPJ' 'rvlPFC' 'sgACC' 'vmPFC'};

% Define paths
sub_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/MskScl';
roi_path='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/Neurosynth/MskScl';


Mats=dir('*Euc.mat');

Models={'M1','M2','M3'};

Subs={'sub-REDCAT107' 'sub-REDCAT108' 'sub-REDCAT109' 'sub-REDCAT110' 'sub-REDCAT111' 'sub-REDCAT112' 'sub-REDCAT115' 'sub-REDCAT116' 'sub-REDCAT117' 'sub-REDCAT118' 'sub-REDCAT119' 'sub-REDCAT120' 'sub-REDCAT123' 'sub-REDCAT124' 'sub-REDCAT125' 'sub-REDCAT127' 'sub-REDCAT132' 'sub-REDCAT133' 'sub-REDCAT134' 'sub-REDCAT135' 'sub-REDCAT139' 'sub-REDCAT144' 'sub-REDCAT145' 'sub-REDCAT147' 'sub-REDCAT148' 'sub-REDCAT149' 'sub-REDCAT150' 'sub-REDCAT152' 'sub-REDCAT155' 'sub-REDCAT157' 'sub-REDCAT160' 'sub-REDCAT161' 'sub-REDCAT164' 'sub-REDCAT165' 'sub-REDCAT166' 'sub-REDCAT167' 'sub-REDCAT168' 'sub-REDCAT170' 'sub-REDCAT173' 'sub-REDCAT174' 'sub-REDCAT175' 'sub-REDCAT177' 'sub-REDCAT181' 'sub-REDCAT182' 'sub-REDCAT184' 'sub-REDCAT187' 'sub-REDCAT189' 'sub-REDCAT191' 'sub-REDCAT192' 'sub-REDCMNT123' 'sub-REDCMNT125' 'sub-REDCMNT128' 'sub-REDCMNT129' 'sub-REDCMNT130' 'sub-REDCMNT136' 'sub-REDCMNT137' 'sub-REDCMNT138' 'sub-REDCMNT140' 'sub-REDCMNT142' 'sub-REDCMNT144' 'sub-REDCMNT146' 'sub-REDCMNT147' 'sub-REDCMNT151' 'sub-REDCMNT153' 'sub-REDCMNT154' 'sub-REDCMNT157' 'sub-REDCMNT161' 'sub-REDCMNT162' 'sub-REDCMNT166' 'sub-REDCMNT167' 'sub-REDCMNT168' 'sub-REDCMNT170'};
CondPairs={'CM_CN' 'CM_PM' 'CM_PN' 'CN_PM' 'CN_PN' 'PM_PN'};

RoiDat=zeros(length(Subs),((length(rois)*length(Models))+(length(rois)*length(CondPairs))));
RoiModelFit=zeros(length(Subs),(length(rois)*length(Models)));
RoiEucs=zeros(length(Subs),(length(rois)*length(CondPairs)));
RoiEucRaws=zeros(length(Subs),(length(rois)*length(CondPairs)));

Headers=cell(1,length(RoiDat(1,:)));
RoiModHead=cell(1,length(RoiModelFit(1,:)));
RoiCondPairHead=cell(1,length(RoiEucs(1,:)));

count=1;
for r = 1:length(rois)
    for m = 1:length(Models)
        Headers(1,count)=strcat(Models(1,m),'_',roi_names(1,r));
        count=count+1;
    end
    
    for c = 1:length(CondPairs)
        Headers(1,count)=strcat(CondPairs(1,c),'_',roi_names(1,r));
        count=count+1;
    end
end
clear c r m

RoiStartNum=1:9:length(RoiDat(1,:));

for m = 1:length(Mats)
    load(Mats(m).name,'M1_taus','M2_taus','M3_taus','euclideans');
    RoiDat(:,RoiStartNum(1,m):RoiStartNum(1,m)+8)=[M1_taus, M2_taus, ...
        M3_taus, euclideans];
end


RoiDat=array2table(RoiDat,'VariableNames',Headers);

BxDemog=readtable('/Users/junaid/Desktop/DSCN/CMNT_RSA/Bx/SubBxDemMotionAll.csv');

AllTable=[BxDemog,RoiDat];

writetable(AllTable,'Age/BxDemRoiDat.csv','Delimiter',',');