
node1 = [-0.42198713
-0.463429838
-0.497402523
-0.505704111
-0.394605494
-0.368467026
-0.476964333];

node2 = [0.0560442
0.010580917
0.054104631
-0.007924845
-0.021493135
-0.252143974
-0.241802624];

node3 = [0.059472534
-0.065604813
-0.016024974
-0.004294585
-0.00845766
0.074576487
-0.012733616];



y = [node1';node2';node3'];
%y = [factorial';resize']

% plot cold start
f1 = figure;
x = [128 192 256];

b = barh(y*100,'facecolor', 'flat')
hold on

%-----label value

xtips1 = b(1).YEndPoints + 0.3;
for i=1:3
    if (xtips1(i)<0)
        xtips1(i) = xtips1(i) -2.5;
    end
end
ytips1 = b(1).XEndPoints;
labels1 = string(round(b(1).YData,1));
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(2).YEndPoints + 0.3;
for i=1:3
    if (xtips2(i)<0)
        xtips2(i) = xtips2(i) -2.5;
    end
end
ytips2 = b(2).XEndPoints;
labels2 = string(round(b(2).YData,1));
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips1 = b(3).YEndPoints + 0.3;
for i=1:3
    if (xtips1(i)<0)
        xtips1(i) = xtips1(i) -2.5;
    end
end
ytips1 = b(3).XEndPoints;
labels1 = string(round(b(3).YData,1));
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(4).YEndPoints + 0.3;
for i=1:3
    if (xtips2(i)<0)
        xtips2(i) = xtips2(i) -2.5;
    end
end
ytips2 = b(4).XEndPoints;
labels2 = string(round(b(4).YData,1));
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips1 = b(5).YEndPoints + 0.3;
for i=1:3
    if (xtips1(i)<0)
        xtips1(i) = xtips1(i) -2.5;
    end
end
ytips1 = b(5).XEndPoints;
labels1 =string(round(b(5).YData,1));
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(6).YEndPoints + 0.3;
for i=1:3
    if (xtips2(i)<0)
        xtips2(i) = xtips2(i) -2.5;
    end
end
ytips2 = b(6).XEndPoints;
labels2 = string(round(b(6).YData,1));
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips2 = b(7).YEndPoints + 0.3
for i=1:3
    if (xtips2(i)<0)
        xtips2(i) = xtips2(i) -2.5;
    end
end
    
ytips2 = b(7).XEndPoints;
labels2 = string(round(b(7).YData,1));
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')



%-----label memory

xtips1 = b(7).YEndPoints + 0.3;
for i=1:3
    if (xtips1(i)<0)
        xtips1(i) = 0+ 0.3;
    elseif (xtips1(i)>0)
        xtips1(i) = -3.5;
    end
end
ytips1 = b(7).XEndPoints;
labels1 = '512 MB';
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(6).YEndPoints + 0.3;
for i=1:3
    if (xtips2(i)<0)
        xtips2(i) = 0+ 0.3;
    elseif (xtips2(i)>0)
        xtips2(i) = -3.5;
    end
end
ytips2 = b(6).XEndPoints;
labels2 = '458 MB';
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips1 = b(5).YEndPoints + 0.3;
for i=1:3
    if (xtips1(i)<0)
        xtips1(i) = 0+ 0.3;
    elseif (xtips1(i)>0)
        xtips1(i) = -3.5;
    end
end
ytips1 = b(5).XEndPoints;
labels1 = '384 MB';
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(4).YEndPoints + 0.3;
for i=1:3
    if (xtips2(i)<0)
        xtips2(i) = 0+ 0.3;
    elseif (xtips2(i)>0)
        xtips2(i) = -3.5;
    end
end
ytips2 = b(4).XEndPoints;
labels2 = '320 MB';
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips1 = b(3).YEndPoints + 0.3;
for i=1:3
    if (xtips1(i)<0)
        xtips1(i) = 0+ 0.3;
    elseif (xtips1(i)>0)
        xtips1(i) = -3.5;
    end
end
ytips1 = b(3).XEndPoints;
labels1 = '256 MB';
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')

xtips2 = b(2).YEndPoints + 0.3;
for i=1:3
    if (xtips2(i)<0)
        xtips2(i) = 0+ 0.3;
    elseif (xtips2(i)>0)
        xtips2(i) = -3.5;
    end
end
ytips2 = b(2).XEndPoints;
labels2 = '192 MB';
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')

xtips2 = b(1).YEndPoints + 0.3;
for i=1:3
    if (xtips2(i)<0)
        xtips2(i) = 0+ 0.3;
    elseif (xtips2(i)>0)
        xtips2(i) = -3.5;
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
ax.YGrid = 'on';


set(gca, 'YTickLabel',{'Factorial','Mid size','Large Size', },'FontSize',15,'TickLength',[0 0])

set(gca,'xtick',(-60:10:20),'FontSize',15)
xlim([-60, 20]);

title('Cold Start Improvement of The Image Container NodeJS (Average)','FontSize',18);
xlabel('Improvement (%)','FontSize',18);

f1.Position = [0 0 1200 700]; 
print('node_all','-depsc')




