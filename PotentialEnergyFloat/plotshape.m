function plotshape(xvalues,yvalues,label,waterpoint,theta,type)
%
% Evelyn Sander, Dan Anderson, 2023
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
water = 1; if ~exist('waterpoint', 'var'), water=0; waterpoint=[0;0]; end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Making sure that all the vectors are row/columns as needed

xvalues = xvalues(:)';
yvalues = yvalues(:)';
waterpoint = waterpoint(:);

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

CrossSectionalArea = polyarea(xvalues,yvalues)

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

xyrot = Rotation_Matrix*([xvalues;yvalues]-waterpoint);

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



if water==1
  hold on 
  fill([xmean-rmax-1,xmean+rmax+1,xmean+rmax+1,xmean-rmax-1],[0,0,ymean-rmax-1,ymean-rmax-1],'b','FaceAlpha',.3,'EdgeAlpha',.3);
end 

axis([xmean-rmax-1,xmean+rmax+1,ymean-rmax-1,ymean+rmax+1])



if theta == 0
	title('Shape of the cross section')
elseif type == 0
	title(['Shape of the cross section rotated by ',num2str(theta),' degrees'])
else
	title(['Shape of the cross section rotated by ',num2str(theta),' radians'])
end


