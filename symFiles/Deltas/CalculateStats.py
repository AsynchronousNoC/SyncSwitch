import csv
import numpy as np
import statistics

def SavePackets(fileName,List):
	with open(fileName, newline='') as csvfile:
		spamreader = csv.reader(csvfile, delimiter='\t', quotechar='|')
		for row in spamreader:
			if(row!=[]):
				List.append(row);	

def GetColumns(List,col):
	outputList=[];
	for row in List:
		outputList.append(float(row[col]));
	return outputList;

def CalculateStats():
	DeltasList = [[] for i in range(16)]

	PacMin=50;
	PacMax=150;
	Deltasname=["Deltas_X0Y0","Deltas_X1Y0","Deltas_X2Y0","Deltas_X3Y0","Deltas_X0Y1","Deltas_X1Y1","Deltas_X2Y1","Deltas_X3Y1","Deltas_X0Y2","Deltas_X1Y2","Deltas_X2Y2","Deltas_X3Y2","Deltas_X0Y3","Deltas_X1Y3","Deltas_X2Y3","Deltas_X3Y3"]
	names=["Deltas_X0Y0","Deltas_X1Y0","Deltas_X2Y0","Deltas_X3Y0","Deltas_X0Y1","Deltas_X1Y1","Deltas_X2Y1","Deltas_X3Y1","Deltas_X0Y2","Deltas_X1Y2","Deltas_X2Y2","Deltas_X3Y2","Deltas_X0Y3","Deltas_X1Y3","Deltas_X2Y3","Deltas_X3Y3"]

	for i in range(16):
		SavePackets(Deltasname[i],DeltasList[i]);

	HeadLatency = [[] for i in range(16)]
	BodyLatency = [[] for i in range(16)]	
	TailLatency = [[] for i in range(16)]	
	j=0;
	print("loc\t\tmax\t\tmin\t\tAvg\t\tstd");
	for List in DeltasList:
		if(List!=[]):
			HeadLatency[j]=(GetColumns(List,0));
			BodyLatency[j]=(GetColumns(List,1));
			TailLatency[j]=(GetColumns(List,2));
			#for i in range(len(List[0])-1):
				#BodyLatency[j]=BodyLatency[j]+(GetColumns(List,i+1));
		j=j+1;
		
	MediaTotale=[];
	print("\nHead")
	i=0;
	Mass=[]
	Min=[]
	Media=[]
	for List in HeadLatency:
		if(List!=[]):
			print(names[i],end="\t\t")
			print(f"{max(List):.3f}",end="\t\t");
			Mass.append(max(List));
			print(f"{min(List):.3f}",end="\t\t");
			Min.append(min(List));
			if(len(List)==1):
				print(f"{List[0]:.3f}", end = "\t\t");
				Media.append(List[0]);
			else:
				print(f"{np.mean(List[PacMin:PacMax]):.3f}", end = "\t\t");
				Media.append(np.mean(List[PacMin:PacMax]));
				print(f"{statistics.stdev(List):.3f}");
		i=i+1;
	print("Media",end="\t\t\t")
	print(f"{np.mean(Mass):.3f}",end="\t\t");
	print(f"{np.mean(Min):.3f}",end="\t\t");
	print(f"{np.mean(Media):.3f}");
	MediaTotale.append(np.mean(Media))
	print ("\n\nBody");
	Mass=[]
	Min=[]
	Media=[]

	i=0;
	for List in BodyLatency:
		if(List!=[]):
			print(names[i],end="\t\t")
			print(f"{max(List):.3f}",end="\t\t");
			Mass.append(max(List));
			print(f"{min(List):.3f}",end="\t\t");
			Min.append(min(List));
			if(len(List)==1):
				print(f"{List[0]:.3f}", end = "\t\t");
				Media.append(List[0]);
			else:
				print(f"{np.mean(List[PacMin:PacMax]):.3f}", end = "\t\t");
				Media.append(np.mean(List[PacMin:PacMax]));
				print(f"{statistics.stdev(List):.3f}");
		i=i+1;
	print("Media",end="\t\t\t")
	print(f"{np.mean(Mass):.3f}",end="\t\t");
	print(f"{np.mean(Min):.3f}",end="\t\t");
	print(f"{np.mean(Media):.3f}");
	MediaTotale.append(np.mean(Media))
	print ("\n\nTail");
	Mass=[]
	Min=[]
	Media=[]
	i=0;
	for List in TailLatency:
		if(List!=[]):
			print(names[i],end="\t\t")
			print(f"{max(List):.3f}",end="\t\t");
			Mass.append(max(List));
			print(f"{min(List):.3f}",end="\t\t");
			Min.append(min(List));
			if(len(List)==1):
				print(f"{List[0]:.3f}", end = "\t\t");
				Media.append(List[0]);
			else:
				print(f"{np.mean(List):.3f}", end = "\t\t");
				Media.append(np.mean(List[PacMin:PacMax]));
				print(f"{statistics.stdev(List[PacMin:PacMax]):.3f}");		
		i=i+1;
	print("Media",end="\t\t\t")
	print(f"{np.mean(Mass):.3f}",end="\t\t");
	print(f"{np.mean(Min):.3f}",end="\t\t");
	print(f"{np.mean(Media):.3f}");
	MediaTotale.append(np.mean(Media))
	print("\n")
	print(f"{np.mean(MediaTotale):.3f}");
	return np.mean(MediaTotale)


if __name__ == '__main__':
    CalculateStats()
