python_image = 704.9;
python_image_95 = 726.55;
python_zip = 644.8195;
python_zip_95 = 670.368;

node_image = 257;
node_image_95 = 334.55;
node_zip = 180.733;
node_zip_95 = 199.264;

java_image =855.2;
java_image_95 = 967.85;
java_zip =793.9235;
java_zip_95 = 931.0505

m = [node_image python_image java_image];
m_95 = [node_image_95 python_image_95 java_image_95];




f1 = figure;
yyaxis left
X = categorical({'Node.js','Python','Java'});
X = reordercats(X,{'Node.js','Python','Java'});
b = bar(X,m_95, 0.5);
hold on

%-----label value


b.FaceColor = 'flat';

b.CData(1,:) = [ 20 20 20]/255; 
b.CData(2,:) =      [47 79 79] / 255;
b.CData(3,:)  =      [112 128 144] / 255;



ax = gca;
ax.XGrid = 'on';

set(gca,'FontSize',15,'YColor','k','TickLength',[0 0])



title('Container-based Deployment (128MB)','FontSize',18);
xlabel('Runtime','FontSize',18);
ylabel('Cold Start (ms)','FontSize',18);
ylim([0, 1200]);
yyaxis right
p1 = plot(1:3,m,'-or','MarkerSize',8,'LineWidth',3);
ylim([0, 1200]);
set(gca,'YTickLabel',[],'YColor','k');
a = legend( '95th Percentile','Average');
a.FontSize=14;
set(a,'location','best');


f1.Position = [0 0 400 400]; 
print('factorual','-depsc')


f2 = figure;
yyaxis left

m = [node_zip python_zip java_zip];
m_95 = [node_zip_95 python_zip_95 java_zip_95];

X = categorical({'Node.js','Python','Java'});
X = reordercats(X,{'Node.js','Python','Java'});
b = bar(X,m_95, 0.5);
hold on

%-----label value


b.FaceColor = 'flat';

b.CData(1,:) = [ 20 20 20]/255; 
b.CData(2,:) =      [47 79 79] / 255;
b.CData(3,:)  =      [112 128 144] / 255;



ax = gca;
ax.XGrid = 'on';

set(gca,'FontSize',15,'YColor','k','TickLength',[0 0])



title('ZIP-based Deployment (128MB)','FontSize',18);
xlabel('Runtime','FontSize',18);
ylabel('Cold Start (ms)','FontSize',18);
ylim([0, 1200]);
yyaxis right
p1 = plot(1:3,m,'-or','MarkerSize',8,'LineWidth',3);
ylim([0, 1200]);
set(gca,'YTickLabel',[],'YColor','k');
a = legend( '95th Percentile','Average');
a.FontSize=14;
set(a,'location','best');
f2.Position = [0 0 400 400]; 
print('factorial_zip','-depsc')