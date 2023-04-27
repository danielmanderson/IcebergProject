clear xvalues
clear yvalues


%n-star
n = 5; 
for j = 1:2*n+1
xvalues(j) = (0.4*(-1)^j+1 )*cos(2*pi*((j-1)/2)/n);
yvalues(j)=  (0.4*(-1)^j+1 )*sin(2*pi*((j-1)/2)/n);
end

