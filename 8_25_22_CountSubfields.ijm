// macro to count number of cells of each type in a subfield ROI
//inspired by "EG_olfbulb_fos.ijm" and "import_rename_points.ijm"
//8-25-22 ST & CK

numberOfPoints = getValue("results.count");
//print(numberOfPoints); uncomment me to check if I'm working!
for (i = 0; i < numberOfPoints; i++) {
	T = getResult("Type", i);
//	print(T); uncomment me to check if I'm working!
	X = getResult("X", i);
	Y = getResult("Y", i);

	if (T<4){
	makePoint(X, Y,"small black circle");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename",".");
	
	} else if (T==4){
	makePoint(X, Y,"small green circle");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename", "gad65_sin");
	
	} else if (T==5) {
	makePoint(X, Y,"small magenta circle");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename", "vgat_sin");
	
	} else if (T==6) {
		makePoint(X, Y,"small yellow circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "sst_sin");
	
	} else if (T==7) {
		makePoint(X, Y,"medium blue circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "vgat_gad65");
	
	} else if (T==8) {
		makePoint(X, Y,"medium red circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "gad65_sst");
		
	} else if (T==9) {
		makePoint(X, Y,"medium orange circle");
	roiManager("Add");
	roiManager("Select",i);
	roiManager("Rename", "vgat_sst");
	
	} else if (T==10) {
		makePoint(X, Y,"medium grey circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "triple~");
		
	} else if (T==11) {
		makePoint(X, Y,"medium white circle");
	roiManager("Add");
	roiManager("Select",i);
		roiManager("Rename", "???");
		
	}
roiManager("UseNames", "true");
}
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






//ideas for implementation
Table.getColumn(columnName) //Returns the specified column as an array.
Array.filter(array, filter) //Returns an array containing the elements of ‘array’ that contain ‘filter’.
print(b.length); //Prints the number of elements in the array