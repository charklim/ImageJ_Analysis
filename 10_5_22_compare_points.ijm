//macro to compare two sets of points
//in this case EG vs. KS
//this just uses the 1st 3 symbols 
//______________Charlotte Klimovich 10-5-22______________


//open EG's file & read in points (use import)
//then run the following
numberOfPoints = getValue("results.count");
for (i = 0; i < numberOfPoints; i++) {
		T = getResult("Type", i);
		X = getResult("X", i);
		Y = getResult("Y", i);

	if (T==1){
		makePoint(X, Y,"small magenta cross");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename","EG_g65");
	
	} else if (T==2){
		makePoint(X, Y,"small magenta circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "EG_vgat");
	
	} else if (T==3) {
		makePoint(X, Y,"small magenta dot");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "EG_sst");
	
	} else if (T>3) {
		makePoint(X, Y,"small black dot");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "EG");
	}
	roiManager("UseNames", "true");
}
//SELECT ALL to save points to folder from the ROI manager



//read in KS's points 
numberOfPoints = getValue("results.count");
for (i = 0; i < numberOfPoints; i++) {
		T = getResult("Type", i);
		X = getResult("X", i);
		Y = getResult("Y", i);

	if (T==1){
		makePoint(X, Y,"small green cross");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename","KS_g65");
	
	} else if (T==2){
		makePoint(X, Y,"small green circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "KS_vgat");
	
	} else if (T==3) {
		makePoint(X, Y,"small green dot");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "KS_sst");
	
	} else if (T>3) {
		makePoint(X, Y,"small black dot");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "KS");
	}
	roiManager("UseNames", "true");
}
//SELECT ALL TO Save points to folder 
//THEN YOU CAN BRING THEM BOTH INTO THE ROI MANAGER BY OPENING BOTH