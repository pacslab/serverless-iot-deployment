

sizek = [1
14
64
83
126
186
230];



f1 = figure;
yyaxis right

b = barh(x,sizek', 0.5);
hold on

%-----label value

xtips1 = b(1).YEndPoints + 12;
ytips1 = b(1).XEndPoints;
labels1 = string(round(b(1).YData,1));
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')
b.FaceColor = 'flat';

b.CData(1,:) = [ 20 20 20]/255; 
b.CData(2,:) =      [47 79 79] / 255;
b.CData(3,:)  =      [112 128 144] / 255;
b.CData(4,:) =      [105 105 105] / 255;
b.CData(5,:)  =      [169 169 169] / 255;
b.CData(6,:)    =    [192 192 192] / 255;
b.CData(7,:)  =     [220 220 220] / 255;


ax = gca;
ax.XGrid = 'on';
set(gca, 'XDir','reverse')

%set(gca, 'YTickLabel',{'Image Classifier 230','Linear regression', 'OpenCV', 'TensorFlow','Resize and Feature', 'Factorial','Resize' },'FontSize',15,'YColor','k')
set(gca, 'YTickLabel',{'Factorial','Resize','Resize and Feature','TensorFlow', 'OpenCV', 'Linear regression', 'Image Classifier 230'},'FontSize',15,'YColor','k','TickLength',[0 0])
%yticklabels({'Factorial','Resize','Resize and Feature','TensorFlow', 'OpenCV', 'Linear regression', 'Image Classifier 230'},'FontSize',15,'YColor','k')

yyaxis left
set(gca,'YTickLabel',[],'YColor','k');

set(gca,'xtick',(0:30:250),'FontSize',15)
xlim([0, 250]);
;

title('Zip Package Size','FontSize',18);
xlabel('Size (MB)','FontSize',18);

f1.Position = [0 0 630 700]; 
print('BarPlotRange2','-depsc')










