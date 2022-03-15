# read in subjects list, and create alternate list that uses original sub IDs
Subs=read.table('/Users/junaid/Desktop/DSCN/CMNT_RSA/subList.txt')
Subs2=Subs
Subs2$V1=gsub('sub-','',Subs2$V1)
Subs2$V1=gsub('RED','RED_',Subs2$V1)
Subs2$V1=gsub('T','T_',Subs2$V1)

# Read in run exclusions sheet
Exclusions=read.csv('/Users/junaid/Desktop/DSCN/CMNT_RSA/SubsXRunsExclusions.csv')
Exclusions=Exclusions[1:72,]
Exclusions$RunsExcluded=as.character(Exclusions$RunsExcluded)

# Define conditions
Conds=c('CM','CNM','PM','PNM')
Conds2=c('CompMental','CompNM','PeerMental','PeerNM')

# define the directories of use
InDir='/Users/junaid/Desktop/DSCN/CMNT_RSA/completed_timing_files/'
ByOut='/Users/junaid/Desktop/DSCN/CMNT_RSA/new_timing_files/by_runs/'

##########################################################################################
# Function that does necessary steps to input file
writeTimeFiles = function(infile, outdir) {
  # read in data
  Data = read.csv(infile)
  
  # if button press time is n/a (ommission), change to 8
  Data$ButtonPressTime=as.character(Data$ButtonPressTime)
  Data$ButtonPressTime[Data$ButtonPressTime=="N/A"]=8
  
  # Define conditions
  Conds=c('CM','CNM','PM','PNM')
  Conds2=c('CompMental','CompNM','PeerMental','PeerNM')
  
  # loop through conditions
  for (c in 1:4) {
    # create index for correct trials of condition
    Tmp = Data[Data$MentalState == Conds2[c], ]
    
    # Create timing variable
    Times = paste(Tmp$CumulativeTrialStart,':',Tmp$ButtonPressTime,sep = "")
    
    # Write times to file
    write(Times, paste(outdir, Conds[c], '_run-0', r, '.txt', sep = ""), ncolumns=length(Times))
    
  }
  
  # Create feedback timing files
  FTimes=Data$CumulativeTrialStart + Data$FeedbackOnset
  write(FTimes,paste(outdir,  'FeedBack_run-0', r, '.txt', sep = ""), ncolumns=length(FTimes))
  
  
}
##########################################################################################

# Loop through subs
for (s in 1:length(Subs$V1)){
  
  # make subject directory if it doesn't exist
  if ( !dir.exists(paste(ByOut,Subs$V1[s],sep=""))){
    dir.create(paste(ByOut,Subs$V1[s],sep=""))
  }
  
  # define output directory
  OutDir=paste(ByOut,Subs$V1[s],'/',sep="")
  
  # Define run numbers
  Runs=seq(1,4)
  
  # if 3 runs, remove bad run from list
  if (Exclusions$NumRuns[s] == 3){
    Runs=Runs[-as.integer(Exclusions$RunsExcluded[s])]
  } 
  
  # if 2 runs, remove both bad runs from list
  if (Exclusions$NumRuns[s] == 2){
    tmp=unlist(strsplit(Exclusions$RunsExcluded[s]," "))
    Runs=Runs[-as.integer(tmp[2])]
    Runs=Runs[-as.integer(tmp[1])]
  }
  
  print(paste(Subs$V1[s],"- doing runs:",sep=" "))
  print(Runs)
  print("----")
  
  # Loop through runs
  for (r in Runs){
    
    # check to see if file exists, if so run write time files function
    if (file.exists(paste(InDir,Subs2$V1[s],'/',Subs2$V1[s],'_Run',r,'.csv',sep=""))){
      writeTimeFiles(paste(InDir,Subs2$V1[s],'/',Subs2$V1[s],'_Run',r,'.csv',sep=""),OutDir)
    }
    
    
  }
  
}
