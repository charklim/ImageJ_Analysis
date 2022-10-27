//macro to compare two sets of points
//in this case EG vs. KS
//______________Charlotte Klimovich 10-5-22______________


//open A's file & read in points 
//Overlay.remove;
labelFontSize=4; 
setFont("SanSerif", labelFontSize, "bold antialiased");
color="green";
  
numberOfPoints = getValue("results.count");
for (i = 0; i < numberOfPoints; i++) {
		T = getResult("Type", i);
		X = getResult("X", i);
		Y = getResult("Y", i);

	if (T==1){
		makeText("1", X - labelFontSize/2, Y + labelFontSize/2);
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "1");
	} else if (T==2){
		makeText("2", X - labelFontSize/2, Y + labelFontSize/2);
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "2");
	} else if (T==3) {
		makeText("3", X - labelFontSize/2, Y + labelFontSize/2);
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "3");
	} else if (T==4) {
		makeText("4", X - labelFontSize/2, Y + labelFontSize/2);
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "4");
	} else if (T==5) {
		makeText("5", X - labelFontSize/2, Y + labelFontSize/2);
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "5");
	} else if (T==6) {
		makeText("6", X - labelFontSize/2, Y + labelFontSize/2);		
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "6");
	} else if (T==7) {
		makeText("7", X - labelFontSize/2, Y + labelFontSize/2);		
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "7");
	} else if (T==8) {
		makeText("8", X - labelFontSize/2, Y + labelFontSize/2);		
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "8");
	} else if (T==9) {
		makeText("9", X - labelFontSize/2, Y + labelFontSize/2);		
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "9");
	} else if (T==10) {
		makeText("10", X - labelFontSize/2, Y + labelFontSize/2);		
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "10");
	} else if (T==11) {
//		Overlay.drawString
		makeText("11", X - labelFontSize/2, Y + labelFontSize/2);	
		roiManager("Add",color);
		roiManager("Select",i);
		roiManager("Rename", "11");
	}
//	Overlay.drawLabels(false);
//	Overlay.show();
}	


