import csv

def SavePackets(fileName,List):
	with open(fileName, newline='') as csvfile:
		spamreader = csv.reader(csvfile, delimiter='\t', quotechar='|')
		for row in spamreader:
			List.append(row);	
			
def WriteCSV(fileName,List):
	with open('Deltas/'+fileName, 'w+', newline='') as csvfile:
		  spamwriter = csv.writer(csvfile, delimiter='\t',
		                          quotechar='|', quoting=csv.QUOTE_MINIMAL)
		  for row in List:
		  	spamwriter.writerow(row)
		  	
def RxPacketVerification(packet,List,VerificationList, TimesList, packetTimes,Deltaslist,SentNumberPacket):
	k=0;
	i=0;
	for packetRx in List:
	    i=1
	    for h in range(len(packetRx)):
	        if(len(packetRx) != len(packet)):
	            i=0;
	            break;
	        if(h==0): 
	            continue;
	        elif(packet[h]==packetRx[h]):
	            continue;
	        i=0;
	    if(i==1) :
	        VerificationList[k]=1;
	        for j in range(len(packetTimes)):
		        Deltaslist[SentNumberPacket].append(float(TimesList[k][j])-float(packetTimes[j]));
	        break;
	    k=k+1;
	return i;
	
def PacketVerification(List,name,TimesList,DeltasList,ReceiverList,ReceiverListRX,ReceiverList_times):
	global Errore
	j=0;
	Errori=0;
	for packetSender in List:
		packetTimes=TimesList[j];
		j=j+1
		for i in range(16):
			Valid=RxPacketVerification(packetSender,ReceiverList[i],ReceiverListRX[i],ReceiverList_times[i],packetTimes,DeltasList,j-1)
			if(Valid): break
		if(Valid): continue;
		Errore="Errore"
		print("error",end="\t");
		print(name,end="\t");
		print(j-1,end="\t");
		print(packetSender)
		Errori=Errori+1;
	return Errori

def PrintErrorsRx(List,name, ListOfRx):
	global Errore
	k=0;
	for packet in List:
		if (ListOfRx[k]==0):
			Errore="Errore"
			print(packet,end="\t")
			print(name,end="\t")
			print(k)
		k=k+1

def Verifica():		
	Errore="Tutto Bene"		
	directions=["Switch_X0Y0","Switch_X1Y0","Switch_X2Y0","Switch_X3Y0","Switch_X0Y1","Switch_X1Y1","Switch_X2Y1","Switch_X3Y1","Switch_X0Y2","Switch_X1Y2","Switch_X2Y2","Switch_X3Y2","Switch_X0Y3","Switch_X1Y3","Switch_X2Y3","Switch_X3Y3"]
	SenderList = [[] for i in range(16)]
	SenderNames=["Sender_X0Y0","Sender_X1Y0","Sender_X2Y0","Sender_X3Y0","Sender_X0Y1","Sender_X1Y1","Sender_X2Y1","Sender_X3Y1","Sender_X0Y2","Sender_X1Y2","Sender_X2Y2","Sender_X3Y2","Sender_X0Y3","Sender_X1Y3","Sender_X2Y3","Sender_X3Y3"]
	Deltas=[[] for i in range(16)]

	ReceiverList = [[] for i in range(16)]
	ReceiverListRX = [[] for i in range(16)]
	ReceiverNames=["Receiver_X0Y0","Receiver_X1Y0","Receiver_X2Y0","Receiver_X3Y0","Receiver_X0Y1","Receiver_X1Y1","Receiver_X2Y1","Receiver_X3Y1","Receiver_X0Y2","Receiver_X1Y2","Receiver_X2Y2","Receiver_X3Y2","Receiver_X0Y3","Receiver_X1Y3","Receiver_X2Y3","Receiver_X3Y3"]

	SenderList_times = [[] for i in range(16)]
	SenderNames_times=["Sender_X0Y0_times","Sender_X1Y0_times","Sender_X2Y0_times","Sender_X3Y0_times","Sender_X0Y1_times","Sender_X1Y1_times","Sender_X2Y1_times","Sender_X3Y1_times","Sender_X0Y2_times","Sender_X1Y2_times","Sender_X2Y2_times","Sender_X3Y2_times","Sender_X0Y3_times","Sender_X1Y3_times","Sender_X2Y3_times","Sender_X3Y3_times"]
	ReceiverList_times = [[] for i in range(16)]
	ReceiverNames_times=["Receiver_X0Y0_times","Receiver_X1Y0_times","Receiver_X2Y0_times","Receiver_X3Y0_times","Receiver_X0Y1_times","Receiver_X1Y1_times","Receiver_X2Y1_times","Receiver_X3Y1_times","Receiver_X0Y2_times","Receiver_X1Y2_times","Receiver_X2Y2_times","Receiver_X3Y2_times","Receiver_X0Y3_times","Receiver_X1Y3_times","Receiver_X2Y3_times","Receiver_X3Y3_times"]

	Errori=0;
	for i in range(16):
		SavePackets(SenderNames[i],SenderList[i]);
		SavePackets(SenderNames_times[i],SenderList_times[i]);
		Deltas[i]= [[] for i in range(len(SenderList[i]))]; 
		
		SavePackets(ReceiverNames[i],ReceiverList[i]);
		SavePackets(ReceiverNames_times[i],ReceiverList_times[i]);
		ReceiverListRX[i] = [0] * len(ReceiverList[i]); 

	for i in range(16):
		Errori=Errori+PacketVerification(SenderList[i],directions[i],SenderList_times[i],Deltas[i],ReceiverList,ReceiverListRX,ReceiverList_times);
		

	print("")
	print("")
	Deltasname=["Deltas_X0Y0","Deltas_X1Y0","Deltas_X2Y0","Deltas_X3Y0","Deltas_X0Y1","Deltas_X1Y1","Deltas_X2Y1","Deltas_X3Y1","Deltas_X0Y2","Deltas_X1Y2","Deltas_X2Y2","Deltas_X3Y2","Deltas_X0Y3","Deltas_X1Y3","Deltas_X2Y3","Deltas_X3Y3"]
	for i in range(16):
		PrintErrorsRx(ReceiverList[i],directions[i],ReceiverListRX[i]);
		WriteCSV(Deltasname[i],Deltas[i]);
	print(Errore)
	return Errori;

if __name__ == '__main__':
    Verifica()

