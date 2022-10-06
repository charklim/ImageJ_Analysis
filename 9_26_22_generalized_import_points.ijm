//9_26_22_generalized_import_points.ijm by Charlotte Klimovich
//this macro aims to generalize and improve import_points
//it can be used on any cell counter file no matter the markers
//there is also a part that allows you to select only certain types
//*******************************************************************

numberOfPoints = getValue("results.count");
for (i = 0; i < numberOfPoints; i++) {
	T = getResult("Type", i);
	X = getResult("X", i);
	Y = getResult("Y", i);
	if (T==1){
		makePoint(X, Y,"small black cross");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename","Type1");
	} else if (T==2){
		makePoint(X, Y,"small lightGray cross");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type2");
	} else if (T==3){
		makePoint(X, Y,"small darkGray cross");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type3");
	} else if (T==4){
		makePoint(X, Y,"small pink hybrid");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type4");
	} else if (T==5) {
		makePoint(X, Y,"small magenta hybrid");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type5");
	} else if (T==6) {
		makePoint(X, Y,"small red hybrid");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type6");
	} else if (T==7) {
		makePoint(X, Y,"small red circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type7");
	} else if (T==8) {
		makePoint(X, Y,"small orange circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type8");
	} else if (T==9) {
		makePoint(X, Y,"small yellow circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type9");
	} else if (T==10) {
		makePoint(X, Y,"small green circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type10");
	} else if (T==11) {
		makePoint(X, Y,"small blue circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type11");
	} else if (T==12) {
		makePoint(X, Y,"small cyan circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type12");
	} else if (T==13) {
		makePoint(X, Y,"small blue circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "Type13");
	} else
		makePoint(X, Y,"small white dot");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "uncertain");
	}
	
roiManager("UseNames", "true");
}