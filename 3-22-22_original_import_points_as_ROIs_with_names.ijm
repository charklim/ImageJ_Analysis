//retry after learning imagej doesn't support 2d array pff
//st edited to change color/symbols & to make initial
//plotting of vglut vgat sst small black symbols 
//to eliminate entirely sort the results file and delete 1 2 3 before running macro
//a second set of commands below makes all symbols smaller useful for comparison

numberOfPoints = getValue("results.count");
//print(numberOfPoints); uncomment me to check if I'm working!
for (i = 0; i < numberOfPoints; i++) {
	T = getResult("Type", i);
//	print(T); uncomment me to check if I'm working!
	X = getResult("X", i);
	Y = getResult("Y", i);

	if (T<4){
	makePoint(X, Y,"small black cross");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename",".");
	
	} else if (T==4){
	makePoint(X, Y,"small green cross");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename", "vglut_sin");
	
	} else if (T==5) {
	makePoint(X, Y,"small magenta cross");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename", "vgat_sin");
	
	} else if (T==6) {
		makePoint(X, Y,"small white cross");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "sst_sin");
	
	} else if (T==7) {
		makePoint(X, Y,"medium magenta circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "vgat_vglut");
	
	} else if (T==8) {
		makePoint(X, Y,"medium green circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "vglut_sst");
		
	} else if (T==9) {
		makePoint(X, Y,"medium magenta circle");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename", "vgat_sst");
	
	} else if (T==10) {
		makePoint(X, Y,"medium blue circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "triple~");
		
	} else if (T==11) {
		makePoint(X, Y,"medium magenta circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "tr_vgat>");
		
	} else if (T==12) {
		makePoint(X, Y,"medium green circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "tr_vglut>");
		
	} else if (T==13) {
		makePoint(X, Y,"medium blue cross");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "???");
	}
roiManager("UseNames", "true");
}


//these commands make all the symbols smaller 

numberOfPoints = getValue("results.count");
//print(numberOfPoints); uncomment me to check if I'm working!
for (i = 0; i < numberOfPoints; i++) {
	T = getResult("Type", i);
//	print(T); uncomment me to check if I'm working!
	X = getResult("X", i);
	Y = getResult("Y", i);

	if (T<4){
	makePoint(X, Y,"tiny black cross");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename",".");
	
	} else if (T==4){
	makePoint(X, Y,"tiny green cross");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename", "vglut_sin");
	
	} else if (T==5) {
	makePoint(X, Y,"tiny magenta cross");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename", "vgat_sin");
	
	} else if (T==6) {
		makePoint(X, Y,"tiny white cross");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "sst_sin");
	
	} else if (T==7) {
		makePoint(X, Y,"small magenta circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "vgat_vglut");
	
	} else if (T==8) {
		makePoint(X, Y,"small green circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "vglut_sst");
		
	} else if (T==9) {
		makePoint(X, Y,"small magenta circle");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename", "vgat_sst");
	
	} else if (T==10) {
		makePoint(X, Y,"small blue circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "triple~");
		
	} else if (T==11) {
		makePoint(X, Y,"small magenta circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "tr_vgat>");
		
	} else if (T==12) {
		makePoint(X, Y,"small green circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "tr_vglut>");
		
	} else if (T==13) {
		makePoint(X, Y,"small blue cross");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "???");
	}
roiManager("UseNames", "true");
}