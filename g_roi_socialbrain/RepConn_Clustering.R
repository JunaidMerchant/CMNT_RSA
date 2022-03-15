library('network')
library('corrr')
library('igraph')
library('corrplot')
library(RColorBrewer)
library('heatmaply')
coul <- brewer.pal(nlevels(as.factor(mtcars$cyl)), "Set2")


####Set stuff up ###########################################################
## change into working directory
setwd("/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/RepConn")

### Read in the data ##
RoiPvals = read.csv('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/RepConn/RoiPtable.csv', header = TRUE)
# RoiAvgedEucRaw <- read.csv("RoiAvgEucRaw.csv", header = TRUE)  # ROI averaged euclidean distances
# names(RoiAvgedEucRaw)=c('Model1','Model2','Model3','PCC','PCu','aMCC','dmPFC','fpole','lAI','lCb','lFFA','lHC','lIFG','lIPL','lMTG','lMTV5','lNAcc','lSMA','lTPJ','lamyg','lpSTS','lATL','pMCC','rACC','rAI','rCb','rFFA','rHC','rIFG','rIPL','rMTG','rMTV5','rNAcc','rSMA','rTPJ','ramyg','rpSTS','rATL','vmPFC')

RoiAvgedEuc <- read.csv("RoiAvgEuc.csv", header = TRUE)  # ROI averaged euclidean distances
names(RoiAvgedEuc)=c('Edges','Model1','Model2','Model3','PCC','PCu','aMCC','dmPFC','fpole','lAI','lCb','lFFA','lHC','lIFG','lIPL','lMTG','lMTV5','lNAcc','lSMA','lTPJ','lamyg','lpSTS','lATL','pMCC','rACC','rAI','rCb','rFFA','rHC','rIFG','rIPL','rMTG','rMTV5','rNAcc','rSMA','rTPJ','ramyg','rpSTS','rATL','vmPFC')

# RoiAvgedDis <- read.csv("RoiAvgDis.csv", header = TRUE)  # ROI averaged euclidean distances
# names(RoiAvgedDis)=c('Edges',Model1','Model2','Model3','PCC','PCu','aMCC','dmPFC','fpole','lAI','lCb','lFFA','lHC','lIFG','lIPL','lMTG','lMTV5','lNAcc','lSMA','lTPJ','lamyg','lpSTS','lATL','pMCC','rACC','rAI','rCb','rFFA','rHC','rIFG','rIPL','rMTG','rMTV5','rNAcc','rSMA','rTPJ','ramyg','rpSTS','rATL','vmPFC')

IndxEuc=RoiPvals$Euc_Pthrshd==1
# IndxEucRaw=RoiPvals$EucRaw_Pthrshd==1
# IndxDis=RoiPvals$Dist_Pthrshd==1

# RoiAvgedEucRaw_Good15=RoiAvgedEucRaw[,-c(1:3)]
# RoiAvgedEucRaw_Good15=RoiAvgedEucRaw_Good15[,IndxEucRaw]

RoiAvgedEuc_Good19=RoiAvgedEuc[,-c(1:4)]
RoiAvgedEuc_Good19=RoiAvgedEuc_Good19[,IndxEuc]

# RoiAvgedDis_Good19=RoiAvgedDis[,-c(1:3)]
# RoiAvgedDis_Good19=RoiAvgedDis_Good19[,IndxDis]
# 

# create correlation matrices
CorMatEuc=cor(RoiAvgedEuc_Good19)
# CorMatEucRaw=cor(RoiAvgedEucRaw_Good15)
# CorMatDis=cor(RoiAvgedDis_Good19)

CorMatEucAll=cor(RoiAvgedEuc[,c(4:39)])
# CorMatEucRawAll=cor(RoiAvgedEucRaw[,c(4:39)])
# CorMatDisAll=cor(RoiAvgedDis[,c(4:39)])



########### create correlation heatmap matrix with dendrogram ##############################
png("/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/Graphs/HeatMapDend.png", width = 5, height = 5, units = 'in', res = 300)

heatmaply(CorMatEuc,grid_gap=1,col = colorRampPalette(c("white", "grey", "red"))(20),hclust_method="ward.D",show_dendrogram =c(FALSE,TRUE),k_col=3)

dev.off()
############ use hclust to cluster the rois #############################################
K=3
CorMat=CorMatEuc
#
Clust <- hclust(dist(CorMat),method="ward.D")
plot(Clust)
groups <- cutree(Clust, k=K)
rect.hclust(Clust, k=K, border="red")
# obtain order of Rois
Order=Clust$order

# get inverse of order
RevOrder=sort(Order,index.return=TRUE)
RevOrder=RevOrder$ix

RoiOrderEuc=names(RoiAvgedEuc_Good19)
RoiOrderEuc=RoiOrderEuc[RevOrder]

# create cluster labels ###############
Clusters=c('Cluster1','Cluster1','Cluster1','Cluster1','Cluster1','Cluster1','Cluster1','Cluster1','Cluster1','Cluster1','Cluster1','Cluster2','Cluster2','Cluster2','Cluster2','Cluster3','Cluster3','Cluster3','Cluster3')
ClustSorted=as.factor(Clusters[RevOrder])


##################### Try some igraph #####################################################################
# Get colors for clusters
my_color <- coul[as.numeric(ClustSorted)]
RoiNet <- graph_from_adjacency_matrix( CorMat, weighted=T, mode="undirected", diag=F)
plot(RoiNet,
     vertex.size=12,
     vertex.color=my_color)


########### CREATE FUNCTION TO TRANSFORM VECTOR TO MATRIX #################################################
Conds=c('CM','CN','PM','PN')
RoiAvged_39vars=read.csv("/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/SB_bswift/Clean3/RepresentationalConnections_ROIavged.csv", header = TRUE)
Connections=data.frame(RoiAvged_39vars$Connection)
rm(RoiAvged_39vars)
Connections$X=c(1,1,1,2,2,3)
Connections$Y=c(2,3,4,3,4,4)
Connections$CondsX=Conds[Connections$X]
Connections$CondsY=Conds[Connections$Y]

vector_to_matrix <- function(Vector){
  Matrix=matrix(0,4,4)
  for (cell in seq(1:6)){
    x=Connections$X[cell]
    y=Connections$Y[cell]
    Matrix[x,y]=Vector[cell]
    Matrix[y,x]=Vector[cell]
  }
  colnames(Matrix)=Conds
  rownames(Matrix)=Conds
  return(Matrix)
}



############ NOW CREATE MATRICES FOR EACH CLUSTER
Clust1=RoiAvgedEuc_Good19[,ClustSorted=='Cluster1']
Clust2=RoiAvgedEuc_Good19[,ClustSorted=='Cluster2']
Clust3=RoiAvgedEuc_Good19[,ClustSorted=='Cluster3']

C1means=double(6)
C2means=double(6)
C3means=double(6)

for (x in seq(1:6)){
  C1means[x]=mean(as.numeric(Clust1[x,]))
  C2means[x]=mean(as.numeric(Clust2[x,]))
  C3means[x]=mean(as.numeric(Clust3[x,]))
}


C1mat=vector_to_matrix(C1means)
C2mat=vector_to_matrix(C2means)
C3mat=vector_to_matrix(C3means)


############################## NOW MAKE IGRAPHS FOR EACH CLUSTER ######################
# Setup colors
colfunc <- colorRampPalette(c("grey50","grey9"))
Greys=colfunc(6)
colrs <- c("cornflowerblue","cadetblue1", "tomato", "gold")

#### CREATE FUNCTION FOR PLOTTING IGRAPHS BASED ON MY ##################################
make_graph <- function(corr_mat){
  Net <- graph_from_adjacency_matrix(corr_mat, weighted=T, mode="undirected", diag=F)
  E(Net)$width=rank(-E(Net)$weight)
  E(Net)$color=Greys[rank(-E(Net)$weight)]
  V(Net)$color=colrs
  plot(Net,layout=layout_on_grid,vertex.size=60)
  return(Net)
}

make_graph2 <- function(corr_mat,ClustStat){
  Net <- graph_from_adjacency_matrix(corr_mat, weighted=T, mode="undirected", diag=F)
  E(Net)$width=rank(E(Net)$weight)
  E(Net)$color=rep("#555555",6)
  #E(Net)$color=Greys[rank(E(Net)$weight)]
  V(Net)$color=colrs
  Sig=as.numeric(ClustStat$StudentP<.05)
  for (x in 1:6){
    if (Sig[x]==1){
      if (ClustStat$MeanZ[x]<0){
        E(Net)$color[x]="green"
      } else { E(Net)$color[x]="red"
        }
    }
  }
  
  plot(Net,layout=layout_on_grid,vertex.size=60)
  return(Net)
}

ClustStat=read.csv('/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/RepConn/ClustStat.csv', header = TRUE)


# C2Net = make_graph(C2mat)
# C1Net = make_graph(C1mat)
# C3Net = make_graph(C3mat)

png("/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/Graphs/Cluster2_DistNetStat.png", width = 5, height = 5, units = 'in', res = 300)
C2Net = make_graph2(C2mat,ClustStat[7:12,])
dev.off()

png("/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/Graphs/Cluster1_DistNetStat.png", width = 5, height = 5, units = 'in', res = 300)
C1Net = make_graph2(C1mat,ClustStat[1:6,])
dev.off()

png("/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/Graphs/Cluster3_DistNetStat.png", width = 5, height = 5, units = 'in', res = 300)
C3Net = make_graph2(C3mat,ClustStat[13:18,])
dev.off()

# C2Net <- graph_from_adjacency_matrix( C2mat, weighted=T, mode="undirected", diag=F)
# E(C2Net)$width=rank(-E(C2Net)$weight)
# E(C2Net)$color=Greys[rank(-E(C2Net)$weight)]
# V(C2Net)$color=colrs
# plot(C2Net, layout=layout_as_star,vertex.size=60)


############ NOW CREATE MATRICES FOR EACH CLUSTER REDO USING NORMED DATA ##########
# Clust1norm=RoiAvged_19norm[,4:19][ClustSorted=='Cluster1']
# Clust2norm=RoiAvged_19norm[,4:19][ClustSorted=='Cluster2']
# Clust3norm=RoiAvged_19norm[,4:19][ClustSorted=='Cluster3']
# 
# C1meansnorm=double(6)
# C2meansnorm=double(6)
# C3meansnorm=double(6)
# 
# for (x in seq(1:6)){
#   C1meansnorm[x]=mean(as.numeric(Clust1norm[x,]))
#   C2meansnorm[x]=mean(as.numeric(Clust2norm[x,]))
#   C3meansnorm[x]=mean(as.numeric(Clust3norm[x,]))
# }
# 
# C1matnorm=vector_to_matrix(C1meansnorm)
# C2matnorm=vector_to_matrix(C2meansnorm)
# C3matnorm=vector_to_matrix(C3meansnorm)
# 
# C2Netnorm = make_graph(C2matnorm)
# C1Netnorm = make_graph(C1matnorm)
# C3Netnorm = make_graph(C3matnorm)



########### NOW MAKE DENDROGRAMS ##################################################
png("/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/Graphs/Cluster1_Dendrogram.png", width = 5, height = 5, units = 'in', res = 300)
plot(hclust(as.dist(C1mat),method="ward.D2"),ylab = "Euclidean Distance",main = "Cluster 1")
dev.off()

png("/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/Graphs/Cluster2_Dendrogram.png", width = 5, height = 5, units = 'in', res = 300)
plot(hclust(as.dist(C2mat),method="ward.D2"),ylab = "Euclidean Distance",main = "Cluster 2")
dev.off()

png("/Users/junaid/Desktop/DSCN/CMNT_RSA/ROIs/newST/SocialBrain/MskScl/Graphs/Cluster3_Dendrogram.png", width = 5, height = 5, units = 'in', res = 300)
plot(hclust(as.dist(C3mat),method="ward.D2"),ylab = "Euclidean Distance",main = "Cluster 3")
dev.off()

plot(hclust(as.dist(C1matnorm),method="ward.D2"),ylab = "Euclidean Distance")
plot(hclust(as.dist(C2matnorm),method="ward.D2"),ylab = "Euclidean Distance")
plot(hclust(as.dist(C3matnorm),method="ward.D2"),ylab = "Euclidean Distance")

## HANG TO 0 ####
plot(hclust(as.dist(C1mat),method="ward.D2"),ylab = "Euclidean Distance",hang=-1)
plot(hclust(as.dist(C2mat),method="ward.D2"),ylab = "Euclidean Distance",hang=-1)
plot(hclust(as.dist(C3mat),method="ward.D2"),ylab = "Euclidean Distance",hang=-1)

plot(hclust(as.dist(C1matnorm),method="ward.D2"),ylab = "Euclidean Distance",hang=-1)
plot(hclust(as.dist(C2matnorm),method="ward.D2"),ylab = "Euclidean Distance",hang=-1)
plot(hclust(as.dist(C3matnorm),method="ward.D2"),ylab = "Euclidean Distance",hang=-1)

########### TRYING SOME STUFF TO MAKE IGRAPH #########
# colrs <- c("cornflowerblue","cadetblue1", "tomato", "gold")
# LATL=vector_to_matrix(RoiAvgedR2$ltemporalpole)
# LATL2=1-LATL
# diag(LATL2)=1
# Net1 <- graph_from_adjacency_matrix(LATL, weighted=T, mode="undirected", diag=F)
# Net2 <- graph_from_adjacency_matrix(LATL2, weighted=T, mode="undirected", diag=F)
# 
# 
# 
# E(Net1)$width=E(Net)$weight*10
# E(Net1)$width=rank(E(Net1)$width)
# 
# V(Net1)$color=colrs
# 
# plot(Net,vertex.size=24)
# plot(Net1, layout=layout_as_star)
# plot(Net1, vertex.size=closeness(Net1, mode="all")*50)
# plot(Net1, layout=layout_as_star,vertex.size=closeness(Net1, mode="all")*50)
