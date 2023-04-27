% Sample usage

% Include the folder with shapes

addpath('Shapes_Simple','Shapes_Complex')

% Add a shape from the folder 'Shapes_Simple/'

arrow;   

% Plot shape to make sure it is counterclockwise orientation 
plotshape(xvalues,yvalues,1)

% Find the potential energy 
PotEnergyCalc(xvalues,yvalues,densityRatio); 

% Find the actual floating configurations 
findPEmin(xvalues,yvalues,densityRatio)

% Plot the R/theta graph
makethetaplot(xvalues,yvalues);

% You can also add shapes from the folder 'Shapes_Complex' 

