/* macro to count cells within a given subfield
* by Charlotte Klimovich - 8-30-22
* at this point you should already have the subfields & counts
*---------------------------------------------------------------------------------*/

// prepare results table from Cell Counter ouput
// IJ.duplicate("Results");
// IJ.renameResults(“Results-1”,"R");

// subfield names
submeD = "medD";
submiD = "midD";
sublaD = "latD";
submeV = "medV";
submiV = "midV";
sublaV = "latV";
subnames = newArray(submeD,submiD,sublaD,submeV,submiV,sublaV);

// find indexes of subfields
IDmeD = findRoiWithName(submeD);
IDmiD = findRoiWithName(submiD);
IDlaD = findRoiWithName(sublaD);
IDmeV = findRoiWithName(submeV);
IDmiV = findRoiWithName(submiV);
IDlaV = findRoiWithName(sublaV);
indexes = newArray(IDmeD,IDmiD,IDlaD,IDmeV,IDmiV,IDlaV);
//Array.show(indexes);

function findRoiWithName(roiName) {	// function to select a subfield by name
	nR = roiManager("Count"); 
	for (i=0; i<nR; i++) { 
		roiManager("Select", i); 
		rName = Roi.getName(); 
		if (matches(rName, roiName)) { 
			print("do these names match?:", rName, roiName); // checkpoint
			return i; 
		} 
	} 
	return -1; 
} 

table1 = "Subfield Counts";
Table.create(table1);
IJ.renameResults("Raw Data");



// searches subfield for points using subfield index from function
n = getValue("results.count"); // how many points in the results table?
 print("n: ", n);

for (z=0;z < 6;z++) {
	// counters
		type1 = 0;
		type2 = 0;
		type3 = 0;
		type4 = 0;
		type5 = 0;
		type6 = 0;
		type7 = 0;
	subnum = indexes[z];
	roiManager("Select",subnum); // ex: at index 0 there is IDmeD, which is 1
	for (r=0; r < n; r++) {
		T = getResult("Type", r);
		x_coord = getResult("X", r);
		y_coord = getResult("Y", r);
		boolean = Roi.contains(x_coord, y_coord);
		if (boolean == 0) { // Boolean 1 = TRUE and 0 = FALSE
		} else {
			if (T==1) {
				type1 = type1 + 1; 
			} else if (T==2) {
				type2 = type2 + 1; 
			} else if (T==3) {
				type3 = type3 + 1; 
			} else if (T==4) {
				type4 = type4 + 1; 
			} else if (T==5) {
				type5 = type5 + 1; 
			} else if (T==6) {
				type6 = type6 + 1; 
			} else if (T==7) {
				type7 = type7 + 1; 
			}
		}

	}
	// populate the results table
	setResult("Subfield",z,subnames[z]);
	setResult("Type 1",z,type1);
	setResult("Type 2",z,type2);
	setResult("Type 3",z,type3);
	setResult("Type 4",z,type4);
	setResult("Type 5",z,type5);
	setResult("Type 6",z,type6);
	setResult("Type 7",z,type7);
	updateResults();
}




/*
Table.setColumn(columnName, array); // data for each subfield
//column 1 needs to have the types listed
Table.setColumn(columnName, array);
Table.update -;*/
// Table.set(columnName, rowIndex, value);
// Table.headings(table1,"\\Headings:\tMedD\tMidD\tLatD\tMedV\tMidV\tLatV"); // names of the subfields
// the final array with the count results in it
// types = newArray("Type 1","Type 2","Type 3","Type 4","Type 5","Type 6","Type 7");

// Array.show(rows,medV);
// Array.show("Subfield Counts",rows,medD,midD,latD,medV,midV,latV);





