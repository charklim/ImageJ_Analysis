// macro to import Nikon 10X pictures from ISH test rxn
// Charlotte Klimovich 11/7/22

// run("Clear Results");
setBatchMode(true);
inputDirectory = getDirectory("choose directory with images");
outputDirectory = getDirectory("choose output directory");
// NOTE: if there are non-image files in this directory, the macro may crash
fileList = getFileList(inputDirectory);
for (i = 0; i < fileList.length; i++)
	{processImage(fileList[i]);}
setBatchMode(false);
// updateResults(); 


setBatchMode(true);
outputDir = getDirectory("choose output directory");
imgArray = newArray(nImages);
for (i=0; i<nImages; i++) {
	selectImage(i+1);
	imgArray[i] = getImageID();
 } //now we have a list of all open images, we can work on it

for (i=0; i< imgArray.length; i++) {
	selectImage(imgArray[i]);
	filename = getTitle();
	print(filename);
	run("Set Scale...", "distance=1 known=1.01 unit=microns");
	run("Flip Horizontally", "stack");
	run("Stack to Images");

run("Merge Channels...", "c1=SGF-5-0001 c2=SGF-5-0002 c3=SGF-5-0003 c4=SGF-5-0004 c5=SGF-5-0005 create");
selectWindow("Composite");
//run("In [+]");
Property.set("CompositeProjection", "null");
	Stack.setDisplayMode("color");
	Stack.setChannel(1);
		setMinAndMax(0, 65535);
		run("Cyan");
	Stack.setChannel(2);
		setMinAndMax(0, 65535);
		run("Green");
	Stack.setChannel(3);
		setMinAndMax(0, 65535);
		run("Red");
	Stack.setChannel(4);
		setMinAndMax(0, 65535);
		run("Magenta");
	Stack.setChannel(5);
		setMinAndMax(0, 65535);
		run("Grays");
		saveAs("tiff", outputDir + filename + "processed");
 } 
setBatchMode(false);


// set measurements and measure on all channels
run("Set Measurements...", "mean modal min display redirect=None decimal=1");
Stack.setChannel(1);
roiManager("multi-measure append");
Stack.setChannel(2);
roiManager("multi-measure append");
Stack.setChannel(3);
roiManager("multi-measure append");
Stack.setChannel(4);
roiManager("multi-measure append");
Stack.setChannel(5);
roiManager("multi-measure append");



function processImage(imageFile){
//	prevNumResults = nResults; 
	open(imageFile);
	filename = getTitle();
// 10x DS1 scaling
	run("Set Scale...", "distance=1 known=1.01 unit=microns");
// set colors appropriately
	Stack.setChannel(1);
		run("Cyan");
	Stack.setChannel(2);
		run("Green");
	Stack.setChannel(3);
		run("Red");
	Stack.setChannel(4);
		run("Magenta");
	Stack.setChannel(5);
		run("Grays");
// B&C to 16-bit (0-65535)
	Stack.setChannel(1);
		setMinAndMax(0, 65535);
	Stack.setChannel(2);
		setMinAndMax(0, 65535);
	Stack.setChannel(3);
		setMinAndMax(0, 65535);
	Stack.setChannel(4);
		setMinAndMax(0, 65535);
	Stack.setChannel(5);
		setMinAndMax(0, 65535);

}
run("Tile");







for (row = prevNumResults; row < nResults; row++)
   	{setResult("Filename", row, filename);}
close("*");  // Closes all images