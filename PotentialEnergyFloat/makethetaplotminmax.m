function [denvec,thetavec]= makethetaplotminmax(xvalues,yvalues,NumR,Numtheta)
% Evelyn Sander, based on code by ES, Patrick Bishop, Dan Anderson, 2026
% Computes the R versus theta plot of stable (blue) and most unstable (red) floating configurations of a shape with a fixed cross section. 
% Sometimes useful to see the full bifurcation diagram not just the stable case. 
%
% Standard usage: 
% thetamin = makethetaplotminmax(xvalues,yvalues);
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

denminvec = []; 
thetaminvec = []; 
denmaxvec = []; 
thetamaxvec = []; 



tic

parfor ii = 1:NumR
	[thetamin{ii},thetamax{ii}] = findPEminmax(xvalues,yvalues,densityRatio(ii),0,0,thetaInput); 
end 


for ii = 1:NumR
	JJ = length(thetamin{ii});
	KK = length(thetamax{ii}); 
	denminvec = [denminvec; densityRatio(ii)*ones(JJ,1)]; 
	denmaxvec = [denmaxvec; densityRatio(ii)*ones(KK,1)]; 	
    thetaminvec =[thetaminvec; thetamin{ii}]; 
    thetamaxvec =[thetamaxvec; thetamax{ii}]; 
end

toc

figure; plot(denminvec,thetaminvec,'b.')
hold on; 
plot(denmaxvec,thetamaxvec,'r.')
ylim([0,360])

xlabel('Density Ratio','FontSize',20)
ylabel('Stable (Blue)/Unstable (Red) Angles (Degrees)','FontSize',20)