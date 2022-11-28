//Macro to set scale, channel colors, + orientation of 20X confocal images
//Charlotte Klimovich 11-28-22

run("Set Scale...", "distance=1 known=.621 unit=microns");

Stack.setDisplayMode("color");
	Stack.setChannel(1);
		setMinAndMax(0, 4095);
		run("Cyan");
	Stack.setChannel(2);
		setMinAndMax(0, 4095);
		run("Green");
	Stack.setChannel(3);
		setMinAndMax(0, 4095);
		run("Red");
	Stack.setChannel(4);
		setMinAndMax(0, 4095);
		run("Magenta");
	Stack.setChannel(5);
		setMinAndMax(0, 4095);
		run("Grays");
			
run("Flip Horizontally", "stack");

Property.set("CompositeProjection", "Sum");
Stack.setDisplayMode("composite");
	Stack.setActiveChannels("01110"); //unchecks channels 1&5