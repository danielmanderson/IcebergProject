% test plot for transparency options    

figure(99)
x = 1:10;
y = rand(1,10);
%h = plot(x,y);
hold on
% scatter(x,y,150,'filled', ...
%        'MarkerFaceAlpha',1/8,'MarkerFaceColor',h.Color)         
% scatter(x,y,150,'filled', ...
%        'MarkerFaceAlpha',1/8,'MarkerFaceColor','r')         
scatter(x,y,450,'filled', ...
       'MarkerFaceAlpha',1/8,'MarkerFaceColor','r');hold on
plot(x,y,'cx','MarkerSize',10,'LineWidth',3)
hold off