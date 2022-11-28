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
		makePoint(X, Y,"medium white cross");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename","1");
	} else if (T==2){
		makePoint(X, Y,"medium lightGray cross");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "2");
	} else if (T==3){
		makePoint(X, Y,"medium darkGray cross");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "3");
	} else if (T==4){
		makePoint(X, Y,"medium pink hybrid");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "4");
	} else if (T==5) {
		makePoint(X, Y,"medium magenta hybrid");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "5");
	} else if (T==6) {
		makePoint(X, Y,"medium red hybrid");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "6");
	} else if (T==7) {
		makePoint(X, Y,"medium red circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "7");
	} else if (T==8) {
		makePoint(X, Y,"medium orange circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "8");
	} else if (T==9) {
		makePoint(X, Y,"medium yellow circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "9");
	} else if (T==10) {
		makePoint(X, Y,"medium green circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "10");
	} else if (T==11) {
		makePoint(X, Y,"medium blue circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "11");
	} else if (T==12) {
		makePoint(X, Y,"medium cyan circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "12");
	} else if (T==13) {
		makePoint(X, Y,"medium blue circle");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "13");
	
	}
	
roiManager("Show All with labels");
roiManager("UseNames", "true");
}