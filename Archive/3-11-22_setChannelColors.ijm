// Charlotte Klimovich - March 11th, 2022
//a macro allowing the user to input the number of color channels in an image and choose colors for each

run("Make Composite", "display=Color");

Dialog.create("Channels?");
Dialog.addMessage("How many channels are in the image?");
items = newArray("One", "Two", "Three", "Four", "Five");
Dialog.addRadioButtonGroup("Choose one:", items, 5, 1, "One");
Dialog.show();

choice = Dialog.getRadioButton();
print(choice); //checking progress

       if(choice == "One") {
	channelnumber = 1;
} else if (choice == "Two") {
	channelnumber = 2; 
} else if (choice == "Three") {
	channelnumber = 3; 
} else if (choice == "Four") {
	channelnumber = 4; 
} else {
	channelnumber = 5; 
}
 print(channelnumber); //checking progress


for(i=1; i<channelnumber+1; i++) {
	Stack.setChannel(i);
	Dialog.create("Color?");
 	Dialog.addMessage("What color would you like for Channel ", i, "?");
 	colorChoices = newArray("Green","Red","Magenta","Blue","Grays");
 	Dialog.addRadioButtonGroup("Choices: ", colorChoices, 5, 1, "Grays");
 	Dialog.show();
 	color = Dialog.getRadioButton();
 	
 	       if(color == "Green") {
		run("Green");
	} else if (color == "Red") {
		run("Red");
	} else if (color == "Magenta") {
		run("Magenta");
	} else if (color == "Blue") {
		run("Blue");
	} else {
		run("Grays");
	}
	run("Enhance Contrast", "saturated=0.35");
	print(i);
}


Stack.setDisplayMode("color");