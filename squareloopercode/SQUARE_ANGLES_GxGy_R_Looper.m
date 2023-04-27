function [] = SQUARE_ANGLES_GxGy_R_Looper(Rmin,Rmax,numR,Gx,Gy)
%
% This file contains formulas for computing the center of
% buoyancy and potential energy for a floating plank with square
% (2D) cross section.
%
% The square is assumed to have vertices at 
%      (-1,-1), (1,-1), (1,1), (-1,1)
%
% Inputs
%
% * Rmin = minimum value of the object/water density ratio ... on (0,1)
% * Rmax = maximum value of the object/water density ratio ... on (0,1)
%   with Rmax >= Rmin
% * numR = number of R values to examine and use in the plot
%
% Note:  R = (submerged cross sectional area)/(total cross sectional area) 
%          = (density of object)/(density of water)
%
%        density of object = (mass of object)/(volume of object)
%
% This is the appropriate density to use independent of the spatial
% distribution of mass (i.e. the location of the center of gravity).
%
% * (Gx,Gy) = Center of gravity of the square.  These values are relative to
% the square defined above.  This means Gx and Gy are on [0,1].
%
% The Potential Energy Function is
%
%  PE = n . (G - B)
%
%  where n is the unit normal to the waterline, 
%        G is the center of gravity
%        B is the center of buoyancy
%
% The center of buoyancy is be computed based on two different configurations 
%
%   A: waterline intersects opposite sides
%   B: waterline intersects adjacent sides
%
% Note that for the square when (Gx,Gy) is not at the origin the four-fold
% symmetry associated with the potential energy as a whole is lost,
% although the four-fold symmetry still applies when computing the center
% of buoyancy.
%
% This loops through a ange of R, identifies the orientations (values of 
% theta) where the PE landscape has local minima. and then plots these values 
% of theta vs. R.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example Usage
%
%  > SQUARE_ANGLES_GxGy_R_Looper(0.01,0.99,500,0.1,0.1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% (DMA, 2-22-2022, 4-3-2022)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rvec = linspace(Rmin,Rmax,numR);     % Define vector of R values
for k = 1:numR
    R = Rvec(k);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % Define the square (using coordinates at the corners)
    %
    xsquare = [1 1 -1 -1];
    ysquare = [-1 1 1 -1];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % CONFIGURATION A - OPPOSITE SIDES
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % 
    % Define Range of angles that define the slope of the waterline
    % for case A in which the waterline intersects opposite sides
    % of the square.
    %
    H = 2*R - 1;    % intercept of the waterline with the y-axis
    %
    tan_theta_minA = -1 + abs(H);
    tan_theta_maxA = 1 - abs(H);
    theta_minA = atan(tan_theta_minA) + 1e-10;  % keep theta away from limits
    theta_maxA = atan(tan_theta_maxA) - 1e-10;
    %
    num_thetaA = 101;
    thetaA = linspace(theta_minA,theta_maxA,num_thetaA);
    yL = H - tan(thetaA);
    yR = H + tan(thetaA);
    %
    AsubA = 2*(1+H);   % Submerged area AsubA
    %
    % Define the Center of Buoyancy Formula
    %
    BxA = (2/3)*tan(thetaA);
    ByA = (-1 + H^2 + (1/3)*tan(thetaA).^2);
    %
    BxA = BxA/AsubA;
    ByA = ByA/AsubA;
    %
    % Define the normal vector to the waterline, n = (nx,ny)
    %
    nxA = -sin(thetaA);
    nyA = cos(thetaA);
    %
    % Define the Potential Energy, PE = n . (G - B)
    %
    PEA_Buoyancy_Term = nxA.*BxA + nyA.*ByA;
    PEA_Gravity_Term = nxA.*Gx + nyA.*Gy;
    %
    PEA = PEA_Gravity_Term - PEA_Buoyancy_Term;
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % CONFIGURATION B - ADJACENT SIDES
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % 
    % Define Range of angles that define the slope of the waterline
    % for case B in which the waterline intersects adjacent sides
    % of the square.  These formulas are expressed in two cases:
    % R >= 1/2 and R < 1/2
    %
    if R >= 0.5
       tan_theta_minB = 2 - 2*R;
       tan_theta_maxB = 1/(2-2*R);
       theta_minB = atan(tan_theta_minB) + 1e-10;
       theta_maxB = atan(tan_theta_maxB) - 1e-10;
       %
       num_thetaB = 101;
       thetaB = linspace(theta_minB,theta_maxB,num_thetaB);
       %
       xR = -1 + 2*sqrt( (2-2*R)./tan(thetaB) );
       yL = 1 - (1+xR).*tan(thetaB);
       %
       AsubB = 4 - (1+xR).*(1-yL)/2;  % submerged area AsubB
       %
       % Define the Center of Buoyancy Formula
       %
       BxB = 1 - (yL+1)/2 - (xR.^3 + 1).*tan(thetaB)/6;
       ByB = -1 + (1-xR)/2 + (1-yL.^3)./(6*tan(thetaB));
       %
       BxB = BxB./AsubB;
       ByB = ByB./AsubB;
       %
       % Define the normal vector to the waterline, n = (nx,ny)
       %
       nxB = -sin(thetaB);
       nyB = cos(thetaB);
       %
       % Define the Potential Energy, PE = n . (G - B)
       %
       PEB_Buoyancy_Term = nxB.*BxB + nyB.*ByB;
       PEB_Gravity_Term = nxB.*Gx + nyB.*Gy;
       %
       PEB = PEB_Gravity_Term - PEB_Buoyancy_Term;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else  % R < 0.5
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       tan_theta_minB = 2*R;
       tan_theta_maxB = 1/(2*R);
       theta_minB = atan(tan_theta_minB)+ 1e-10;
       theta_maxB = atan(tan_theta_maxB)- 1e-10;
       %
       num_thetaB = 101;
       thetaB = linspace(theta_minB,theta_maxB,num_thetaB);
       %
       xL = 1 - 2*sqrt( 2*R./tan(thetaB) );
       yR = -1 + (1-xL).*tan(thetaB);
       %
       AsubB = (1+yR).*(1-xL)/2;    % submerged area AsubB
       %
       % Define the Center of Buoyancy Formula
       %
       BxB = (yR+1)/2 - (1 - xL.^3).*tan(thetaB)/6;
       ByB = -(1-xL)/2 + (1+yR.^3)./(6*tan(thetaB));
       %
       BxB = BxB./AsubB;
       ByB = ByB./AsubB;
       %
       % Define the normal vector to the waterline, n = (nx,ny)
       %
       nxB = -sin(thetaB);
       nyB = cos(thetaB);
       %
       % Define the Potential Energy, PE = n . (G - B)
       % 
       PEB_Buoyancy_Term = nxB.*BxB + nyB.*ByB;
       PEB_Gravity_Term = nxB.*Gx + nyB.*Gy;
       %
       PEB = PEB_Gravity_Term - PEB_Buoyancy_Term;
    end  % R >= 1/2 and R < 1/2 cases
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % Compute the PE values over the full range of angle rotations
    %
    %%%%%%%%%%%%%%%%%%%%%%%%
    % one quarter rotation
    %%%%%%%%%%%%%%%%%%%%%%%%
    theta_1Q_A = thetaA+pi/2;
    theta_1Q_B = thetaB+pi/2;
    nxA = -sin(theta_1Q_A);
    nyA = cos(theta_1Q_A);
    nxB = -sin(theta_1Q_B);
    nyB = cos(theta_1Q_B);
    PEA_Gravity_Term = nxA.*Gx + nyA.*Gy;
    PEB_Gravity_Term = nxB.*Gx + nyB.*Gy;
    PEA_1Q_A = PEA_Gravity_Term - PEA_Buoyancy_Term;
    PEB_1Q_B = PEB_Gravity_Term - PEB_Buoyancy_Term;
    %%%%%%%%%%%%%%%%%%%%%%%%
    % two quarter rotations
    %%%%%%%%%%%%%%%%%%%%%%%%
    theta_2Q_A = thetaA+pi;
    theta_2Q_B = thetaB+pi;
    nxA = -sin(theta_2Q_A);
    nyA = cos(theta_2Q_A);
    nxB = -sin(theta_2Q_B);
    nyB = cos(theta_2Q_B);
    PEA_Gravity_Term = nxA.*Gx + nyA.*Gy;
    PEB_Gravity_Term = nxB.*Gx + nyB.*Gy;
    PEA_2Q_A = PEA_Gravity_Term - PEA_Buoyancy_Term;
    PEB_2Q_B = PEB_Gravity_Term - PEB_Buoyancy_Term;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % minus one quarter rotation
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    theta_M1Q_A = thetaA-pi/2;
    theta_M1Q_B = thetaB-pi/2;
    nxA = -sin(theta_M1Q_A);
    nyA = cos(theta_M1Q_A);
    nxB = -sin(theta_M1Q_B);
    nyB = cos(theta_M1Q_B);
    PEA_Gravity_Term = nxA.*Gx + nyA.*Gy;
    PEB_Gravity_Term = nxB.*Gx + nyB.*Gy;
    PEA_M1Q_A = PEA_Gravity_Term - PEA_Buoyancy_Term;
    PEB_M1Q_B = PEB_Gravity_Term - PEB_Buoyancy_Term;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % minus two quarter rotations
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    theta_M2Q_A = thetaA-pi;
    theta_M2Q_B = thetaB-pi;
    nxA = -sin(theta_M2Q_A);
    nyA = cos(theta_M2Q_A);
    nxB = -sin(theta_M2Q_B);
    nyB = cos(theta_M2Q_B);
    PEA_Gravity_Term = nxA.*Gx + nyA.*Gy;
    PEB_Gravity_Term = nxB.*Gx + nyB.*Gy;
    PEA_M2Q_A = PEA_Gravity_Term - PEA_Buoyancy_Term;
    PEB_M2Q_B = PEB_Gravity_Term - PEB_Buoyancy_Term;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %
    % Identify values of theta where the PE achieves a local min
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    theta_test_vec = [theta_M2Q_A theta_M2Q_B theta_M1Q_A theta_M1Q_B ...
                      thetaA thetaB ...
                      theta_1Q_A theta_1Q_B theta_2Q_A theta_2Q_B];
    %
    PE_test_vec = [PEA_M2Q_A PEB_M2Q_B PEA_M1Q_A PEB_M1Q_B ...
                   PEA PEB ...
                   PEA_1Q_A PEB_1Q_B PEA_2Q_A PEB_2Q_B];
    %
    % use Matlab's 'islocalmin' to identify local min locations
    %
    PE_min_logical = islocalmin(PE_test_vec);
    %
    theta_localmin_vec =[];
    PE_localmin_vec = [];
    for i=1:length(theta_test_vec)
        if PE_min_logical(i)
           if theta_test_vec(i)/pi < 1
           if theta_test_vec(i)/pi >= -1
              theta_localmin_vec = [theta_localmin_vec theta_test_vec(i)];
              PE_localmin_vec = [PE_localmin_vec PE_test_vec(i)];
           end
           end
        end
    end
    %
    % Generate a plot
    % 
    Rplot = R*ones(size(theta_localmin_vec));
    plot(Rplot,theta_localmin_vec/pi,'k.','MarkerSize',8);hold on;
    axis([Rmin,Rmax,-1,1])
    xlabel('R','FontSize',20)
    ylabel('\theta/\pi','FontSize',20)
end
end



