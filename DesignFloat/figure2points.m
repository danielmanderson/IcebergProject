function [xvalues,yvalues] = figure2points(inputfile,outputfile,cutoff)
%Sample Usage
%figure2points('duck.png','duck',0.1) %Do not include the suffix on the output file! 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting unset optional values to default values

if ~exist('cutoff', 'var'), cutoff=0; end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


I = imread(inputfile);

bandw = im2gray(I);
A = uint8(bandw);
A = A-min(min(A));
[row,col]=find(A==max(max(A))*cutoff);
k = boundary(row,col,1);
y = row(k);
y = max(y)-y;
x = col(k);


%Translate to center
x = x - (max(x)+min(x))/2;
y = y - (max(y)+min(y))/2; 

%Scale to 40mm width  
scaler = 20/max(max(x),max(y));

xvalues = scaler*x;
yvalues = scaler*y; 

matrix = [xvalues,yvalues];


figure; plot(xvalues,yvalues);


save([outputfile,'.mat'],"xvalues","yvalues")

%% Creates txt file for use with Openscad's Polygon function

fileID = fopen(['poly.scad'],'w');

fprintf(fileID,'points = [' );
for ii = 1:length(x)-1
fprintf(fileID,'[ %f , %f ],',matrix(ii,:));
end
fprintf(fileID,'[ %f , %f ]];',matrix(length(x),:));

fclose(fileID);