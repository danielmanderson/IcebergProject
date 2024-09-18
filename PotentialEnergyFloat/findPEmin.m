function thetamin = findPEmin(xvalues,yvalues,densityRatio,PEPlot,ShapePlot,thetaInput)
% Evelyn Sander 2023
% Computes the R versus theta plot of stable floating configurations of a shape with a fixed cross section. 
%
% There are example shapes in this folder. Such as, type: 
% triangle; thetamin = findPEmin(xvalues,yvalues,densityRatio);
%
% Standard usage: 
% thetamin = makethetaplot(xvalues,yvalues,densityRatio);
% xvalues, yvalues -  vectors describing a polygon oriented COUNTERCLOCKWISE
%                               
% Optional advanced settings: 
% PEPlot - whether to plot the potential energy (1=Plot, 0= No Plot)
% ShapePlot - whether to plot the shape in each stable orientation (1=Plot, 0= No Plot)
% thetaInput - If you want to start with a fixed set of points to begin with
% findmins - whether the code should initially search for local minima 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting unset optional values to default values

if ~exist('PEPlot', 'var'), PEPlot=1; end
if ~exist('ShapePlot', 'var'), ShapePlot=1; end
if ~exist('thetaInput', 'var'), thetaInput = linspace(0.5,360.5,50+(361-50)*PEPlot); end

options = optimset('TolFun',0.1,'TolX',0.1); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

thetaInput = sort(thetaInput); 

pec = @(x) PotEnergyCalc(xvalues,yvalues,densityRatio,0,0,x);


if PEPlot==0
	[potentialVector,thetavector] = pec(thetaInput);
else 
	[potentialVector,thetavector] = PotEnergyCalc(xvalues,yvalues,densityRatio,1,1,thetaInput); 
end 


potentialVector = [potentialVector; potentialVector(2)];
thetavector = [thetavector; 360+thetavector(2)];
localmins = find(islocalmin(potentialVector)==1);
numlocmin = length(localmins); 
thetamin = thetavector(localmins); 

parfor jj = 1:numlocmin
	thetamin(jj) = fminsearch(pec,thetamin(jj),options);
end

thetamin = round(thetamin); 


if ShapePlot==1
	for jj = 1:numlocmin
		[~,~,~,waterpoint] = pec(thetamin(jj));
		figure; plotshape(xvalues,yvalues,1,waterpoint,thetamin(jj));
	end
end 


	