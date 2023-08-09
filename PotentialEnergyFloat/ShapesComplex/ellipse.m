clear xvalues
clear yvalues; 

densityRatio=.875;

N = 200;
for i = 1:N
	xvalues(i) = 3*cos(i*2*pi/N);
	yvalues(i) = sin(i*2*pi/N);
end
	
