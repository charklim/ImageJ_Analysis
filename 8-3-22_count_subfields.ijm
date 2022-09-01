//macro to count cells within a given subfield
//by Charlotte Klimovich - 8-30-22

//at this point you should already have generated the subfields 
//MUST have the subfield of interest selected

// Fills an array with the corresponding X & Y values of each point by successive concatenation

x = newArray();
y = newArray();
getVoxelSize(vx,vy,vz,unit);
for (i=0; i < nResults; i++) {	
	x = Array.concat(x, getResult("X", i)  / vx );
	y = Array.concat(y, getResult("Y", i)  / vx );
}

// Computes the number of points that reside within the lesion area that contains MOG labeling
roiManager("Select", 3)
for (i=0; i < nResults; i++) {
	x_coord = (x[i]);
	y_coord = (y[i]);
	boolean = Roi.contains(x_coord, y_coord);
	print("myelinated :" + boolean);
	print("myelinated :" + x_coord);
	print("myelinated :" + y_coord);
	if (boolean == 1) {
		counter_lesionMyelinated = counter_lesionMyelinated + 1;
	}
}
function findRoiWithName(roiName) { 
	nR = roiManager("Count"); for (i=0; i<nR; i++) {
		roiManager("Select", i); rName = Roi.getName(); if (matches(rName, roiName)) {
			return i; } } return -1; 
			}
	
}
// Compute results
print("Total number in lesion: " + counter_lesionTotal);
print("Total number in lesion, myelinated: " + counter_lesionMyelinated);
print("Total number in lesion, demyelinated: " + counter_lesionDemyelinated);
