zip_av = [12.584279
8.6800315
6.297932
5.348604
4.4421465
3.855137
3.4013585
2.967412
2.7042675
2.4884485
2.297357
2.1752925
2.038957
1.9442395
1.852778
1.250787
1.2056445];

zip_95th =[12.8475445
9.0720565
6.4558615
5.5564615
4.5426
3.950585
3.56655
3.068234
2.7940855
2.5972195
2.346441
2.23564
2.0996795
1.997958
1.926637
1.2880135
1.236948];

image_av = [2.76355
2.15355
1.8953
1.7514
1.60865
1.56555
1.50035
1.41815
1.34565
1.453
1.3328
1.33245
1.29525
1.329052632
1.2754
1.2456
1.194714286];

image_95th = [3.71945
2.32015
2.06045
2.203
1.72225
1.7153
1.6402
1.53265
1.42365
1.53975
1.40705
1.3961
1.33935
1.6093
1.34075
1.4296
1.2514];

x = {'128';
'192';
'256';
'320';
'384';
'448';
'512';
'576';
'640';
'704';
'768';
'832';
'896';
'960';
'1024';
'2048';
'3008'};

y_95th = [image_95th';zip_95th'];

f2 = figure;
yyaxis left
b1 = bar(1:17,y_95th, 1);
%set(gca,'xticklabel',x)
set(gca,'xtick',1:17,'xticklabel',x,'ycolor','k','FontSize',14);

hold on
b1(1).FaceColor = [112 128 144]/255;
b1(2).FaceColor = [220 220 220]/255;

la = ylabel('Cold Start (s)','FontSize',18) ;
la.Color = 'black';

yyaxis right
p1 = plot(1:17, zip_av,'-', 'color', 'k','MarkerIndices',250:500:2000,'MarkerSize',8,'LineWidth',3);
hold on
p2 = plot(1:17, image_av,':', 'color', [47 79 79]/255,'MarkerIndices',250:500:2000,'MarkerSize',8,'LineWidth',3);
set(gca,'ycolor','k');

ax = gca;
ax.YGrid = 'on';

xlabel('Memory (MB)','FontSize',18) ;
a = legend( 'Image Container 95th Percentile','Image Container Average', 'ZIP Package 95th Percentile','ZIP Package Average');
a.FontSize=14;
set(a,'location','best');

title('Cold Start of Image Classifier 230','FontSize',14);

f2.Position = [0 0 1000 500]; 
print('PlotLargeMemory','-depsc');















