//for 10X photos with panda where channels turn into a stack
//this is for dapi gfp rfp far red dkf
//the get string is currently inoperative but it doesn't interfere
curdir = getInfo("image.directory");
ititle = getInfo("image.title");
//char = getString("characters til space","x");
//print (char);
print (curdir);
print (ititle);
run("Set Scale...", "distance=1 known=.65 unit=um");
run("Flip Horizontally", "stack");
run("Stack to Images");
//run("Channels Tool...");
//need to replace the filename for each channel until i figure out how to make a wildcard 
//default name uses the characters UNTIL there is a space
run("Merge Channels...", "c1=B6-ISH-6-0001 c2=B6-ISH-6-0002 c3=B6-ISH-6-0003 c4=B6-ISH-6-0004 c5=B6-ISH-6-0005 create");
selectWindow("Composite");
//run("In [+]");
run("In [+]");
//run("In [+]");
//run("In [+]");
//run("In [+]");
//run("In [+]");
Property.set("CompositeProjection", "null");
Stack.setDisplayMode("color");
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
Stack.setChannel(1);
run("Enhance Contrast", "saturated=0.35");
Stack.setChannel(2);
run("Enhance Contrast", "saturated=0.35");
Stack.setChannel(3);
run("Enhance Contrast", "saturated=0.35");
Stack.setChannel(4);
run("Enhance Contrast", "saturated=0.35");
Stack.setChannel(5);
run("Enhance Contrast", "saturated=0.35");
saveAs("tiff", curdir + ititle + "scale_ch");