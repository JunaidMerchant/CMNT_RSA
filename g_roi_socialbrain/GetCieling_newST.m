function [Upp,Low,Pval,AvgEuc,SE,MeanLow]=GetCieling_newST(euclideans)

E2=euclideans;

AvgEuc=mean(E2(:,1:6));

Upp=zeros(length(euclideans(:,1)),1);
Low=zeros(length(euclideans(:,1)),1);
for s=1:length(euclideans(:,1))
    Upp(s,1)=rsa.stat.rankCorr_Kendall_taua(AvgEuc',E2(s,:)');
    Temp=E2; Temp(s,:)=[]; TempM=mean(Temp(:,1:6));
    Low(s,1)=rsa.stat.rankCorr_Kendall_taua(TempM',E2(s,:)');
end

Pval=signrank(Low,0,'tail','right');

SE=std(Low)/sqrt(length(Low));
MeanLow=mean(Low);