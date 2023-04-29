The Matlab file figures2points.m takes an image and converts it into a counterclockwise oriented polygon defined by 

[xvalues,yvalues]

Sample Usage: 

figure2points('duck.png','duck') 

Do not include the suffix on the output file! 

It also creates a data file formatted for OpenSCAD where the title of the file is the output name you gave:  above it is "duck.scad" 

The file makefloat.scad creates an stl file from this data. 
(It inputs duck.scad unless you change line 1 of the file to a different name.)
