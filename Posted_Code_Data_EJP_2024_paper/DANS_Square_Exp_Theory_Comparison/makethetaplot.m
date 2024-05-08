function [denvec,thetavec]= makethetaplot(xvalues,yvalues,NumR,Numtheta)
% Evelyn Sander, based on code by ES, Patrick Bishop, Dan Anderson, 2023
% Computes the R versus theta plot of stable floating configurations of a shape with a fixed cross section. 
%
% Standard usage: 
% thetamin = makethetaplot(xvalues,yvalues);
%
% xvalues, yvalues -  vectors describing a polygon oriented COUNTERCLOCKWISE
%
% There are example shapes in this folder. Such as, type: 
% triangle; thetamin = makethetaplot(xvalues,yvalues);
%                               
% Optional advanced settings: 
% NumR - the number of evenly spaced values of R
% Numtheta - if you think that the shape is really complicated, make this larger than 20. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting unset optional values to default values

if ~exist('Numtheta', 'var'), Numtheta=20; end
if ~exist('NumR', 'var'), NumR=200; end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

densityRatio = linspace(0,1,NumR+2);
densityRatio = densityRatio(2:end-1); 

thetaInput = linspace(-0.5,360.5,Numtheta+50)'; 

denvec = []; 
thetavec = []; 



tic
for ii = 1:NumR
	thetamin = findPEmin(xvalues,yvalues,densityRatio(ii),0,0,thetaInput); 
	JJ = length(thetamin);
	denvec = [denvec; densityRatio(ii)*ones(JJ,1)]; 
    thetavec =[thetavec; thetamin(:)]; 
    thetaInput = [mod(thetamin+(rand(JJ,1)-0.5),360); linspace(-0.5,360.5,Numtheta)']; 
end

toc

figure; plot(denvec,thetavec,'.')
ylim([0,360])
   