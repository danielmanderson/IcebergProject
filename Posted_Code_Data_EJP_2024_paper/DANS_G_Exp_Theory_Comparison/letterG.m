clear xvalues
clear yvalues; 

%densityRatio=.875;  % I think this does not get used here
%
% Letter G (original version is I think what we printed ... we can
% tell by the smallish divot/pimple on the bottom inside portion of the G)
%
%picture_G_fixed;
picture_G_original;
xpoints = points(1:2:end);
ypoints = points(2:2:end);  
max1 = max(xpoints);
max2 = max(ypoints);
max_scale = max(max1,max2);
xpoints = xpoints/max_scale;   % 'long' row vector
ypoints = ypoints/max_scale;   % 'long' row vector
%
XY = [xpoints;ypoints];
%
xvalues = XY(1,:);   % I think this is the same as xpoints
yvalues = XY(2,:);   % I think this is the same as ypoints

%%plot(xvalues,yvalues,'k.')

	
