/* macro to count cells within a given subfield
* by Charlotte Klimovich - 8-30-22
* at this point you should already have the subfields & counts
*---------------------------------------------------------------------------------*/

// prepare results table from Cell Counter ouput
// subfield names
	submeD = "medD";
	submiD = "midD";
	sublaD = "latD";
	submeV = "medV";
	submiV = "midV";
	sublaV = "latV";
subnames = newArray(submeD,submiD,sublaD,submeV,submiV,sublaV);

// find & save indexes of subfields
	IDmeD = findRoiWithName(submeD);
	IDmiD = findRoiWithName(submiD);
	IDlaD = findRoiWithName(sublaD);
	IDmeV = findRoiWithName(submeV);
	IDmiV = findRoiWithName(submiV);
	IDlaV = findRoiWithName(sublaV);
indexes = newArray(IDmeD,IDmiD,IDlaD,IDmeV,IDmiV,IDlaV);

function findRoiWithName(roiName) {	// function to select a subfield by name
	nR = roiManager("Count"); 
	for (i=0; i<nR; i++) { 
		roiManager("Select", i); 
		rName = Roi.getName(); 
		if (matches(rName, roiName)) { return i; } 
	} 
	return -1; 
} 
// arrays & counters for each type of cell
	array1 = newArray(6);
	array2 = newArray(6);
	array3 = newArray(6);
	array4 = newArray(6);
	array5 = newArray(6);
	array6 = newArray(6);
	array7 = newArray(6);    
	type1 = 0;
	type2 = 0;
	type3 = 0;
	type4 = 0;
	type5 = 0;
	type6 = 0;
	type7 = 0;

n = getValue("results.count"); // how many points in the results table?

for (z=0;z < 6;z++) { //iterates through subfields
	subnum = indexes[z]; // creates an array # of subfields big
	roiManager("Select",subnum); // ex: at index 0 is IDmeD, which is 1
	for (r=0; r < n; r++) { 
		T = getResult("Type", r);
		x_coord = getResult("X", r);
		y_coord = getResult("Y", r);
		boolean = Roi.contains(x_coord, y_coord);
		if (boolean == 0) { // Boolean 1 = TRUE and 0 = FALSE
		} else {
			if (T==1)	   { type1 = type1 + 1; } 
			else if (T==2) { type2 = type2 + 1; } 
			else if (T==3) { type3 = type3 + 1; } 
			else if (T==4) { type4 = type4 + 1; } 
			else if (T==5) { type5 = type5 + 1; } 
			else if (T==6) { type6 = type6 + 1; } 
			else if (T==7) { type7 = type7 + 1; }
		}
	} // iterates through points
	array1[z]=type1;
	array2[z]=type2;
	array3[z]=type3;
	array4[z]=type4;
	array5[z]=type5;
	array6[z]=type6;
	array7[z]=type7;

	type1 = 0;
	type2 = 0;
	type3 = 0;
	type4 = 0;
	type5 = 0;
	type6 = 0;
	type7 = 0;
} // iterates through subfields

Array.show(subnames,array1,array2,array3,array4,array5,array6,array7);


/*
//print(subnames[z]);
//print("Type 1: ",type1);
//print("Type 2: ",type2);
//print("Type 3: ",type3);
//print("Type 4: ",type4);
//print("Type 5: ",type5);
//print("Type 6: ",type6);
//print("Type 7: ",type7);

table1 = "Subfield Counts";
Table.create(table1);
IJ.renameResults("Results","Raw Data");
	// populate the results table
	setResult("Subfield",z,subnames[z]);
	setResult("Type 1",z,array1);
	setResult("Type 2",z,type2);
	setResult("Type 3",z,type3);
	setResult("Type 4",z,type4);
	setResult("Type 5",z,type5);
	setResult("Type 6",z,type6);
	setResult("Type 7",z,type7);
	updateResults();
*/