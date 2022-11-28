//PROGRAM LOGIC get bounding rectangle; make a line to calculate angle; rotate rec to be parallel
//scale by .3333X and .5y; rotate back to original angle;
//replicate 6X for the 6 subfields and place using the 
//strategy of putting each rectangle relative to the coor for
//the adjacent one
//then make the subfields themselves by "adding" the NST outline 
//to each of the recs, rename and clean up the ROI manager

//INSTRUCTIONS:delete all ROIs except NST; select NST run part I -- highlight and run

 ///PART 1
roiManager("Select", 0);
//fit rectangle to draw the bounding box, it's gonna be roi 1
run("Fit Rectangle");
roiManager("Add");
roiManager("Select", 1);
getSelectionCoordinates(x, y);

//make a parallel line, will be ROI2
//setTool("line");
makeLine(x[0],y[0],x[1],y[1]); 
roiManager("Add");
roiManager("Select",2);
run("Set Measurements...", "shape redirect=None decimal=3");
roiManager("Measure");
A= getValue("Angle");
B= -A

//make a new rectangle to rotate and scale & rotate back will be RO13
roiManager("Select",1);
run("Rotate...", "angle=A");
run("Scale... ", "x=0.333 y=0.50");
run("Rotate...", "angle=B");
roiManager("Add");
roiManager("Add");
roiManager("Add");
roiManager("Add");
roiManager("Add");
roiManager("Add");

//PLACE SUBFIELDS MANUALLY
//pick from top of stack of squares (BOTTOM OF LIST) 
//and place in order medV midV latV medD midD latD (roi#=9,8,7,6,5,4)

//PART 2
//now make and name the subfields themselves

//medD
roiManager("Select", newArray(0,5));
roiManager("AND");
roiManager("Add");
roiManager("select",9)
roiManager("Rename", "medD");
roiManager("Set Color", "red");

//midD
roiManager("Select", newArray(0,4));
roiManager("AND");
roiManager("Add");
roiManager("select",10)
roiManager("Rename", "midD");
roiManager("Set Color", "blue");

//latD
roiManager("Select", newArray(0,3));
roiManager("AND");
roiManager("Add");
roiManager("select",11)
roiManager("Rename", "latD");
roiManager("Set Color", "white");

//medV
roiManager("Select", newArray(0,8));
roiManager("AND");
roiManager("Add");
roiManager("select",12)
roiManager("Rename", "medV");
roiManager("Set Color", "white");

//midV
roiManager("Select", newArray(0,7));
roiManager("AND");
roiManager("Add");
roiManager("select",13)
roiManager("Rename", "midV");
roiManager("Set Color", "red");

//latV
roiManager("Select", newArray(0,6));
roiManager("AND");
roiManager("Add");
roiManager("select",14)
roiManager("Rename", "latV");
roiManager("Set Color", "blue");

//delete unwanted outlines 
roiManager("Select", newArray(1,2,3,4,5,6,7,8));
roiManager("Delete");
selectWindow("ROI Manager");
roiManager("Deselect");

//SAVE NEW ROIS FOR LATER USE WITH "SF" AFTER THE NAME


//PART III
//select the file window; make sure no ROI's are selected at this point (DESELECT)
//convert to 8 bit for easy thresholding then threshold
run("8-bit");
run("Threshold...");
setThreshold(0, 175);
run("Convert to Mask");
//count particles in nst and the subfields results will be in results window
run("Set Measurements...", "area display redirect=None decimal=3");
roiManager("Select", 0);
run("Analyze Particles...", "  show=Nothing clear summarize");
roiManager("Select", 1);
run("Analyze Particles...", "  show=Nothing clear summarize");
roiManager("Select", 2);
run("Analyze Particles...", "  show=Nothing clear summarize");
roiManager("Select", 3);
run("Analyze Particles...", "  show=Nothing clear summarize");
roiManager("Select", 4);
run("Analyze Particles...", "  show=Nothing clear summarize");
roiManager("Select", 5);
run("Analyze Particles...", "  show=Nothing clear summarize");
roiManager("Select", 6);
run("Analyze Particles...", "  show=Nothing clear summarize");

//COPY THE RESULTS (RESULT WINDOW) INTO THE SPREADSHEET