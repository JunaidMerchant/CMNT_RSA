
# Define subjects
Subs=c('RED_CAT_107','RED_CAT_108','RED_CAT_109','RED_CAT_110','RED_CAT_111','RED_CAT_112','RED_CAT_115','RED_CAT_116','RED_CAT_117','RED_CAT_118','RED_CAT_119','RED_CAT_120','RED_CAT_123','RED_CAT_124','RED_CAT_125','RED_CAT_127','RED_CAT_132','RED_CAT_133','RED_CAT_134','RED_CAT_135','RED_CAT_139','RED_CAT_144','RED_CAT_145','RED_CAT_147','RED_CAT_148','RED_CAT_149','RED_CAT_150','RED_CAT_152','RED_CAT_155','RED_CAT_157','RED_CAT_160','RED_CAT_161','RED_CAT_164','RED_CAT_165','RED_CAT_166','RED_CAT_167','RED_CAT_168','RED_CAT_170','RED_CAT_173','RED_CAT_174','RED_CAT_175','RED_CAT_177','RED_CAT_181','RED_CAT_182','RED_CAT_184','RED_CAT_187','RED_CAT_189','RED_CAT_191','RED_CAT_192','RED_CMNT_123','RED_CMNT_125','RED_CMNT_128','RED_CMNT_129','RED_CMNT_130','RED_CMNT_136','RED_CMNT_137','RED_CMNT_138','RED_CMNT_140','RED_CMNT_142','RED_CMNT_144','RED_CMNT_146','RED_CMNT_147','RED_CMNT_151','RED_CMNT_153','RED_CMNT_154','RED_CMNT_157','RED_CMNT_161','RED_CMNT_162','RED_CMNT_166','RED_CMNT_167','RED_CMNT_168','RED_CMNT_170')

# Define and change into timing file directory
Dir='/Users/junaid/Desktop/DSCN/CMNT_RSA/Bx/TimingFiles'
setwd(Dir)

# Reading stimuli items file
Items = read.csv(file = '/Users/junaid/Desktop/DSCN/CMNT_RSA/Bx/conditions_F1.csv', sep = ',', header = TRUE)
I2 = read.csv(file = '/Users/junaid/Desktop/DSCN/CMNT_RSA/Bx/conditions_F2.csv', sep = ',', header = TRUE)
I3 = read.csv(file = '/Users/junaid/Desktop/DSCN/CMNT_RSA/Bx/conditions_M1.csv', sep = ',', header = TRUE)
I4 = read.csv(file = '/Users/junaid/Desktop/DSCN/CMNT_RSA/Bx/conditions_M2.csv', sep = ',', header = TRUE)

Prompts=subset(Items,select=c(index,prompt))
Prompts$prompt2=I2$prompt
Prompts$prompt3=I3$prompt
Prompts$prompt4=I4$prompt

Prompts$prompt=gsub(",","",Prompts$prompt)
Prompts$prompt2=gsub(",","",Prompts$prompt2)
Prompts$prompt3=gsub(",","",Prompts$prompt3)
Prompts$prompt4=gsub(",","",Prompts$prompt4)

rm(I2,I3,I4)

# Create empty item level matrices for accuracy and RT
ItemAcc= matrix(,nrow=length(Subs),ncol=length(Items[,1]))
ItemRts= matrix(,nrow=length(Subs),ncol=length(Items[,1]))
ItemOmissions= matrix(,nrow=length(Subs),ncol=length(Items[,1]))
ItemAccNoOm= matrix(,nrow=length(Subs),ncol=length(Items[,1]))

# Loop through the subject timing files
# 1 Concatenate time files per sub
# 2 Get (overall mean accuracy, avg RT, med RT, # wrong, # omission) x Run and averaged across
# 3 Get (overall mean accuracy, avg RT, med RT, # wrong, # omission) x Condion x Run and averaged across
# 4 Add item-level accuracy and RT to item level spreadsheet
# 5 Create item-level timing files

# Start subject loop
for (s in Subs){
  # get sub id without underscores, and sub indx
  s2=gsub("_","",s)
  sIndx=grep(s,Subs)
  
  # Get list of csv files
  Files=list.files(paste(Dir,"/",s,sep=""),pattern=paste(s,"_Run",sep=""))
  
  # Read in first file, and add column for run number
  r1=read.csv(file = paste(Dir,"/",s,"/",Files[1],sep=""), sep = ',', header = TRUE)
  rNum=substr(Files[1],nchar(Files[1],type="chars")-4,nchar(Files[1],type="chars")-4)
  r1$Run=matrix(as.numeric(rNum),length(r1[,1]),1)
  
  # Loop through remaining files and add to the data frame
  for (r in 2:length(Files)){
    r2=read.csv(file = paste(Dir,"/",s,"/",Files[r],sep=""), sep = ',', header = TRUE)
    rNum2=substr(Files[r],nchar(Files[r],type="chars")-4,nchar(Files[r],type="chars")-4)
    r2$Run=matrix(as.numeric(rNum2),length(r2[,1]),1)
    r1=rbind(r1,r2)
  }
  rm(r,r2,rNum2,rNum)
  
  # Remove commas from the dataframe so that it can be written to csv
  r1$Prompt=gsub(",","",r1$Prompt)
  
  # Find character name # DONE IN WAY TOO MANY STEPS, NEED TO CLEAN UP!! 
  CompIndx=grepl("Computer",r1$Speaker) & !grepl("'",r1$Prompt)
  CompIndx=grep("TRUE",CompIndx)
  CompIndx=CompIndx[1]
  First=r1$Prompt[CompIndx]
  First=as.data.frame(strsplit(First," "))
  names(First)="V1"
  Name=as.character(First$V1[1])
  rm(CompIndx,First)
  
  # Separate out the subject specific prompts and remove names 
  SubPrompt=r1$Prompt
  SubPrompt=gsub(Name,"",SubPrompt)
  
  # Separate out Accuracy and RT
  RTs=matrix(r1$RT.sec.)
  ACC=r1$ACC
  #### NEED TO WORK MORE ON ACCURACY SCORES BECAUSE THE ACC COLUMN GIVES 0 FOR NO RESPONSE
  
  # Write concatenated df to sheet
  # write.table(r1,paste(Dir,"/",s,"/",s2,"_Combined.csv",sep=""), quote = FALSE, sep = ",", row.names = FALSE, col.names = TRUE)
  
  # Go through the items in the subject df, and enter the acc and RT values to the item-level matrices
  for (i in 1:length(SubPrompt)){
    Col=grep(SubPrompt[i],Prompts)
    Row=grep(SubPrompt[i],Prompts[,Col[1]])
    ItemAcc[sIndx,Row]=ACC[i]
    
    if (r1$RespButton[i] == "N/A"){
      ItemOmissions[sIndx,Row] = 1
    } else {
      ItemRts[sIndx,Row]=RTs[i]
      ItemAccNoOm[sIndx,Row]=ACC[i]
    }
  }

  
  
  
  rm(ACC,Col,Files,Name,Row,RTs)
}
rm(i)

# setwd('/Users/junaid/Desktop/DSCN/CMNT_RSA/Bx')
# 
# write.csv(ItemAcc,"ItemAcc.csv")
# write.csv(ItemRts,"ItemRTs.csv")
# write.csv(ItemOmissions,"ItemOmissions.csv")
# 
# # Create empty matrix, and loop through and get stats on each item
# ItemIndx=1:length(Items[,1]); MeanAccAll=matrix(length(Prompts[,1]),1); 
# MeanRT=matrix(length(Prompts[,1]),1); MedRT=matrix(length(Prompts[,1]),1);
# StdRT=matrix(length(Prompts[,1]),1); Omissions=matrix(length(Prompts[,1]),1);
# MeanAcc_noOmiss=matrix(length(Prompts[,1]),1); Item=Items$prompt;
# 
# for (i in 1:length(Prompts[,1])){
#   MeanAccAll[i]=mean(ItemAcc[,i],na.rm = TRUE);
#   MeanRT[i]=mean(as.numeric(ItemRts[,i]),na.rm = TRUE);
#   MedRT[i]=median(as.numeric(ItemRts[,i]),na.rm = TRUE);
#   StdRT[i]=sd(as.numeric(ItemRts[,i]),na.rm = TRUE);
#   Omissions[i]=sum(ItemOmissions[,i],na.rm = TRUE);
#   MeanAcc_noOmiss[i]=mean(ItemAccNoOm[,i],na.rm = TRUE);
#   
#   
# }


ItemStats=data.frame(ItemIndx,MeanAccAll,MeanRT,MedRT,StdRT,Omissions,MeanAcc_noOmiss,Item)
# write.csv(ItemStats,"ItemStats.csv")
