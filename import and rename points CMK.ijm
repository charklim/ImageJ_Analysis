//retry after learning imagej doesn't support 2d array pff
numberOfPoints = getValue("results.count");
//print(numberOfPoints); uncomment me to check if I'm working!
for (i = 0; i < numberOfPoints; i++) {
	T = getResult("Type", i);
//	print(T); uncomment me to check if I'm working!
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
	} else if (T==7) {
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