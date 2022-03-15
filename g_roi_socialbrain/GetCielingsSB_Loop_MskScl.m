clear all; close all
addpath('/Users/junaid/Desktop/DSCN/CMNT_RSA/code/NEWSLICETIME');

cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl');
Out='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/Graphs';
C1={'CM' 'CNM' 'PM' 'PNM'};
Rois={'PCC'	'PCu'	'aMCC'	'dmPFC'	'frontalpole'	'lAI'	'lCb'	'lFFA'	'lHC'	'lIFG'	'lIPL'	'lMTG'	'lMTV5'	'lNAcc'	'lSMA'	'lTPJ'	'lamygdala'	'lpSTS'	'ltemporalpole'	'pMCC'	'rACC'	'rAI'	'rCb'	'rFFA'	'rHC'	'rIFG'	'rIPL'	'rMTG'	'rMTV5'	'rNAcc'	'rSMA'	'rTPJ'	'ramygdala'	'rpSTS'	'rtemporalpole'	'vmPFC'};

PS=zeros(length(Rois),1);
MLOWS=zeros(length(Rois),1);
SES=zeros(length(Rois),1);



for x = 1:length(Rois)
    load(strcat(Rois{1,x},'_72Euc.mat'), 'euclideans');
    [Upp,Low,Pval,AvgEuc,SE,MeanLow]=GetCieling_newST(euclideans);
    PS(x,1)=Pval;
    MLOWS(x,1)=MeanLow;
    SES(x,1)=SE;
    %disp(strcat(Rois{1,x},'_pval= ',num2str(Pval)));
    if Pval<.05
        disp(Rois{1,x});
    end
end

%cd(Out)
save('RepConn/LeaveOneOutNoiseCieling.mat')

%% Euc Raw
clear all; close all
addpath('/Users/junaid/Desktop/DSCN/CMNT_RSA/code/NEWSLICETIME');

cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl');
Out='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/Graphs';
C1={'CM' 'CNM' 'PM' 'PNM'};
Rois={'PCC'	'PCu'	'aMCC'	'dmPFC'	'frontalpole'	'lAI'	'lCb'	'lFFA'	'lHC'	'lIFG'	'lIPL'	'lMTG'	'lMTV5'	'lNAcc'	'lSMA'	'lTPJ'	'lamygdala'	'lpSTS'	'ltemporalpole'	'pMCC'	'rACC'	'rAI'	'rCb'	'rFFA'	'rHC'	'rIFG'	'rIPL'	'rMTG'	'rMTV5'	'rNAcc'	'rSMA'	'rTPJ'	'ramygdala'	'rpSTS'	'rtemporalpole'	'vmPFC'};

PS=zeros(length(Rois),1);
MLOWS=zeros(length(Rois),1);
SES=zeros(length(Rois),1);

for x = 1:length(Rois)
    load(strcat(Rois{1,x},'_72Euc.mat'), 'EucRaw');
    [Upp,Low,Pval,AvgEuc,SE,MeanLow]=GetCieling_newST(EucRaw);
    PS(x,1)=Pval;
    MLOWS(x,1)=MeanLow;
    SES(x,1)=SE;
    %disp(strcat(Rois{1,x},'_pval= ',num2str(Pval)));
    if Pval<.05
        disp(Rois{1,x});
    end
end


save('RepConn/LeaveOneOutNoiseCieling_EucRaw.mat')

%% Dist
clear all; close all
addpath('/Users/junaid/Desktop/DSCN/CMNT_RSA/code/NEWSLICETIME');

cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl');
Out='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/Graphs';
C1={'CM' 'CNM' 'PM' 'PNM'};
Rois={'PCC'	'PCu'	'aMCC'	'dmPFC'	'frontalpole'	'lAI'	'lCb'	'lFFA'	'lHC'	'lIFG'	'lIPL'	'lMTG'	'lMTV5'	'lNAcc'	'lSMA'	'lTPJ'	'lamygdala'	'lpSTS'	'ltemporalpole'	'pMCC'	'rACC'	'rAI'	'rCb'	'rFFA'	'rHC'	'rIFG'	'rIPL'	'rMTG'	'rMTV5'	'rNAcc'	'rSMA'	'rTPJ'	'ramygdala'	'rpSTS'	'rtemporalpole'	'vmPFC'};

PS=zeros(length(Rois),1);
MLOWS=zeros(length(Rois),1);
SES=zeros(length(Rois),1);



for x = 1:length(Rois)
    load(strcat(Rois{1,x},'_72Euc.mat'), 'distances');
    [Upp,Low,Pval,AvgDis,SE,MeanLow]=GetCieling_newST(distances);
    PS(x,1)=Pval;
    MLOWS(x,1)=MeanLow;
    SES(x,1)=SE;
    %disp(strcat(Rois{1,x},'_pval= ',num2str(Pval)));
    if Pval<.05
        disp(Rois{1,x});
    end
end


save('RepConn/LeaveOneOutNoiseCieling_dist.mat')

%% Making List of Good ROIs -Dist
clear all; close all
cd('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/RepConn')
load('LeaveOneOutNoiseCieling.mat', 'Rois')
ROIs=Rois';
clear Rois
load('LeaveOneOutNoiseCieling.mat', 'PS')
Euc_Pvals=PS;
clear PS
load('LeaveOneOutNoiseCieling_EucRaw.mat', 'PS')
EucRaw_Pvals=PS;
clear PS
load('LeaveOneOutNoiseCieling_dist.mat', 'PS')
Dist_Pvals=PS;
clear PS

Euc_Pthrshd=Euc_Pvals<.05;
EucRaw_Pthrshd=EucRaw_Pvals<.05;
Dist_Pthrshd=Dist_Pvals<.05;

RoiPtable=table(ROIs,Euc_Pthrshd,EucRaw_Pthrshd,Dist_Pthrshd,Euc_Pvals,EucRaw_Pvals,Dist_Pvals);
writetable(RoiPtable,'/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/RepConn/RoiPtable.csv','Delimiter',',');