//macro to select a certain subset of points
//Charlotte Klimovich 10-3-22
//-----------------------------------------------------------------------------------------

// prepare results table from Cell Counter ouput
waitForUser( "Select the table you want to import\nfrom the Window drop down menu\nthen click OK" );
filepath=getDirectory( "temp" )+"savedtable"+".xls";
saveAs( "Results", filepath);
open(filepath);
updateResults();

//t = wait for user to enter type they want
//reads in as numeric
point_type = 14; //default

Dialog.create("Example Dialog");
 	Dialog.addNumber("Please enter the type to select as an integer:", point_type);
  	Dialog.show();
	point_type = Dialog.getNumber();

//use loop to iterate through points as before
//save x values in one array and y in another
//IF type matches the input while looping
//should go into another loop to:
// add the x,y coordinates to the arrays
	x_array = newArray(0);
	y_array = newArray(0);
	
numberOfPoints = getValue("results.count");
//print(numberOfPoints); //check

for (i = 0; i < numberOfPoints; i++) {
	T = getResult("Type", i);
	X = getResult("X", i);
	Y = getResult("Y", i);
		if (T == point_type) {
	x_array = Array.concat(x_array, X);
	y_array = Array.concat(y_array, Y); }

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
	} else if (T==14) {
		makePoint(X, Y,"small white dot");
		roiManager("Add");
		roiManager("Select",i);
		roiManager("Rename", "uncertain");
	}	
}
roiManager("UseNames", "true");
Array.print(x_array); //check
Array.print(y_array); //check

//rename
makeSelection("point", x_array, y_array);
roiManager("add");
wait(2000);