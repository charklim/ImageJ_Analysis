//macro to select a certain subset of points
//Charlotte Klimovich 10-3-22
//-----------------------------------------------------------------------------------------

// prepare results table from Cell Counter ouput
/*waitForUser( "Select the table you want to import\nfrom the Window drop down menu\nthen click OK" );
filepath=getDirectory( "temp" )+"savedtable"+".xls";
saveAs( "Results", filepath);
open(filepath);
updateResults();*/

point_type = 14; //default
color = "red";
labelFontSize = 10; 
setFont("SanSerif", labelFontSize, "bold antialiased");

Dialog.create("Example Dialog");
 	Dialog.addNumber("Please enter the type to select as an integer:", point_type);
  	Dialog.show();
	point_type = Dialog.getNumber();

//use loop to iterate through points as before
//save x values in one array and y in another
//IF type matches the input while looping
//should go into another loop to:
// add the x,y coordinates to the arrays
	i_array = newArray(0);
	
numberOfPoints = getValue("results.count");
//print(numberOfPoints); //check

for (i = 0; i < numberOfPoints; i++) {
	T = getResult("Type", i);
	X = getResult("X", i);
	Y = getResult("Y", i);
	if (T==1){
		makeText("1", X - labelFontSize/2, Y + labelFontSize/2);
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "1");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}
	} else if (T==2){
		makeText("2", X - labelFontSize/2, Y + labelFontSize/2);
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "2");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}
	} else if (T==3) {
		makeText("3", X - labelFontSize/2, Y + labelFontSize/2);
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "3");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}
	} else if (T==4) {
		makeText("4", X - labelFontSize/2, Y + labelFontSize/2);
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "4");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}
	} else if (T==5) {
		makeText("5", X - labelFontSize/2, Y + labelFontSize/2);
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "5");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}
	} else if (T==6) {
		makeText("6", X - labelFontSize/2, Y + labelFontSize/2);		
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "6");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}
	} else if (T==7) {
		makeText("7", X - labelFontSize/2, Y + labelFontSize/2);		
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "7");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}
	} else if (T==8) {
		makeText("8", X - labelFontSize/2, Y + labelFontSize/2);		
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "8");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}
	} else if (T==9) {
		makeText("9", X - labelFontSize/2, Y + labelFontSize/2);		
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "9");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}
	} else if (T==10) {
		makeText("10", X - labelFontSize/2, Y + labelFontSize/2);		
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "10");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}
	} else if (T==11) {
		makeText("11", X - labelFontSize/2, Y + labelFontSize/2);	
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "11");
		if (T == point_type) {
			i_array = Array.concat(i_array, i);}		
	}

}
roiManager("UseNames", "true");
//Array.print(x_array); //check
//Array.print(y_array); //check

roiManager("Select",i_array);
roiManager("and");
roiManager("draw");
