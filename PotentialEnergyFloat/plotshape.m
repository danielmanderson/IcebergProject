function plotshape(xvalues,yvalues,label,waterheight,theta,type,showarea)
%
% Evelyn Sander, Dan Anderson, 2026
%
% Standard usage: 
%
% plotshape(xvalues,yvalues)
% Plot the shape with coordinates given in vectors xvalues, yvalues
%
% Optional advanced settings 
% plotshape(xvalues,yvalues [,label [,waterpoint ,[theta [,type]]]])
%
% Advanced options: 
%
% If optional label is set to 1, it shows the first few points (to check counterclockwise orientation)
% If optional 2-vector waterpoint is given, it  plots the water at that height
% If optional angle theta (in degrees) is given, shape is rotated CLOCKWISE  
% If optional type = 1 then angles are given in radians (to prove that we are actually mathematicians)
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting unset optional values to default values

if ~exist('label', 'var'), label=0; end;
if ~exist('theta', 'var'), theta=0; end;
if ~exist('type', 'var'), type=0; end;
water = 1; if ~exist('waterheight', 'var'), water=0; waterheight = 0; end;
if ~exist('showarea','var'), showarea = 1; end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Making sure that all the vectors are row/columns as needed

xvalues = xvalues(:)';
yvalues = yvalues(:)';
%waterheight is on the waterline of the rotated shape. Doesn't need to be rotated. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Making sure that we have the last values equal to the first value
N=length(xvalues);
if (abs(xvalues(end)-xvalues(1))+abs(yvalues(end)-yvalues(1))>0)
	xvalues = [xvalues xvalues(1)];
	yvalues = [yvalues yvalues(1)];
	N = N+1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find Area
%
if showarea==1
	CrossSectionalArea = polyarea(xvalues,yvalues)
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define Rotation Matrix
%
angle = theta; 
if type == 0
	angle = theta*pi/180; 
end

sa = sin(angle);
ca = cos(angle);
Rotation_Matrix = [ca sa;-sa ca];    % CLOCKWISE ROTATION

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rotate the original shape
%

xyrot = Rotation_Matrix*([xvalues;yvalues]);


fill(xyrot(1,:),xyrot(2,:),'r','FaceAlpha',.2,'EdgeAlpha',.3);

if (label == 1)
	hold on;
	plot(xyrot(1,1),xyrot(2,1),'r.','markersize',14)
	plot(xyrot(1,2),xyrot(2,2),'g.','markersize',14)
	plot(xyrot(1,3),xyrot(2,3),'b.','markersize',14)
	xlabel('Point 1 red, Point 2 green, Point 3 blue')
end

axis equal



xmean = mean(xyrot(1,:));
ymean = mean(xyrot(2,:));
rmax = sqrt(max((xmean-xyrot(1,:)).^2+(ymean-xyrot(2,:)).^2));
addon = 0.05*(rmax);


xleft = xmean-rmax-addon;
xright = xmean+rmax+addon;
waterdown = ymean-rmax-addon;
ydown = waterdown;
waterup = waterheight; 
yup = ymean + rmax + addon;

if water==1
  hold on 
  fill([xleft,xright,xright,xleft],[waterdown,waterdown,waterup,waterup],'b','FaceAlpha',.3,'EdgeAlpha',.3);
end 

axis([xleft,xright,ydown,yup])



if theta == 0
	title('Shape of the cross section')
elseif type == 0
	title(['Shape of the cross section rotated by ',num2str(theta),' degrees'])
else
	title(['Shape of the cross section rotated by ',num2str(theta),' radians'])
end


