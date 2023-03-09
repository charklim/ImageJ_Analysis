#waitForUser( "Select the table you want to import\nFrom the Window drop down menu\nThen click OK" );
#filepath=getDirectory( "temp" )+"savedtable"+".xls";
#saveAs( "Results", filepath);
#open(filepath);
#updateResults();

from ij import IJ
from ij.plugin.frame import RoiManager
from ij.gui import Roi

# subfield names
subnames = ['medD','midD','latD','medV','midV','latV']

# arrays & counters for each type of cell 		    
type1 = 0
array1x = []
array1y = []
type2 = 0
array2x = []
array2y = []
type3 = 0
array3x = []
array3y = []
type4 = 0
array4x = []
array4y = []
type5 = 0
array5x = []
array5y = []
type6 = 0
array6x = []
array6y = []
type7 = 0
array7x = []
array7y = []
type8 = 0
array8x = []
array8y = []
type9 = 0
array9x = []
array9y = []
type10 = 0
array10x = []
array10y = []

# asks user which subfield they wish to evaluate
sub_choice = "medD"
#= input("Enter your subfield of interest:\n")

# find & save index of subfield
subfieldID = findRoiWithName(sub_choice)

def findRoiWithName(roiName): 	# function to select a subfield by name
	for rName in RoiManager.getInstance():
		if (matches(rName, roiName)):
			return rName
	return


n = getValue("results.count") # how many points in the results table?

	roiManager("Select",subfieldID) # searches chosen subfield for points
	for (r=0; r < n; r++) 
		T = getResult("Type", r)
		x_coord = getResult("X", r)
		y_coord = getResult("Y", r)
		boolean = Roi.contains(x_coord, y_coord)
		if boolean==0 : # Boolean 1 = TRUE and 0 = FALSE
		 else: 
			if T==1 :	   
 				type1 = type1 + 1
 				array1x = Array.concat(array1x, x_coord)
 				array1y = Array.concat(array1y, y_coord)
								
			elif T==2 : 
 				type2 = type2 + 1
 				array2x = Array.concat(array2x, x_coord)
 				array2y = Array.concat(array2y, y_coord)
			
			elif T==3 : 
 				type3 = type3 + 1
 				array3x = Array.concat(array3x, x_coord)
 				array3y = Array.concat(array3y, y_coord)
			
			elif T==4 : 
 				type4 = type4 + 1
 				array4x = Array.concat(array4x, x_coord)
 				array4y = Array.concat(array4y, y_coord)
			
			elif T==5 : 
 				type5 = type5 + 1; 
 				array5x = Array.concat(array5x, x_coord)
 				array5y = Array.concat(array5y, y_coord)
			
			elif T==6 : 
 				type6 = type6 + 1
 				array6x = Array.concat(array6x, x_coord)
 				array6y = Array.concat(array6y, y_coord)
			
			elif T==7 : 
 				type7 = type7 + 1
 				array7x = Array.concat(array7x, x_coord)
 				array7y = Array.concat(array7y, y_coord)
			
			elif T==8 : 
				type8 = type8 + 1
 				array8x = Array.concat(array8x, x_coord)
 				array8y = Array.concat(array8y, y_coord)
			
			elif T==9 :
				type9 = type9 + 1
 				array9x = Array.concat(array9x, x_coord)
 				array9y = Array.concat(array9y, y_coord)
			
			elif T==10 :
				type10 = type10 + 1
 				array10x = Array.concat(array10x, x_coord)
 				array10y = Array.concat(array10y, y_coord)
			
		
	  # iterates through points
				
# Now: random sampling of all types within the subfield
color = newArray(size)
symbol = newArray("1","2","3","4","5","6","7","8","9","10")
labelFontSize = 10
setFont("SanSerif", labelFontSize, "bold antialiased");


for (t=0; t < 10; t++) {
	selected_cell_x = 
		makeText(symbol[i], selected_cell_x - labelFontSize/2, selected_cell_y + labelFontSize/2);		
		roiManager("Add",color[i]);
		roiManager("Select",t);
		roiManager("Rename", symbol[i]);	
}