clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/sISFC_MovieDay1_r','sISFC_MovieDay1_r');
% Draw matrix
imagesc(sISFC_MovieDay1_r);
colorbar;
caxis([-0.1 0.2]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/sISFC_MovieDay1_r.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/sISFC_MovieDay1_r.fig');
close all;



clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/sISFC_RestDay1_r','sISFC_RestDay1_r');
% Draw matrix
imagesc(sISFC_RestDay1_r);
colorbar;
caxis([-0.1 0.2]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/sISFC_RestDay1_r.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/sISFC_RestDay1_r.fig');
close all;







clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/dISFC_MovieDay1','dISFC_MovieDay1');
% Draw matrix
imagesc(dISFC_MovieDay1);
colorbar;
caxis([0.4 0.44]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/dISFC_MovieDay1.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/dISFC_MovieDay1.fig');
close all;



clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/dISFC_RestDay1','dISFC_RestDay1');
% Draw matrix
imagesc(dISFC_RestDay1);
colorbar;
caxis([0.4 0.44]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/dISFC_RestDay1.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/NetworkLevel/dISFC_RestDay1.fig');
close all;


