clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/sFC_MovieDay1_ave','sFC_MovieDay1_ave');
% Draw matrix
imagesc(sFC_MovieDay1_ave);
colorbar;
caxis([-0.1 0.5]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/sFC_MovieDay1_ave.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/sFC_MovieDay1_ave.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/sFC_RestDay1_ave','sFC_RestDay1_ave');
% Draw matrix
imagesc(sFC_RestDay1_ave);
colorbar;
caxis([-0.1 0.5]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/sFC_RestDay1_ave.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/sFC_RestDay1_ave.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/dFC_MovieDay1_ave','dFC_MovieDay1_ave');
% Draw matrix
imagesc(dFC_MovieDay1_ave);
colorbar;
caxis([0.25 0.45]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/dFC_MovieDay1_ave.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/dFC_MovieDay1_ave.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/dFC_RestDay1_ave','dFC_RestDay1_ave');
% Draw matrix
imagesc(dFC_RestDay1_ave);
colorbar;
caxis([0.25 0.45]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/dFC_RestDay1_ave.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/dFC_RestDay1_ave.fig');
close all;
