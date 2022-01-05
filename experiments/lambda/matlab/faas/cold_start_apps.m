
resize = [0.055833934
0.026579607
-0.079280135
-0.038883381
-0.133187496
-0.142321107
-0.12774468];

resize_feature = [0.062411719
0.061931891
0.068002843
0.01704855
0.042218045
0.030868133
0.043051411];

math = [0.210167255
0.193605011
0.184189947
0.187076553
0.176355083
0.174654419
0.183319916];

opencv = [0.380392759
0.351727528
0.323405704
0.301164633
0.276800782
0.25200088
0.249721091];

tensorflow = [0.147934728
0.132775894
0.146346695
0.148804372
0.155464486
0.157397466
0.137429372];

app_230mb = [0.780396636
0.751896062
0.699059945
0.672550071
0.637866513
0.593905482
0.558896835];

factorial = [-0.093174136
-0.126964099
-0.166702249
-0.178477911
-0.217399031
-0.257032054
-0.277065691];

m=[];
for i=1:7
    m = [m;factorial(i) resize(i) resize_feature(i) tensorflow(i) opencv(i) math(i) app_230mb(i)];
end


y = [factorial';resize';resize_feature';tensorflow';opencv';math';app_230mb'];
%y = [factorial';resize']

% plot cold start
f1 = figure;
x = [128 192 256 320 384 448 512];

b = barh(x,y*100,'facecolor', 'flat')
hold on

%-----label value

xtips1 = b(1).YEndPoints + 0.3;
for i=1:7
    if (xtips1(i)<0)
        xtips1(i) = xtips1(i) -6;
    end
end
ytips1 = b(1).XEndPoints;
labels1 = string(round(b(1).YData,1));
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(2).YEndPoints + 0.3;
for i=1:7
    if (xtips2(i)<0)
        xtips2(i) = xtips2(i) -6;
    end
end
ytips2 = b(2).XEndPoints;
labels2 = string(round(b(2).YData,1));
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips1 = b(3).YEndPoints + 0.3;
for i=1:7
    if (xtips1(i)<0)
        xtips1(i) = xtips1(i) -6;
    end
end
ytips1 = b(3).XEndPoints;
labels1 = string(round(b(3).YData,1));
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(4).YEndPoints + 0.3;
for i=1:7
    if (xtips2(i)<0)
        xtips2(i) = xtips2(i) -6;
    end
end
ytips2 = b(4).XEndPoints;
labels2 = string(round(b(4).YData,1));
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips1 = b(5).YEndPoints + 0.3;
for i=1:7
    if (xtips1(i)<0)
        xtips1(i) = xtips1(i) -6;
    end
end
ytips1 = b(5).XEndPoints;
labels1 =string(round(b(5).YData,1));
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(6).YEndPoints + 0.3;
for i=1:7
    if (xtips2(i)<0)
        xtips2(i) = xtips2(i) -6;
    end
end
ytips2 = b(6).XEndPoints;
labels2 = string(round(b(6).YData,1));
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips2 = b(7).YEndPoints + 0.3
for i=1:7
    if (xtips2(i)<0)
        xtips2(i) = xtips2(i) -6;
    end
end
    
ytips2 = b(7).XEndPoints;
labels2 = string(round(b(7).YData,1));
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')



%-----label memory

xtips1 = b(7).YEndPoints + 0.3;
for i=1:7
    if (xtips1(i)<0)
        xtips1(i) = 0+ 0.3;
    elseif (xtips1(i)>0)
        xtips1(i) = -8;
    end
end
ytips1 = b(7).XEndPoints;
labels1 = '512 MB';
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(6).YEndPoints + 0.3;
for i=1:7
    if (xtips2(i)<0)
        xtips2(i) = 0+ 0.3;
    elseif (xtips2(i)>0)
        xtips2(i) = -8;
    end
end
ytips2 = b(6).XEndPoints;
labels2 = '458 MB';
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips1 = b(5).YEndPoints + 0.3;
for i=1:7
    if (xtips1(i)<0)
        xtips1(i) = 0+ 0.3;
    elseif (xtips1(i)>0)
        xtips1(i) = -8;
    end
end
ytips1 = b(5).XEndPoints;
labels1 = '384 MB';
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(4).YEndPoints + 0.3;
for i=1:7
    if (xtips2(i)<0)
        xtips2(i) = 0+ 0.3;
    elseif (xtips2(i)>0)
        xtips2(i) = -8;
    end
end
ytips2 = b(4).XEndPoints;
labels2 = '320 MB';
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips1 = b(3).YEndPoints + 0.3;
for i=1:7
    if (xtips1(i)<0)
        xtips1(i) = 0+ 0.3;
    elseif (xtips1(i)>0)
        xtips1(i) = -8;
    end
end
ytips1 = b(3).XEndPoints;
labels1 = '256 MB';
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(2).YEndPoints + 0.3;
for i=1:7
    if (xtips2(i)<0)
        xtips2(i) = 0+ 0.3;
    elseif (xtips2(i)>0)
        xtips2(i) = -8;
    end
end
ytips2 = b(2).XEndPoints;
labels2 = '192 MB';
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips2 = b(1).YEndPoints + 0.3;
for i=1:7
    if (xtips2(i)<0)
        xtips2(i) = 0+ 0.3;
    elseif (xtips2(i)>0)
        xtips2(i) = -8;
    end
end
    
ytips2 = b(1).XEndPoints;
labels2 = '128 MB';
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')





b(1).FaceColor = [ 20 20 20]/255; 
b(2).FaceColor =      [47 79 79] / 255;
b(3).FaceColor  =      [112 128 144] / 255;
b(4).FaceColor  =      [105 105 105] / 255;
b(5).FaceColor  =      [169 169 169] / 255;
b(6).FaceColor    =    [192 192 192] / 255;
b(7).FaceColor   =     [220 220 220] / 255;


ax = gca;
%ax.XGrid = 'on';
ax.YGrid = 'on';


set(gca, 'YTickLabel',{'Factorial','Resize','Resize and Feature','TensorFlow', 'OpenCV', 'Linear regression', 'Image Classifier 230', },'FontSize',15,'TickLength',[0 0])
%set(gca,'XTick',binranges)

set(gca,'xtick',(-30:10:100),'FontSize',15)
xlim([-40, 90]);

title('Cold Start Improvement of The Image Container (Average)','FontSize',18);
%ylabel('Savings (%)','FontSize',18);
xlabel('Improvement (%)','FontSize',18);
%legend({'Factorial','Resize','Resize and Feature','TensorFlow', 'openCV', 'Linear Regresion', 'Image Classifier 230'})

f1.Position = [0 0 1200 700]; 
print('BarPlotRange','-depsc')



