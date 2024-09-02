The Matlab file figures2points.m takes an image and converts it into a counterclockwise oriented polygon 

	figure2points(imagefilename,outputfilename,cutoff)
	
	-imagefilename is the image file with the filled in shape 
	-outputfilename is the name of the data files you want to create
	-cutoff is the cutoff value for distinguishing the shape from the background. By default it is set to zero. 
	
Sample Usage: 

figure2points('duck.png','duck',0); 

Note: Do not include the suffix on the output file! 

This does three things: 

1. It shows a picture of the polygon created. (The polygon is scaled to have a maximum length of 40mm.)

2. It creates the data file "duck.mat"

3. It creates a data file formatted for OpenSCAD titled "poly.scad" 

The OpenSCAD file makefloat.scad creates a printable file in STL format. 

Instructions: 

1. By default, the height of the print is 70mm. Change the variable hei on line 1 to change this value. 
2. Render (Design menu)
3. Export as STL (File>Export Menu). 
