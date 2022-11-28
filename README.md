##### ImageJ_Analysis - Started March 2022. 

<h1 align="center">Index of ImageJ macros saved to this repository</h1>
		
#### 3-1-22_generate_subfields_from_NST_outline
		1. Generates bounding rectangle around NTS & divides into 6
		2. After user places subfields, sets name & color of each
		3. Counts particles in NST & subfields
		
#### 3-2-22_MEASURE_ROI
	*User must first outline desired objects & add to ROI manager*
		1. Measures area, mean grey, feret, & shape descriptors on 4 channels
		2. Must be on z level of that outline! 
		
#### 3-22-22_original_import_points_as_ROIs_with_names
	*Currently configured for VGAT/Sst/VGlut2 60X counting.*
		1. Changes size, color, & symbol of points based on type
		2. Add points to ROI manager with appropriate labels
		3. Also includes code for making points extra small (for comparison)

#### 9-1-22_count_points_in_subfield
		1. Requires subfields to be generated and the section to be counted. 
		2. Counts the number of points within each given subfield.

#### 10-3-22_display_one_point_type
		1. Takes results table from Cell Counter
		2. Asks user to input the number of one cell type
		3. Displays only cells of that type as numbers on the image

#### 10-4-22_from nikon 10x CORRECT
	*Macro to take photomicrographs from Nikon & process them for counting.*
		1. Sets scale, flips horizontally & converts stack to individual images
		2. Merges images back into composite stack
		3. Sets each channel to appropriate color (currently for FISH images)

#### 10-11-22_generalized_import_points_as_symbols
		1. Takes results table from Cell Counter
		2. Names each point as its type number
		3. Each type of point becomes a differently colored symbol

#### 10-27-22_generalized_import_points_as_numbers
		1. Takes results table from Cell Counter
		2. Each point is converted to a number corresponding to its type
		3. User can change the color by editing the 10th line
		4. Points are able to be saved as ROIs and compared
		
#### 11-7-22_10X_nikon_image_processing_from_folder
		1. All images of interest must be open
		2. Each will be scaled, flipped horizontally, & recolored in turn
		3. It will also break the stack and remerge the channels correctly
		*this last step requires a hardcoding of the first part of the image name*

#### 11-17-21_generate_subfields_take_measurements
		1. Slightly different version (older?) of "3-22_EG_olfbulb_fos"
		2. Requires image to be calibrated & NST outline to be drawn
		3. Includes code to measure area, mean, mode, median of subfields
		
#### dread outlines june 11
		Sets line width and color of ROI landmarks in DREADD photos.
		
#### VARIOUS SCALES
		Sets scale based on a known distance. Includes code for:
		- 10X Panda
		- 10X DS1
		- 20X DS1
		- 20X Confocal
