function XY = get_XY_points(ishape)
%
% This function defines the (x,y) coordinates of a shape
%
% Input:  ishape
%
%         i = 1 Square centered at origin, corners at (-1,-1), (1,-1)
%                                             (1,1), (-1,1)
%         i = 2 Circle of radius 1 centered at origin
%     
%         i = 3 Other shape
%
%         i = 4 H-shape
%
%         i = 5 C-shape
%
%         i = 6 Mason M (three options)
%
%         i = 7 Arrow
%
%         i = 8 G
%
% Output: XY matrix: 2xN
%          xpoints = XY(1,:) -> x values of the shape in question (first row vector)
%          ypoints = XY(2,:) -> y values of the shape in question (second row vector)
%            NOTE: These should have ... xpoints(1) = xpoints(end)
%                                and ... ypoints(1) = ypoints(end)
%
% (DMA, 11-19-2021, 1-29-2023)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Select Shape
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ishape == 1
   %
   % SQUARE 
   %
   xsquare = [-1 1 1 -1];
   ysquare = [-1 -1 1 1];
   xpoints = [xsquare xsquare(1)];  % 'completing' the square ...
   ypoints = [ysquare ysquare(1)];
   %
   elseif ishape == 2
   %
   % CIRCLE/ELLIPSE
   %
   num_points = 50;
   t = linspace(0,2*pi,num_points);
   xamp=1;
   yamp=1;
   xpoints = xamp*cos(t);
   ypoints = yamp*sin(t);
   xpoints(end)=xpoints(1);  % these lines assure that the endpoints match
   ypoints(end)=ypoints(1);
   elseif ishape == 3
   %
   % OTHER, POSSIBLY NON-CONVEX SHAPE
   % 
   num_points = 800;
   R_amp = 0.4;
   beta = 3;
   t = linspace(0,2*pi,num_points+1);
   xpoints = (1+ R_amp*cos(beta*t)).*cos(t);
   ypoints = (1+ R_amp*cos(beta*t)).*sin(t);
   xpoints(end)=xpoints(1);  % these lines assure that the endpoints match
   ypoints(end)=ypoints(1);
   elseif ishape == 4
   %
   % H SHAPE
   %
   xpoints = [1 1 0.5 0.5 -0.5 -0.5 -1 -1 -0.5 -0.5 0.5 0.5 1];
   ypoints = [-1 1 1 0.5 0.5 1 1 -1 -1 -0.5 -0.5 -1 -1];
   elseif ishape == 5
   %
   % C SHAPE
   %
   xpoints = [1 1 -0.75 -0.75 1 1 -1 -1 1];
   ypoints = [-1 -0.75 -0.75 0.75 0.75 1 1 -1 -1];
   elseif ishape == 6
   %
   % Mason M Shape
   %   Three options (one piece - just the M)
   %                 (two piece - M + one feather)
   %                 (three piece - M + two feathers)
   %
   %load MasonM_ThreePiece_Final.m;
   %MasonM = MasonM_ThreePiece_Final;
   %load MasonM_TwoPiece_Final.m;
   %MasonM = MasonM_TwoPiece_Final;
   load MasonM_OnePiece_Final.m;
   MasonM = MasonM_OnePiece_Final;
   max1 = max(MasonM(1,:));
   max2 = max(MasonM(2,:));
   max_scale = max(max1,max2);
   xpoints = MasonM(1,:)/max_scale;  % scaled points on (x,y) in [0,1]x[0,1]
   ypoints = MasonM(2,:)/max_scale;  
   elseif ishape == 7
   %
   % Arrow
   %
   xarrow = [0 2.2 4.4 2.2];
   yarrow = [0 2.08 0 4.24];
   xpoints = [xarrow xarrow(1)];  % 'completing' the square ...
   ypoints = [yarrow yarrow(1)];
   elseif ishape == 8
   %
   % letter G
   % 
   picture_G_fixed;
   xpoints = points(1:2:end);
   ypoints = points(2:2:end);  
   max1 = max(xpoints);
   max2 = max(ypoints);
   max_scale = max(max1,max2);
   xpoints = xpoints/max_scale;
   ypoints = ypoints/max_scale;
end
%
XY = [xpoints;ypoints];
%
end

