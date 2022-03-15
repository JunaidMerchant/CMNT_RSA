%function RepConnFun(Dir,RoiNames)


Dir='/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl';
close all;
cd(Dir);
RoiNames={'PCC'	'PCu'	'aMCC'	'dmPFC'	'frontalpole'	'lAI'	'lCb'	'lFFA'	'lHC'	'lIFG'	'lIPL'	'lMTG'	'lMTV5'	'lNAcc'	'lSMA'	'lTPJ'	'lamygdala'	'lpSTS'	'ltemporalpole'	'pMCC'	'rACC'	'rAI'	'rCb'	'rFFA'	'rHC'	'rIFG'	'rIPL'	'rMTG'	'rMTV5'	'rNAcc'	'rSMA'	'rTPJ'	'ramygdala'	'rpSTS'	'rtemporalpole'	'vmPFC'};

% Define ROIs

% Define Conds
Conds={'CM' 'CNM' 'PM' 'PNM'};
CondPairs={'CM_CN' 'CM_PM' 'CM_PN' 'CN_PM' 'CN_PN' 'PM_PN'};
LTriSize=(((length(Conds)^2)-length(Conds))/2);
LTriRois=(((length(RoiNames)^2)-length(RoiNames))/2);

%% ROI AVERAGED MEANS THAT FOR EACH ROI, THE EUCLIDEAN DISTANCES BETWEEN CONDITIONS
% ARE AVERAGED ACROSS SUBJECTS, AND REPRESENTATIONAL CONNECTIVITY BETWEEN 
% ROIS IS CALCULATED USING THE AVERAGED EUCLIDEAN DISTANCES FOR EACH ROI
RoiEucData=cell(length(RoiNames),1);
RoiEucMean=zeros(LTriSize,length(RoiNames));
for r = 1:length(RoiNames)
    load(strcat(RoiNames{1,r},'_72Euc.mat'), 'euclideans');
    %load(strcat(RoiNames{1,r},'_72Euc.mat'), 'euclideans');
    RoiEucData{r,1}=euclideans;
    RoiEucMean(:,r)=mean(euclideans)';
end

% [RoiAvgedR,RoiAvgedP]=corr(RoiEucMean);

RoiEucMeanTble=array2table(RoiEucMean,'VariableNames',RoiNames,'RowNames',CondPairs);
%[RoiAvgedR,RoiAvgedP]=corrplot(RoiEucMeanTble,'testR','on');
[RoiAvgEuc_R,RoiAvgEuc_p]=corr(RoiEucMean);
RoiAvgEuc_Z=atanh(RoiAvgEuc_R);

imagesc(RoiAvgEuc_R); colorbar
set(gca,'XTick',[1:length(RoiNames)]);
set(gca,'YTick',[1:length(RoiNames)]);
set(gca, 'XTickLabel', RoiNames,'XTickLabelRotation',45);
set(gca, 'YTickLabel', RoiNames);
title(['ROI Averaged Representational Connectivity Rs'],'FontSize',16)

for x = 1:length(RoiNames)
    for y = 1:length(RoiNames)
        if x ~= y
            if RoiAvgEuc_p(x,y)<.05
                if RoiAvgEuc_p(x,y)<.001
                    %text(x-.3,y,'p<.001','Color','white','FontSize',5)
                    text(x-.2,y,'***','Color','white','FontSize',11)
                else
                    %text(x-.3,y,strcat('p=',num2str(round(SubAvgedP(x,y),3))),'Color','white','FontSize',3)
                    text(x,y,'*','Color','red','FontSize',9)
                end
            end
        end
    end
end

clear x y
saveas(gcf,'Graphs/ALLROIS_RepresentationalConnectivity_RoiAveraged.png');
close

%% SUBJECT AVERAGED IN THIS CASE MEANS THAT THE REPRESENTATIONAL CONNECTIONS
% BETWEEN ROIS ARE CALCULATED FOR EACH SUBJECT, THEN AVERAGED ACROSS
% SUBJECTS
SubRCs_R=zeros(length(RoiNames),length(RoiNames),size(RoiEucData{1,1},1));
SubRCs_Z=zeros(length(RoiNames),length(RoiNames),size(RoiEucData{1,1},1));
SubRCs_P=zeros(length(RoiNames),length(RoiNames),size(RoiEucData{1,1},1));
for s = 1:size(RoiEucData{1,1},1)
    SubDat=zeros(0);
    for r = 1:length(RoiNames)
        SubDat=[SubDat RoiEucData{r,1}(s,:)'];
    end
    [SubR,SubP]=corr(SubDat);
    SubRCs_R(:,:,s)=SubR;
    SubRCs_P(:,:,s)=SubP;
    SubRCs_Z(:,:,s)=atanh(SubRCs_R(:,:,s));
end
    
SubAvgedR=zeros(length(RoiNames),length(RoiNames));
SubAvgedT=zeros(length(RoiNames),length(RoiNames));
SubAvgedP=zeros(length(RoiNames),length(RoiNames));
SubAvgedH=zeros(length(RoiNames),length(RoiNames));

for x = 1:length(RoiNames)
    for y = 1:length(RoiNames)
        SubAvgedR(x,y)=mean(SubRCs_R(x,y,:));
        [h,p,ci,stats]=ttest(SubRCs_Z(x,y,:));
        SubAvgedT(x,y)=stats.tstat;
        SubAvgedP(x,y)=p;
        SubAvgedH(x,y)=h;
    end
end
    
clear ci h p r s stats x y

% plot the R,T,and P matrices
imagesc(SubAvgedR); colorbar
set(gca,'XTick',[1:length(RoiNames)]);
set(gca,'YTick',[1:length(RoiNames)]);
set(gca, 'XTickLabel', RoiNames,'XTickLabelRotation',45);
set(gca, 'YTickLabel', RoiNames);
title(['Subject Averaged Representational Connectivity Rs'],'FontSize',16)
% for x = 1:length(RoiNames)
%     for y = 1:length(RoiNames)
%         if x ~= y
%             if SubAvgedP(x,y)<.05
%                 FSize=11; FWeight='bold';
%             else
%                 FSize=10; FWeight='normal';
%             end
%             text(x-.3,y-.15,strcat('r=',num2str(SubAvgedR(x,y))),'Color','white','FontSize',FSize,'FontWeight',FWeight);
%             text(x-.3,y,strcat('t(71)=',num2str(SubAvgedT(x,y))),'Color','white','FontSize',FSize,'FontWeight',FWeight);
%             text(x-.3,y+.15,strcat('p=',num2str(SubAvgedP(x,y))),'Color','white','FontSize',FSize,'FontWeight',FWeight);
%         end
%     end
% end
for x = 1:length(RoiNames)
    for y = 1:length(RoiNames)
        if x ~= y
            if SubAvgedP(x,y)<.05
                if SubAvgedP(x,y)<.001
                    %text(x-.3,y,'p<.001','Color','white','FontSize',5)
                    text(x-.2,y,'***','Color','white','FontSize',11)
                else
                    %text(x-.3,y,strcat('p=',num2str(round(SubAvgedP(x,y),3))),'Color','white','FontSize',3)
                    text(x,y,'*','Color','red','FontSize',9)
                end
            end
        end
    end
end

clear x y
saveas(gcf,'Graphs/ALLROIS_RepConn_SubAveraged_Rs.png');
close
save('RepConn/ALLROIS_RepConnEucData.mat')

SP2=SubAvgedP;
SP2(isnan(SP2))=0;
SP2vec=squareform(SP2);
SP2fdr=mafdr(SP2vec);
LTriRois=(((length(RoiNames)^2)-length(RoiNames))/2);
FWEp01=.01/LTriRois;
sum(SP2vec<FWEp01)

SP2fwe=zeros(length(RoiNames),length(RoiNames));
SP2fwe(SP2<FWEp01)=1;
SP2fwe(isnan(SubAvgedP))=2;


imagesc(SP2fwe)
pcolor(SP2fwe)
%colormap(gca,[.6 .6 .6; 1 0 0; 1 1 1])
colormap(gca,[.2 .1 .7; 1 1 0; .5 .5 .5])
set(gca,'XTick',[1:length(RoiNames)]);
set(gca,'YTick',[1:length(RoiNames)]);
set(gca, 'XTickLabel', RoiNames,'XTickLabelRotation',45);
set(gca, 'YTickLabel', RoiNames);
set(gca,'xgrid', 'on', 'ygrid', 'on', 'gridlinestyle', '-', 'xcolor', 'k', 'ycolor', 'k');

NumConnections=sum(SP2fwe);
[Sorted,SortIndx]=sort(NumConnections);
Sorted2=Sorted-2;
imagesc(SP2fwe(SortIndx,SortIndx))
set(gca,'XTick',[1:length(RoiNames)]);
set(gca,'YTick',[1:length(RoiNames)]);
set(gca, 'XTickLabel', RoiNames(1,SortIndx),'XTickLabelRotation',45);
set(gca, 'YTickLabel', RoiNames(1,SortIndx));
title(['Social Brain Representational Connectivity FWE p<.01'],'FontSize',16)
saveas(gcf,'Graphs/ALLROIS_RepConn_FWEp01_SortedByNumConn.png');
close


SubAvgedDis=1-SubAvgedR;
tree=linkage(SubAvgedDis);
D=SubAvgedDis;
D2=pdist(D);
LeafOrder=optimalleaforder(tree,D2);
[H,T,outperm]=dendrogram(linkage(squareform(SubAvgedDis)),36,'labels',RoiNames,'orientation','left','ColorThreshold','default');
%[H,T,outperm]=dendrogram(linkage(squareform(SubAvgedDis)),'reorder',LeafOrder,'labels',RoiNames,'orientation','left','ColorThreshold','default');
[H,T,outperm]=dendrogram(linkage(squareform(SubAvgedDis)),'labels',RoiNames,'orientation','left','ColorThreshold','default');

%% Looking at how related the roi- and sub-averaged correlation matrices are
RoiAvgEuc_RDis=1-RoiAvgEuc_R;
SubAvgEuc_RDis=1-SubAvgedR;
[RoiSubPearson_R,RoiSubPearson_P]=corr(squareform(RoiAvgEuc_RDis)',squareform(SubAvgEuc_RDis)');
[RoiSubSpearman_R,RoiSubSpearman_P]=corr(squareform(RoiAvgEuc_RDis)',squareform(SubAvgEuc_RDis)','type','Spearman');

%% Writing data to csv for further analyses
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

RoiEucMeanTble2=[table(model1cc',model2cc',model3cc') RoiEucMeanTble];
RoiEucMeanTble2.Properties.VariableNames{'Var1'}='Model1';
RoiEucMeanTble2.Properties.VariableNames{'Var2'}='Model2';
RoiEucMeanTble2.Properties.VariableNames{'Var3'}='Model3';

writetable(RoiEucMeanTble2,'/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/RepConn/RoiAvgEuc.csv','Delimiter',',');