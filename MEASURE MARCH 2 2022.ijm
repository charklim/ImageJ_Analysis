//MACRO TO MEASURE USING THE ROI MANAGER
//1ST Outline desired objects & put in ROI manager with appropriate labels
//If necessary adjust measures 
//this macro will set the following standard measures: area,mean grey, feret, shape descriptors
//& then measure the 1st 4 channels on ALL SELECTED RO1'S on the CURRENT SLICE
//so you can't measure objects on 2 different z levels simultaneously you have to go to the appropriate zlevel for each set of ROIs
//when done,transfer to excel or google sheet
 
run("Set Measurements...", "mean area shape feret's stack display redirect=None decimal=1");
Stack.setChannel(1);
roiManager("multi-measure append");
Stack.setChannel(2);
roiManager("multi-measure append");
Stack.setChannel(3);
roiManager("multi-measure append");
Stack.setChannel(4);
roiManager("multi-measure append");
 