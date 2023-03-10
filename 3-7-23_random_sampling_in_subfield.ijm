/* macro to randomly select cells within a given region
* by Charlotte Klimovich - 3-7-23
* at this point you should already have the regions & counts
*---------------------------------------------------------------------------------*/

// region names
	regNST = "nst";
	submeD = "medD";
	submiD = "midD";
	sublaD = "latD";
	submeV = "medV";
	submiV = "midV";
	sublaV = "latV";
regnames = newArray(regNST,submeD,submiD,sublaD,submeV,submiV,sublaV);

// arrays & counters for each type of cell 		    
	type1 = 0;
	array1x = newArray(0);
	array1y = newArray(0);
	type2 = 0;
	array2x = newArray(0);
	array2y = newArray(0);
	type3 = 0;
	array3x = newArray(0);
	array3y = newArray(0);
	type4 = 0;
	array4x = newArray(0);
	array4y = newArray(0);
	type5 = 0;
	array5x = newArray(0);
	array5y = newArray(0);
	type6 = 0;
	array6x = newArray(0);
	array6y = newArray(0);
	type7 = 0;
	array7x = newArray(0);
	array7y = newArray(0);
	type8 = 0;
	array8x = newArray(0);
	array8y = newArray(0);
	type9 = 0;
	array9x = newArray(0);
	array9y = newArray(0);
	type10 = 0;
	array10x = newArray(0);
	array10y = newArray(0);

// asks user which region they wish to evaluate
Dialog.create("Region of Interest");
	Dialog.addRadioButtonGroup("Regions: ",regnames, 7,1,"nst");
	Dialog.show();
reg_choice = Dialog.getRadioButton();
// print(reg_choice);
// print("Region Choice: "+Dialog.getRadioButton);

// find & save index of region
regionID = findRoiWithName(reg_choice);

function findRoiWithName(roiName) {	// function to select a region by name
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

n = getValue("results.count"); // how many points in the results table?

	roiManager("Select",regionID); // searches chosen region for points
	for (r=0; r < n; r++) {
		T = getResult("Type", r);
		x_coord = getResult("X", r);
		y_coord = getResult("Y", r);
		boolean = Roi.contains(x_coord, y_coord);
		if (boolean == 0) { // Boolean 1 = TRUE and 0 = FALSE
		} else {
			if (T==1)	   {
 				type1 = type1 + 1;
 				array1x = Array.concat(array1x, x_coord);
 				array1y = Array.concat(array1y, y_coord);
				} 				
			else if (T==2) {
 				type2 = type2 + 1;
 				array2x = Array.concat(array2x, x_coord);
 				array2y = Array.concat(array2y, y_coord);
			}
			else if (T==3) {
 				type3 = type3 + 1;
 				array3x = Array.concat(array3x, x_coord);
 				array3y = Array.concat(array3y, y_coord);
			}
			else if (T==4) {
 				type4 = type4 + 1;  
 				array4x = Array.concat(array4x, x_coord);
 				array4y = Array.concat(array4y, y_coord);
			}
			else if (T==5) {
 				type5 = type5 + 1; 
 				array5x = Array.concat(array5x, x_coord);
 				array5y = Array.concat(array5y, y_coord);
			}
			else if (T==6) {
 				type6 = type6 + 1; 
 				array6x = Array.concat(array6x, x_coord);
 				array6y = Array.concat(array6y, y_coord);
			}
			else if (T==7) {
 				type7 = type7 + 1; 
 				array7x = Array.concat(array7x, x_coord);
 				array7y = Array.concat(array7y, y_coord);
			}
			else if (T==8) { 
				type8 = type8 + 1; 
 				array8x = Array.concat(array8x, x_coord);
 				array8y = Array.concat(array8y, y_coord);
			}
			else if (T==9) { 
				type9 = type9 + 1;
 				array9x = Array.concat(array9x, x_coord);
 				array9y = Array.concat(array9y, y_coord);
			}
			else if (T==10) { 
				type10 = type10 + 1; 
 				array10x = Array.concat(array10x, x_coord);
 				array10y = Array.concat(array10y, y_coord);
			}
		}
	}  // iterates through points
	
							
// Part Two: random sampling of all types within the region
labelFontSize = 10; 
setFont("SanSerif", labelFontSize, "bold antialiased");
color = newArray("green","red","magenta","green","red","magenta","white","yellow","white","cyan");
symbol = newArray("1","2","3","4","5","6","7","8","9","10");

sample_size1 = type1*0.60;
sample_size2 = type2*0.60;
sample_size3 = type3*0.60;
sample_size4 = type4*0.60;
sample_size5 = type5*0.60;
sample_size6 = type6*0.60;
sample_size7 = type7*0.60;
sample_size8 = type8*0.60;
sample_size9 = type9*0.60;
sample_size10 = type10*0.60;

// checkbox
rows = 10;
columns = 1;
n = rows* columns;
labels = newArray("Type 1","Type 2","Type 3","Type 4","Type 5","Type 6","Type 7","Type 8","Type 9","Type 10");
defaults = newArray(false, false, false, false, false, false, false, false, false, false);
	Dialog.create("Choose which cell types you wish to sample");
	Dialog.addCheckboxGroup(rows, columns, labels, defaults);
	Dialog.show();
responses = newArray(n);
for(i=0; i<n; i++)
	responses[i] = Dialog.getCheckbox(); // 1 = True, 0 = False
// Array.show(responses); // check

// for type 1 cells in the given region
if(responses[0] == true) {
	if (type1 >= sample_size1) {
//		print("total ch1 coordinates: "+type1); // check
		used_1_x = newArray(0);
		used_1_y = newArray(0);
		for (a=0; a < sample_size1; a++) {
			index_1 = type1*random();
			selected_cell_x = array1x[index_1];
			selected_cell_y = array1y[index_1];
			repeat1 = 0;
//			print("index_1: "+index_1); // check
//			print("selected_cell_x: "+selected_cell_x); // check
//			print("selected_cell_y: "+selected_cell_y); // check

			for(z=0; z<a; z++) {
				if (selected_cell_x == used_1_x[z] && selected_cell_y == used_1_y[z]) {
					a--;
					repeat1 = 1;
				}
			}
			if (repeat1 == 0) {
				used_1_x = Array.concat(used_1_x, selected_cell_x);
				used_1_y = Array.concat(used_1_y, selected_cell_y);
				makeText("1", selected_cell_x, selected_cell_y);		
				roiManager("Add",color[0]);
				roi_limit = roiManager("count");
				roiManager("Select", roi_limit - 1); // finds end of roi list
				roiManager("Rename", symbol[0]);	
				}
		}
		roiManager("Show All with labels");
		roiManager("UseNames", "true");
	} else {
		print("There were not enough Type 1 cells found in the region to yield that sample size.");}
} 
// Array.show(used_1_x,used_1_y); // check
if (responses[1] == true) {		
// for type 2 cells in the given region
	if (type2 >= sample_size2) {
//		print("total ch2 coordinates: "+type2); // check
		used_2_x = newArray(0);
		used_2_y = newArray(0);
		for (b=0; b < sample_size2; b++) {
			index_2 = type2*random();
			selected_cell_x = array2x[index_2];
			selected_cell_y = array2y[index_2];
			repeat2 = 0;
//			print("index_2: "+index_2); // check
//			print("selected_cell_x: "+selected_cell_x); // check
//			print("selected_cell_y: "+selected_cell_y); // check
			for(z=0; z<b; z++) {
				if (selected_cell_x == used_2_x[z] && selected_cell_y == used_2_y[z]) {
					b--;					
					repeat2 = 1;
				}
			}
			if (repeat2 == 0) {
				used_2_x = Array.concat(used_2_x, selected_cell_x);
				used_2_y = Array.concat(used_2_y, selected_cell_y);
				makeText("2", selected_cell_x, selected_cell_y);		
				roiManager("Add",color[1]);
				roi_limit = roiManager("count");
				roiManager("Select", roi_limit - 1); // finds end of roi list
				roiManager("Rename", symbol[1]);	
			}
			roiManager("Show All with labels");
			roiManager("UseNames", "true");
		}
	} else {
		print("There were not enough Type 2 cells found in the region to yield that sample size.");}
} 
if (responses[2] == true) {	
// for type 3 cells in the given region
	if (type3 >= sample_size3) {
//		print("total ch3 coordinates: "+type3); // check
		used_3_x = newArray(0);
		used_3_y = newArray(0);
		for (c=0; c < sample_size3; c++) {
			index_3 = type3*random();
			selected_cell_x = array3x[index_3];
			selected_cell_y = array3y[index_3];
			repeat3 = 0;
//			print("index_3: "+index_3); // check
//			print("selected_cell_x: "+selected_cell_x); // check
//			print("selected_cell_y: "+selected_cell_y); // check
			for(z=0; z<c; z++) {
				if (selected_cell_x == used_3_x[z] && selected_cell_y == used_3_y[z]) {
					c--;					
					repeat3 = 1;
				}
			}
			if (repeat3 == 0) {
				used_3_x = Array.concat(used_3_x, selected_cell_x);
				used_3_y = Array.concat(used_3_y, selected_cell_y);
				makeText("3", selected_cell_x, selected_cell_y);		
				roiManager("Add",color[2]);
				roi_limit = roiManager("count");
				roiManager("Select", roi_limit - 1); // finds end of roi list
				roiManager("Rename", symbol[2]);	
			}
		}
		roiManager("Show All with labels");
		roiManager("UseNames", "true");
	} else {
		print("There were not enough Type 3 cells found in the region to yield that sample size.");}
} 
if (responses[3] == true) {		
// for type 4 cells in the given region
	if (type4 >= sample_size4) {
//		print("total ch4 coordinates: "+type4); // check
		used_4_x = newArray(0);
		used_4_y = newArray(0);
		for (d=0; d < sample_size4; d++) {
			index_4 = type4*random();
			selected_cell_x = array4x[index_4];
			selected_cell_y = array4y[index_4];
			repeat4 = 0;
//			print("index_4: "+index_4); // check
//			print("selected_cell_x: "+selected_cell_x); // check
//			print("selected_cell_y: "+selected_cell_y); // check
			for(z=0; z<d; z++) {
				if (selected_cell_x == used_4_x[z] && selected_cell_y == used_4_y[z]) {
					d--;					
					repeat4 = 1;
				}
			}
			if (repeat4 == 0) {
				used_4_x = Array.concat(used_4_x, selected_cell_x);
				used_4_y = Array.concat(used_4_y, selected_cell_y);
				makeText("4", selected_cell_x, selected_cell_y);		
				roiManager("Add",color[3]);
				roi_limit = roiManager("count");
				roiManager("Select", roi_limit - 1); // finds end of roi list
				roiManager("Rename", symbol[3]);
			}	
		}
		roiManager("Show All with labels");
		roiManager("UseNames", "true");
	} else {
		print("There were not enough Type 4 cells found in the region to yield that sample size.");}
} 
if (responses[4] == true) {		
// for type 5 cells in the given region
	if (type5 >= sample_size5) {
//		print("total ch5 coordinates: "+type5); // check
		used_5_x = newArray(0);
		used_5_y = newArray(0);
		for (e=0; e < sample_size5; e++) {
			index_5 = type5*random();
			selected_cell_x = array5x[index_5];
			selected_cell_y = array5y[index_5];
			repeat5 = 0;
//			print("index_5: "+index_5); // check
//			print("selected_cell_x: "+selected_cell_x); // check
//			print("selected_cell_y: "+selected_cell_y); // check
			for(z=0; z<e; z++) {
				if (selected_cell_x == used_5_x[z] && selected_cell_y == used_5_y[z]) {
					e--;					
					repeat5 = 1;
				}
			}
			if (repeat5 == 0) {
				used_5_x = Array.concat(used_5_x, selected_cell_x);
				used_5_y = Array.concat(used_5_y, selected_cell_y);
				makeText("5", selected_cell_x, selected_cell_y);		
				roiManager("Add",color[4]);
				roi_limit = roiManager("count");
				roiManager("Select", roi_limit - 1); // finds end of roi list
				roiManager("Rename", symbol[4]);	
			}
		}
		roiManager("Show All with labels");
		roiManager("UseNames", "true");
	} else {
		print("There were not enough Type 5 cells found in the region to yield that sample size.");}
} 
if (responses[5] == true) {		
// for type 6 cells in the given region
	if (type6 >= sample_size6) {
//		print("total ch6 coordinates: "+type6); // check
		used_6_x = newArray(0);
		used_6_y = newArray(0);
		for (f=0; f < sample_size6; f++) {
			index_6 = type6*random();
			selected_cell_x = array6x[index_6];
			selected_cell_y = array6y[index_6];
			repeat6 = 0;
//			print("index_6: "+index_6); // check
//			print("selected_cell_x: "+selected_cell_x); // check
//			print("selected_cell_y: "+selected_cell_y); // check
			for(z=0; z<f; z++) {
				if (selected_cell_x == used_6_x[z] && selected_cell_y == used_6_y[z]) {
					f--;					
					repeat6 = 1;
				}
			}
			if (repeat6 == 0) {
				used_6_x = Array.concat(used_6_x, selected_cell_x);
				used_6_y = Array.concat(used_6_y, selected_cell_y);
				makeText("6", selected_cell_x, selected_cell_y);		
				roiManager("Add",color[5]);
				roi_limit = roiManager("count");
				roiManager("Select", roi_limit - 1); // finds end of roi list
				roiManager("Rename", symbol[5]);
			}	
		}
		roiManager("Show All with labels");
		roiManager("UseNames", "true");
	} else {
		print("There were not enough Type 6 cells found in the region to yield that sample size.");}
} 
if (responses[6] == true) {		
// for type 7 cells in the given region
	if (type7 >= sample_size7) {
//		print("total ch7 coordinates: "+type7); // check
		used_7_x = newArray(0);
		used_7_y = newArray(0);
		for (g=0; g < sample_size7; g++) {
			index_7 = type7*random();
			selected_cell_x = array7x[index_7];
			selected_cell_y = array7y[index_7];
			repeat7 = 0;
//			print("index_7: "+index_7); // check
//			print("selected_cell_x: "+selected_cell_x); // check
//			print("selected_cell_y: "+selected_cell_y); // check
			for(z=0; z<g; z++) {
				if (selected_cell_x == used_7_x[z] && selected_cell_y == used_7_y[z]) {
					g--;					
					repeat7 = 1;
				}
			}
			if (repeat7 == 0) {
				used_7_x = Array.concat(used_7_x, selected_cell_x);
				used_7_y = Array.concat(used_7_y, selected_cell_y);
				makeText("7", selected_cell_x, selected_cell_y);		
				roiManager("Add",color[6]);
				roi_limit = roiManager("count");
				roiManager("Select", roi_limit - 1); // finds end of roi list
				roiManager("Rename", symbol[6]);
			}	
		}
		roiManager("Show All with labels");
		roiManager("UseNames", "true");
	} else {
		print("There were not enough Type 7 cells found in the region to yield that sample size.");}
} 
if (responses[7] == true) {		
// for type 8 cells in the given region
	if (type8 >= sample_size8) {
//		print("total ch8 coordinates: "+type8); // check
		used_8_x = newArray(0);
		used_8_y = newArray(0);
		for (h=0; h < sample_size8; h++) {
			index_8 = type8*random();
			selected_cell_x = array8x[index_8];
			selected_cell_y = array8y[index_8];
			repeat8 = 0;
//			print("index_8: "+index_8); // check
//			print("selected_cell_x: "+selected_cell_x); // check
//			print("selected_cell_y: "+selected_cell_y); // check
			for(z=0; z<h; z++) {
				if (selected_cell_x == used_8_x[z] && selected_cell_y == used_8_y[z]) {
					h--;					
					repeat8 = 1;
				}
			}
			if (repeat8 == 0) {
				used_8_x = Array.concat(used_8_x, selected_cell_x);
				used_8_y = Array.concat(used_8_y, selected_cell_y);
				makeText("8", selected_cell_x, selected_cell_y);		
				roiManager("Add",color[7]);
				roi_limit = roiManager("count");
				roiManager("Select", roi_limit - 1); // finds end of roi list
				roiManager("Rename", symbol[7]);
			}	
		}
		roiManager("Show All with labels");
		roiManager("UseNames", "true");
	} else {
		print("There were not enough Type 8 cells found in the region to yield that sample size.");}
} 
if (responses[8] == true) {		
// for type 9 cells in the given region
	if (type9 >= sample_size9) {
//		print("total ch9 coordinates: "+type9); // check
		used_9_x = newArray(0);
		used_9_y = newArray(0);
		for (i=0; i < sample_size9; i++) {
			index_9 = type9*random();
			selected_cell_x = array9x[index_9];
			selected_cell_y = array9y[index_9];
			repeat9 = 0;
//			print("index_9: "+index_9); // check
//			print("selected_cell_x: "+selected_cell_x); // check
//			print("selected_cell_y: "+selected_cell_y); // check
			for(z=0; z<i; z++) {
				if (selected_cell_x == used_9_x[z] && selected_cell_y == used_9_y[z]) {
					i--;					
					repeat9 = 1;
				}
			}
			if (repeat9 == 0) {
				used_9_x = Array.concat(used_9_x, selected_cell_x);
				used_9_y = Array.concat(used_9_y, selected_cell_y);
				makeText("9", selected_cell_x, selected_cell_y);		
				roiManager("Add",color[8]);
				roi_limit = roiManager("count");
				roiManager("Select", roi_limit - 1); // finds end of roi list
				roiManager("Rename", symbol[8]);
			}
		}
		roiManager("Show All with labels");
		roiManager("UseNames", "true");
	} else {
		print("There were not enough Type 9 cells found in the region to yield that sample size.");}
} 
if (responses[9] == true) {		
// for type 10 cells in the given region
	if (type10 >= sample_size10) {
//		print("total ch10 coordinates: "+type10); // check
		used_10_x = newArray(0);
		used_10_y = newArray(0);
		for (j=0; j < sample_size10; j++) {
			index_10 = type10*random();
			selected_cell_x = array10x[index_10];
			selected_cell_y = array10y[index_10];
			repeat10 = 0;
//		print("index_10: "+index_10); // check
//		print("selected_cell_x: "+selected_cell_x); // check
//		print("selected_cell_y: "+selected_cell_y); // check
			for(z=0; z<j; z++) {
				if (selected_cell_x == used_10_x[z] && selected_cell_y == used_10_y[z]) {
					j--;					
					repeat10 = 1;
				}
			}
			if (repeat10 == 0) {
				used_10_x = Array.concat(used_10_x, selected_cell_x);
				used_10_y = Array.concat(used_10_y, selected_cell_y);
				makeText("10", selected_cell_x, selected_cell_y);		
				roiManager("Add",color[9]);
				roi_limit = roiManager("count");
				roiManager("Select", roi_limit - 1); // finds end of roi list
				roiManager("Rename", symbol[9]);
			}
		}
		roiManager("Show All with labels");
		roiManager("UseNames", "true");
	} else {
		print("There were not enough Type 10 cells found in the region to yield that sample size.");}
}