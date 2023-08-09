% This shows sample usage. 
% For all commands below, see the documentation for all possible options 
% Example: Type "doc plotshape"

addpath('ShapesSimple','ShapesComplex') % Include the folder with shapes

arrow;   % Add a shape from the folders 'ShapesSimple' and 'ShapesComplex' 

plotshape(xvalues,yvalues,1) % Plot shape to make sure it is counterclockwise orientation 

PotEnergyCalc(xvalues,yvalues,densityRatio); % Dimensionless potential energy 

PotEnergyCalc(xvalues,yvalues,0.2); % User specified density ratio (between 0 and 1)

StableFloatAngles = findPEmin(xvalues,yvalues,densityRatio) % Clockwise rotation angles (degrees)

makethetaplot(xvalues,yvalues); % Plot the R/theta graph
