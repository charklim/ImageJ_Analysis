##### ImageJ_Analysis - Started March 2022. 

<h1 align="center">Index of ImageJ macros saved to this repository</h1>


#### 3-11-22_setChannelColors
		1. Allows the user to input # of channels & choose a color for each.
		2. Enhances contrast & sets saturation to 0.35. 
    
#### 3-20-22_startup_macros
		Demonstrates how to automatically open certain macros at startup. 
		
#### 3-22_EG_olfbulb_fos
		1. Generates bounding rectangle around NTS & divides into 6
		2. After user places subfields, sets name & color of each
		3. Counts particles in NST & subfields
		
#### 3-22-22_import_rename_points 
*Currently configured for VGAT/Sst/VGlut2 60X counting.*
		
		1. Changes size, color, & symbol of points based on type
		2. Add points to ROI manager with appropriate labels
		3. Also includes code for making points extra small (for comparison)
		
#### dread outlines june 11
		Sets line width and color of ROI landmarks in DREADD photos.

#### from nikon 10x july 5 2022
*Macro to take photomicrographs from Nikon & process them for counting.*

		1. Sets scale, flips horizontally & converts stack to individual images
		2. Merges images back into composite stack
		3. Sets each channel to appropriate color (currently for FISH images)
		
#### MEASURE MARCH 2 2022
*User must first outline desired objects & add to ROI manager*

		1. Measures area, mean grey, feret, & shape descriptors on 4 channels
		2. Must be on z level of that outline! 
		
#### subfields and measures NOV 17 21
		1. Slightly different version (older?) of "3-22_EG_olfbulb_fos"
		2. Requires image to be calibrated & NST outline to be drawn
		3. Includes code to measure area, mean, mode, median of subfields
		
#### VARIOUS SCALES
		Sets scale based on a known distance. Includes code for:
		- 10X Panda
		- 10X DS1
		- 20X DS1
		- 20X Confocal
