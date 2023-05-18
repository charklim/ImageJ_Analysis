/* macro to assign each outlined cell to a subfield
* by Charlotte Klimovich - 3-16-23
* at this point you should already have the regions & counts
* highlight a subset of uncategorized outlines that share a subfield
*---------------------------------------------------------------------------------*/

	submeD = "medD"; // 1
	submiD = "midD"; // 2
	sublaD = "latD"; // 3
	submeV = "medV"; // 4
	submiV = "midV"; // 5
	sublaV = "latV"; // 6

nR = roiManager("Count"); 
for (i=0; i<nR; i++) { 
	roiManager("Select", i); 
	gName = Roi.getProperty("Group"); 
	if (gName == 1) { 
		temp = RoiManager.getName(i);
		roiManager("Rename", temp+":medD");
	} else if (gName == 2) {
		temp = RoiManager.getName(i);
		roiManager("Rename", temp+":midD");	
	} else if (gName == 3) {
		temp = RoiManager.getName(i);
		roiManager("Rename", temp+":latD");	
	} else if (gName == 4) {
		temp = RoiManager.getName(i);
		roiManager("Rename", temp+":medV");
	} else if (gName == 5) {	
		temp = RoiManager.getName(i);
		roiManager("Rename", temp+":midV");
	} else if (gName == 6) {	
		temp = RoiManager.getName(i);
		roiManager("Rename", temp+":latV");	
	}						
}