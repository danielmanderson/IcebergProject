function [xvalues,yvalues] = figure2points(inputfile,outputfile)
%Sample Usage
%figure2points('duck.png','duck') %Do not include the suffix on the output file! 

I = imread(inputfile);

scaler = 0.1;

bandw = im2gray(I);
A = uint8(bandw);
A = A-min(min(A));
[row,col]=find(A==1);
k = boundary(row,col,1);
y = row(k);
y = max(y)-y;
x = col(k);

matrix = scaler*[x,y];

xvalues = scaler*x;
yvalues = scaler*y; 

figure; plot(xvalues,yvalues);


save([outputfile,'.mat'],"xvalues","yvalues")

%% Creates txt file for use with Openscad's Polygon function

fileID = fopen([outputfile,'.scad'],'w');

fprintf(fileID,'points = [' );
for ii = 1:length(x)-1
fprintf(fileID,'[ %f , %f ],',matrix(ii,:));
end
fprintf(fileID,'[ %f , %f ]];',matrix(length(x),:));

fclose(fileID);