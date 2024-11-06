import csv

def WriteCSV(fileName,element1,element2,element3):
	with open('Deltas/'+fileName, 'a+', newline='') as csvfile:
		writer = csv.writer(csvfile, delimiter='\t');
		ListaTot=[];
		ListaTot.append([element1,element2,element3]);
		writer.writerows(ListaTot)


		  
		  	
import subprocess
import os
import Verifica
from Deltas import CalculateStats
Rates=[1000,900,800,700,600,500,400,300,200,100,90,80,70,60,50,40,30,20,10];
for Rate in Rates:
	Errore=0;
	#Rate=500-50*i;
	String = "Rate={}".format(Rate)
	os.chdir("../project_1/project_1.sim/sim_1/behav/xsim/")
	process = subprocess.Popen(["./ResetRun.sh", "-reset_run"])
	process.wait();
	process = subprocess.Popen(["./compile.sh"])
	process.wait( )
	process = subprocess.Popen(["./elaborateAutomatic.sh",String])
	process.wait( )
	process = subprocess.Popen(["./simulateAutomatic.sh"])
	process.wait( )
	os.chdir("../../../../../symFiles")

	Errore=Verifica.Verifica();
	os.chdir("Deltas/")
	Media=CalculateStats.CalculateStats();
	os.chdir("..")
	WriteCSV("RendicontoFinale.txt",Rate,Media,Errore);

