//USING CSV FORMAT IMPORT XY COORDINATES SORTED BY SYMBOL TYPE INTO RESULTS TABLE- KEEP TRACK OF HOW MANY SYMBOLS PER MARKER
numberOfPoints = getValue("results.count");
for (i = 0; i < 69; i++) {
	X = getResult("X", i);
	Y = getResult("Y", i);
	makePoint(X, Y);
	roiManager("Add");
}


//THEN CAN RENAME to fill in the # of points to rename for a given symbol STARTING AT 0 (SO the < = #) change categories as necessary 
//wait for user input 
for (i = 0; i < 4; i++) {
 roiManager("Select", i);
roiManager("Rename", "sin");
}
for (i = 4; i < 37; i++) {
 roiManager("Select", i);
roiManager("Rename", "vgat");
}
for (i = 37; i < 65; i++) {
 roiManager("Select", i);
roiManager("Rename", "vglut");
}
for (i = 65; i < 67; i++) {
 roiManager("Select", i);
roiManager("Rename", "trgat");
}
for (i = 67; i < 69; i++) {
 roiManager("Select", i);
roiManager("Rename", "trglut");
}
roiManager("UseNames", "true");




//example rewrite of second part
//first part of importing xy coordinates stays the same
numberOfPoints = getValue("results.count");

for (n = 0; n < 318; n++) {
	X = getResult("X", n);
	Y = getResult("Y", n);
	makePoint(X, Y);
	roiManager("Add");
}

a=Table.getColumn("Type");
b=Array.filter(a, "1");
print(b.length);




//retry after learning imagej doesn't support 2d array pff
numberOfPoints = getValue("results.count");
for (i = 0; i < nResults(); i++) {
//	T = getResult("Type", i);
	X = getResult("X", i);
	Y = getResult("Y", i);
	makePoint(X, Y);
	roiManager("Add");

		   if (T==1) {
		roiManager("Select",i);
		roiManager("Rename", "vglut");
	} else if (T==2) {
		roiManager("Select",i);
		roiManager("Rename", "vgat");
	} else if (T==3) {
		roiManager("Select",i);
		roiManager("Rename", "sst");
	} else if (T==4) {
		roiManager("Select",i);	
		roiManager("Rename", "vglut_sin");
	} else if (T==5) {
		roiManager("Select",i);
		roiManager("Rename", "vgat_sin");
	} else if (T==6) {
		roiManager("Select",i);
		roiManager("Rename", "sst_sin");
	} else if (v==7) {
		roiManager("Select",i);
		roiManager("Rename", "vgat_vglut");
	} else if (T==8) {
		roiManager("Select",i);
		roiManager("Rename", "vglut_sst");
	} else if (T==9) {
		roiManager("Select",i);
		roiManager("Rename", "vgat_sst");
	} else if (T==10) {
		roiManager("Select",i);
		roiManager("Rename", "triple~");
	} else if (T==11) {		
		roiManager("Select",i);
		roiManager("Rename", "tr_vgat>");
	} else {
		roiManager("Select",i);
		roiManager("Rename", "tr_vglut>");
	}			
roiManager("UseNames", "true");
}