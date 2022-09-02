//macro to count cells within a given subfield
//by Charlotte Klimovich - 8-30-22
//at this point you should already have generated the subfields 


// Computes the number of points that reside within the subfield that contains MOG labeling
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


/* 
 * Returns index of first ROI that matches  
 * the given regular expression 
 */ 
function findRoiWithName(roiName) { 
	nR = roiManager("Count"); 
 
	for (i=0; i<nR; i++) { 
		roiManager("Select", i); 
		rName = Roi.getName(); 
		if (matches(rName, roiName)) { 
			return i; 
		} 
	} 
	return -1; 
} 
 
/* 
 * Returns an array of indexes of ROIs that match  
 * the given regular expression 
 */ 
function findRoisWithName(roiName) { 
	nR = roiManager("Count"); 
	roiIdx = newArray(nR); 
	k=0; 
	clippedIdx = newArray(0); 
	 
	for (i=0; i<nR; i++) { 
		roiManager("Select", i); 
		rName = Roi.getName(); 
		if (matches(rName, roiName) ) { 
			roiIdx[k] = i; 
			k++; 
		} 
	} 
	if (k>0) { 
		clippedIdx = Array.trim(roiIdx,k); 
	} 
	 
	return clippedIdx; 
} 


//testing ROI manager functions
// Fills an array with the corresponding X & Y values of each point by successive concatenation

x = newArray();
y = newArray();
getVoxelSize(vx,vy,vz,unit);
for (i=0; i < nResults; i++) {	
	x = Array.concat(x, getResult("X", i)  / vx );
	y = Array.concat(y, getResult("Y", i)  / vx );
}

