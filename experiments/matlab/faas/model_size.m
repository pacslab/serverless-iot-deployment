zip_230 = [12.584279
8.6800315
6.297932
5.348604
4.4421465
3.855137
3.4013585];

image_230 = [2.76355
2.15355
1.8953
1.7514
1.60865
1.56555
1.50035];

zip_249 = [15.284256
10.8670185
7.788236
6.4936315
5.2042145
4.5009115
3.979908];
image_249 = [3.05945
2.55335
2.06965
1.9704
1.67875
1.596
1.534059701];

zip_236 = [13.1316035
8.954925
6.8351665
5.5005895
4.575835
3.9798525
3.5054605];
image_236 = [2.82245
2.2602
1.8931
1.72125
1.60335
1.5258
1.46055];

zip_245 = [14.531919
9.982479
7.6270805
6.070637
5.0136355
4.3454945
3.8091395];
image_245 = [2.8412
2.2308
1.8946
1.69105
1.58825
1.51445
1.4808];

zip_241 = [13.902771
9.574509
7.216217
5.8561885
4.89766
4.1654125
3.702036];

image_241 =[2.770708333
2.2186
1.900833333
1.67728
1.57892
1.48256
1.472565217];

x = {'128';
'192';
'256';
'320';
'384';
'448';
'512'};


f2 = figure;
%scatter(1:7, zip_230,'.');
fitx=linspace(1,7,100);
fity = interp1(1:7,zip_230,fitx,'spline');
hold on
l1 = line(fitx,fity)
l1.LineStyle = '-';
%l1.Marker = '*';
set(l1, 'Color','k','LineWidth',1)
%scatter(1:7, zip_236,'.');
fity = interp1(1:7,zip_236,fitx,'spline');
l2 = line(fitx,fity)
l2.LineStyle = ':';
%l2.Marker = '*';
set(l2, 'Color','m','LineWidth',1)
%scatter(1:7, zip_236,'.');
fity = interp1(1:7,zip_241,fitx,'spline');
l22 = line(fitx,fity)
l22.LineStyle = '-';
l22.Marker = '+';
%l2.Marker = '*';
set(l22, 'Color','r','LineWidth',1)
%scatter(1:7, zip_245,'.');
fity = interp1(1:7,zip_245,fitx,'spline');
l3 = line(fitx,fity)
l3.LineStyle = '-.';
%l3.Marker = '*';
set(l3, 'Color','b','LineWidth',1)
%scatter(1:7, zip_249,'.');
fity = interp1(1:7,zip_249,fitx,'spline');
l4 = line(fitx,fity)
l4.LineStyle = '--';
%l4.Marker = '*';
set(l4, 'Color','g','LineWidth',1)
title('Run Time for 512MB','FontSize',18);
set(gca,'xtick',1:7,'xticklabel',x,'ycolor','k','FontSize',14);


xlabel('Memory (MB)','FontSize',18);
ylabel('Cold Start (s)','FontSize',18);
a = legend( '230MB', '236MB','241MB', '245MB', '249MB');
a.FontSize=14;
ax = gca;
ax.XGrid = 'on';
box on
f2.Position = [0 0 600 600]; 
print('ColdModelZ','-depsc')


%----------
f3 = figure;
ax = gca;
ax.XGrid = 'on';
%scatter(1:7, zip_230,'.');
fitx=linspace(1,7,100);
fity = interp1(1:7,image_230,fitx,'spline');
hold on
l1 = line(fitx,fity)
l1.LineStyle = '-';
%l1.Marker = '*';
set(l1, 'Color','k','LineWidth',1)
%scatter(1:7, zip_236,'.');
fity = interp1(1:7,image_236,fitx,'spline');
l2 = line(fitx,fity)
l2.LineStyle = ':';
%l2.Marker = '*';
set(l2, 'Color','m','LineWidth',1)
%scatter(1:7, zip_241,'.');
fity = interp1(1:7,image_241,fitx,'spline');
l22 = line(fitx,fity)
l22.LineStyle = '-';
l22.Marker = '+';
%l2.Marker = '*';
set(l22, 'Color','r','LineWidth',1)
%scatter(1:7, zip_245,'.');
fity = interp1(1:7,image_245,fitx,'spline');
l3 = line(fitx,fity)
l3.LineStyle = '-.';
%l3.Marker = '*';
set(l3, 'Color','b','LineWidth',1)
%scatter(1:7, zip_249,'.');
fity = interp1(1:7,image_249,fitx,'spline');
l4 = line(fitx,fity)
l4.LineStyle = '--';
%l4.Marker = '*';
set(l4, 'Color','g','LineWidth',1)

title('Run Time for 512MB','FontSize',18);
set(gca,'xtick',1:7,'xticklabel',x,'ycolor','k','FontSize',14);


xlabel('Memory (MB)','FontSize',18);
ylabel('Cold Start (s)','FontSize',18);
a = legend( '230MB', '236MB','241MB', '245MB', '249MB');
a.FontSize=14;
box on
f3.Position = [0 0 600 600]; 
print('ColdModelI','-depsc')



















