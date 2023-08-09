clear xvalues
clear yvalues; 

densityRatio = 0.4;

N = 200; 

t1 = linspace(0,pi/3,N);
t2 = linspace(2*pi/3,pi,N);
t3 = linspace(4*pi/3,5*pi/3,N); 


x1 = 0+cos(t1);
y1 = 0+sin(t1);
x2 = 1+cos(t2);
y2 = 0+sin(t2);
x3 = 1/2+cos(t3);
y3 = sqrt(3)/2 + sin(t3);

figure
plot(x1,y1,'.',x2,y2,'.',x3,y3,'.')

xvalues = [x1(1:end-1) x2(1:end-1) x3];
yvalues = [y1(1:end-1) y2(1:end-1) y3];