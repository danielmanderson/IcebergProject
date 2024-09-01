function [potentialVector,thetaVector,centerOfBuoyancy] = PotEnergyCalc(xvalues,yvalues,densityRatio,PEPlot,ShapePlot, thetaInput)
%
% Code from Mathematics of Floating 3D Printed Objects
% by Anderson, Barreto-Rosa, Calvano, Nsair, Sander 2022
% Computes the potential energy of a shape with a fixed cross section and density ratio. 
%
% Standard usage: 
% [potentialVector,thetaVector] = PotEnergyCalc(xvalues,yvalues,densityRatio);
%
% xvalues, yvalues -  vectors describing a polygon oriented COUNTERCLOCKWISE
% densityRatio - scalar value
% potentialVector  potential energy, 
% thetaVector  corresponding rotation angle (degrees) where shape is rotated CLOCKWISE
%
% There are example shapes in this folder. Such as, type: 
% triangle; [potentialVector,thetaVector,centerOfBuoyancy] = PotEnergyCalc(xvalues,yvalues,densityRatio);
%                               
% Optional advanced settings: 
% [potentialVector,thetaVector,centerOfBuoyancy] = PotEnergyCalc(xvalues,yvalues,densityRatio [,PEPlot [,ShapePlot, [,thetaInput]]] );
% PEPlot - whether to plot the potential energy (1=Plot, 0= No Plot)
% ShapePlot - whether to plot the shape (1=Plot, 0= No Plot)
% thetaInput - rather than using a default thetaVector, it allows inputting thetaVector
% centerOfBuoyancy - Usually not used, only useful when the thetaInput is a scalar 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting unset optional values to default values

if ~exist('PEPlot', 'var'), PEPlot=1; end
if ~exist('ShapePlot', 'var'), ShapePlot=1; end
if ~exist('thetaInput', 'var'), thetaInput = linspace(0.5,360.5,20+341*PEPlot); end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Making sure that all the vectors are row/columns as needed

N=length(xvalues);
xvalues = xvalues(:)';
yvalues = yvalues(:)';
thetaVector = thetaInput(:);
LL = length(thetaInput); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Making sure that we have the last values equal to the first value

if (abs(xvalues(end)-xvalues(1))+abs(yvalues(end)-yvalues(1))>0)
	xvalues = [xvalues xvalues(1)];
	yvalues = [yvalues yvalues(1)];
	N = N+1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if ShapePlot==1
    %Showing what the shape looks like to verify orientation
    figure
    plotshape(xvalues,yvalues,1);
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set area of cross-section, gravity constant

a=polyarea(xvalues,yvalues);
vectorI=[0 0];
g=9.81;


%% Center of Gravity Calculation
%
for k=1:N-1
    if k==N-1
        nxi=(yvalues(1)-yvalues(k));
        nyi=-(xvalues(1)-xvalues(k));
        xaverage=((xvalues(1)^2)+xvalues(1)*xvalues(k)+(xvalues(k)^2))/3;
        yaverage=((yvalues(1)^2)+yvalues(1)*yvalues(k)+(yvalues(k)^2))/3;
    else 
        nxi=(yvalues(k+1)-yvalues(k));
        nyi=-(xvalues(k+1)-xvalues(k));
        xaverage=((xvalues(k+1)^2)+xvalues(k+1)*xvalues(k)+(xvalues(k)^2))/3;
        yaverage=((yvalues(k+1)^2)+yvalues(k+1)*yvalues(k)+(yvalues(k)^2))/3;
    end
    newVector=[0.5*(xaverage)*nxi 0.5*(yaverage)*nyi];
    vectorI=vectorI+newVector;
end

%% Center of Mass (can change for off-center), where dvec = distance from center of mass
%
centerOfMass=(vectorI)/a+[0.0 0.0];
dvec=sqrt((xvalues-centerOfMass(1)).^2+(yvalues-centerOfMass(2)).^2);
maxd=max(dvec);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Finds potential energy for each angle in the theta vector  

potentialVector = zeros(LL,1);

for ell = 1:LL
    theta=thetaVector(ell);
	mw=tand(theta);

	xstar1=centerOfMass(1)-maxd*cosd(theta-90);
	ystar1=centerOfMass(2)-maxd*sind(theta-90);
	xstar2=centerOfMass(1)+maxd*cosd(theta-90);
	ystar2=centerOfMass(2)+maxd*sind(theta-90);

	indexOfYBoi=find(yvalues==max(yvalues));
	xboi=xvalues(indexOfYBoi(1));

	xa=ystar2-mw*xstar2;
	xb=ystar1-mw*xstar1;

	[fa,~,~]=subboi(xa,xvalues,yvalues,theta,a,densityRatio);
	[fb,~,~]=subboi(xb,xvalues,yvalues,theta,a,densityRatio);

%% Bisection Method to find where water line intersects object
    while fa*fb > 0
   display('Bracket Not Found.  Try new guesses.')
    end
    if fa == 0
       %display('xa is a solution')
    end
    if fb == 0
       %display('xb is a solution')
       return
    end
    tol=10^(-6);
    err=abs((xb-xa)/2);
    while err>tol
        xm=xa+(xb-xa)/2;  % define new midpoint guess (first time through this 
                            % is the same as x(1).  After that, it is recorded
                            % as x(k)
        [fm,xsub,ysub]=subboi(xm,xvalues,yvalues,theta,a,densityRatio);
          if sign(fm)==sign(fa)  
             xa=xm;             % xstar guaranteed between xm and xb so replace xa with xm
             fa=fm;             % replace fa with fm
          else
             xb=xm;             % xstar guaranteed between xm and xa so replace xb with xm
             fb=fm;             % replace fb with fm
          end
          err=abs((xb-xa)/2);
    end

%%     
  b=polyarea(xsub,ysub);
  M=length(xsub);
  vectorJ=[0 0];

    for k=1:M-1
        if k==M-1
            nxi=(ysub(1)-ysub(k));
            nyi=-(xsub(1)-xsub(k));
            xsubav=((xsub(1)^2)+xsub(1)*xsub(k)+(xsub(k)^2))/3;
            ysubav=((ysub(1)^2)+ysub(1)*ysub(k)+(ysub(k)^2))/3;
        else
            nxi=(ysub(k+1)-ysub(k));
            nyi=-(xsub(k+1)-xsub(k));
            xsubav=((xsub(k+1)^2)+xsub(k+1)*xsub(k)+(xsub(k)^2))/3;
            ysubav=((ysub(k+1)^2)+ysub(k+1)*ysub(k)+(ysub(k)^2))/3;
        end
        newVector=[0.5*(xsubav)*nxi 0.5*(ysubav)*nyi];
        vectorJ=vectorJ+newVector;
    end

 
	centerOfBuoyancy=vectorJ/b;
	massOfObject=densityRatio*a;
	nxiw=-sind(theta);
	nyiw=cosd(theta);
	normalVectorToWater=[nxiw nyiw];
	diffBetweenGandB=[centerOfMass(1)-centerOfBuoyancy(1) centerOfMass(2)-centerOfBuoyancy(2)];
	potentialEnergy=dot(massOfObject*g*normalVectorToWater,diffBetweenGandB);  % massOfObject*g*
	potentialVector(ell)= potentialEnergy;
end


if PEPlot==1
    figure
    plot(thetaVector,potentialVector,'-b')
    xlabel('Angle (Degrees)','FontSize',20)
    ylabel('Potential Energy','FontSize',23)
    xlim([0,360])
end 


end


%Below are the functions needed. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [z,xsub,ysub]=subboi(bw,xvalues,yvalues,theta,a,densityRatio)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

line_angle=theta*pi/180;
line_point=[0;bw];
XYsub = get_submerged_points(xvalues,yvalues,line_angle,line_point);
xsub=XYsub(1,:);
ysub=XYsub(2,:);
b=polyarea(xsub,ysub);
c=b/a;
z=c-densityRatio;
end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function XYsub = get_submerged_points(xpoints,ypoints,line_angle,line_point)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%
% This function returns the subset of points along with the waterline
% segment(s) that define the submerged area.
%
% Input: xpoints -> x values of original shape (row vector)
%        ypoints -> y values of original shape (row vector)
%            NOTE: These should have ... xpoints(1) = xpoints(end)
%                                and ... ypoints(1) = ypoints(end)
%        line_angle -> the angle measured by clockwise rotation 
%                             angle = 0 corresponds to a horizontal line
%                                       with water below the line
%                             angle in [0,2*pi]
%        line_point -> [xline;yline] coordinate point on the line 
%                             (column vector)
%
% Description: This code does the following:
%                  - takes in the object shape and line information
%                  - rotates the object and line clockwise so the line is horizontal
%                  - identifies the 'submerged' points
%                  - rotates the object back counterclockwise by the same angle 
%
% Output: If some or all of the object is 'submerged':
%             -> XYsub = 2 x (M+1) matrix containing the submerged points
%                        x values in the first row
%                        y values in the second row
%         If none of the object is 'submerged':
%             -> XYsub = [0;0] ... single point returned.  This case should
%                be interpreted as corresponding to Area_submerged = 0.
%                That is the object is entirely above the waterline.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Define Rotation Matrix
%
sa = sin(line_angle);
ca = cos(line_angle);
Rotation_Matrix = [ca sa;-sa ca];    % CLOCKWISE ROTATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Rotate the original shape
%
XY_Rotated = Rotation_Matrix*[xpoints;ypoints];
xpoints = XY_Rotated(1,:);
ypoints = XY_Rotated(2,:);
%
% Identify new 'y' value of the rotated line
%
XY_Line = Rotation_Matrix*line_point;
Y_Line = XY_Line(2);                  % Specified 'waterline' height 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Find index values of points below the line (i.e. ypoints <= Y_Line)
%
% Note: if there are no points below the waterline then this function
%       returns XYsub=[0;0] meaning that the submerged area is zero.
%
indexvalues = find(XY_Rotated(2,:) <= Y_Line);   % exclude points above line
                                                 % include points on the line
                                                 % and below the line
[L,M]=size(indexvalues);
if M==0
   %display('line falls below the object - no submerged points')
   XYsub=[0;0];
   return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Assess where to replace the portions of the boundary above the 
% line with the intersecting line.  Here we distinguish two main cases:
%
% (1) In the first case the first point (and last point) in xpoints, ypoints
%     is one of the points at or below the waterline.
%
% (2) In the second case the first point (and last point) in xpoints,
% ypoints is NOT one of the points at or below the waterline.
%
%%%%%%%%%%%%%%%%%%%%%%%
i=1;
if indexvalues(i) == 1   % First point is below the waterline.
                          % Note that since xpoints(1)=xpoints(N)
                          % and ypoints(1)=ypoints(N) we know that
                          % indexvalues(M)=N ... last point below waterline
   xsub_points = [xpoints(i)];
   ysub_points = [ypoints(i)];
   while i < M
       diff = indexvalues(i+1)-indexvalues(i);
       if diff > 1  %gap found (one or more points above line)
          %
          % replace points indexvalue(i)+1 through indexvalue(i+1)-1 with intercept points
          %
          xa1 = xpoints(indexvalues(i));    
          ya1 = ypoints(indexvalues(i));
          xa2 = xpoints(indexvalues(i)+1);
          ya2 = ypoints(indexvalues(i)+1);
          Xinta = get_intersectionH(xa1,ya1,xa2,ya2,Y_Line);
          Yinta = Y_Line;
          %
          xb1 = xpoints(indexvalues(i+1)-1);    
          yb1 = ypoints(indexvalues(i+1)-1);
          xb2 = xpoints(indexvalues(i+1));
          yb2 = ypoints(indexvalues(i+1));
          Xintb = get_intersectionH(xb1,yb1,xb2,yb2,Y_Line);
          Yintb = Y_Line;
          %
          xsub_points = [xsub_points Xinta Xintb xpoints(indexvalues(i+1))];
          ysub_points = [ysub_points Yinta Yintb ypoints(indexvalues(i+1))];
          if i == M-1
              diff2 = (xsub_points(end)-xpoints(indexvalues(M)))^2 + ...
                      (ysub_points(end)-ypoints(indexvalues(M)))^2;
              if diff2 ~=0   % do not execute this step if the last point has already been recorded
                 xsub_points = [xsub_points xpoints(indexvalues(M))];
                 ysub_points = [ysub_points ypoints(indexvalues(M))];
              end
          end
       else
          xsub_points = [xsub_points xpoints(indexvalues(i+1))];
          ysub_points = [ysub_points ypoints(indexvalues(i+1))];
       end
       i = i+1;
   end    % end while
else % First point (and last point) are not below waterline
     %
     % replace points indexvalue(M)+1 through N and 
     % points 1 through indexvalue(1)-1 with intercept points
     % as well as setting the value of the first point in xsub and ysub
     % so it will match the last point in xsub and ysub
     %
     xa1 = xpoints(indexvalues(M));    
     ya1 = ypoints(indexvalues(M));
     xa2 = xpoints(indexvalues(M)+1);
     ya2 = ypoints(indexvalues(M)+1);
     Xinta = get_intersectionH(xa1,ya1,xa2,ya2,Y_Line);
     Yinta = Y_Line;
     %
     xb1 = xpoints(indexvalues(1)-1);    
     yb1 = ypoints(indexvalues(1)-1);
     xb2 = xpoints(indexvalues(1));
     yb2 = ypoints(indexvalues(1));
     Xintb = get_intersectionH(xb1,yb1,xb2,yb2,Y_Line);
     Yintb = Y_Line;
     %
     xsub_points = [xpoints(indexvalues(M)) Xinta Xintb xpoints(indexvalues(1))];
     ysub_points = [ypoints(indexvalues(M)) Yinta Yintb ypoints(indexvalues(1))];
     %
     while i < M
           diff = indexvalues(i+1)-indexvalues(i);
           if diff > 1  %gap found (one or more points above line)
              %
              % replace points indexvalue(i)+1 through indexvalue(i+1)-1 with intercept points
              %
              xa1 = xpoints(indexvalues(i));    
              ya1 = ypoints(indexvalues(i));
              xa2 = xpoints(indexvalues(i)+1);
              ya2 = ypoints(indexvalues(i)+1);
              Xinta = get_intersectionH(xa1,ya1,xa2,ya2,Y_Line);
              Yinta = Y_Line;
              %
              xb1 = xpoints(indexvalues(i+1)-1);    
              yb1 = ypoints(indexvalues(i+1)-1);
              xb2 = xpoints(indexvalues(i+1));
              yb2 = ypoints(indexvalues(i+1));
              Xintb = get_intersectionH(xb1,yb1,xb2,yb2,Y_Line);
              Yintb = Y_Line;
              %
              xsub_points = [xsub_points Xinta Xintb xpoints(indexvalues(i+1))]; 
              ysub_points = [ysub_points Yinta Yintb ypoints(indexvalues(i+1))]; 
              if i == M-1
                 diff2 = (xsub_points(end)-xpoints(indexvalues(M)))^2 + ...
                         (ysub_points(end)-ypoints(indexvalues(M)))^2;
                 if diff2 ~=0   % do not execute this step if the last point has already been recorded
                    xsub_points = [xsub_points xpoints(indexvalues(M))];
                    ysub_points = [ysub_points ypoints(indexvalues(M))];
                 end
              end
           else
              xsub_points = [xsub_points xpoints(indexvalues(i+1))];
              ysub_points = [ysub_points ypoints(indexvalues(i+1))];
           end
           i = i+1;
     end  % end while
end   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%
%  Rotate the object back to its original orientation
%
Rotation_Matrix_Inv = [ca -sa;sa ca];    % ROTATE BACK COUNTER CLOCKWISE
%
XYsub = Rotation_Matrix_Inv*[xsub_points;ysub_points];   
%
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function Xint = get_intersectionH(x1,y1,x2,y2,Y_Line)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%
%
% This function takes in two coordinate points (x1,y1) and (x2,y2)
% and returns the x value of the intersection of that line segment 
% and a horizontal line y = Y_Line
%
% called by get_submerged_points.m 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Line segment connecting (x1,y1) and (x2,y2)
%
% y - y1 = s * (x-x1)
%
% where s = (y2-y1)/(x2-x1)
%
if x2 == x1
   Xint = x1;
else
   s = (y2-y1)/(x2-x1);
   Xint = x1 + (Y_Line - y1)/s;
end

end