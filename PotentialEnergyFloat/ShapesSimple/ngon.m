
clear xvalues
clear yvalues

%n-gon
n = 5; 
for j = 1:n+1
xvalues(j) = cos(2*pi*(j-1)/n);
yvalues(j)= sin(2*pi*(j-1)/n);
end


