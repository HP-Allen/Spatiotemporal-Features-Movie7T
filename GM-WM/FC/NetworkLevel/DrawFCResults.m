clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/sFC_MovieDay1_ave','sFC_MovieDay1_ave');
% Draw matrix
imagesc(sFC_MovieDay1_ave);
colorbar;
caxis([-0.3 0.8]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(size(tmp1,2),size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp2 = 0:9; y1 = ones(size(tmp2,2),size(tmp2,2)); y1 = y1.*tmp2'+0.5;
tmp3 = 0:9;x2 = ones(size(tmp3,2),size(tmp3,2)); x2 = x2.*tmp3+0.5;
tmp4 = 0:9; y2 = ones(size(tmp4,2),size(tmp4,2)); y2 = y2.*tmp4'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y2,x2,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/sFC_MovieDay1_ave.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/sFC_MovieDay1_ave.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/sFC_RestDay1_ave','sFC_RestDay1_ave');
% Draw matrix
imagesc(sFC_RestDay1_ave);
colorbar;
caxis([-0.3 0.8]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(size(tmp1,2),size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp2 = 0:9; y1 = ones(size(tmp2,2),size(tmp2,2)); y1 = y1.*tmp2'+0.5;
tmp3 = 0:9;x2 = ones(size(tmp3,2),size(tmp3,2)); x2 = x2.*tmp3+0.5;
tmp4 = 0:9; y2 = ones(size(tmp4,2),size(tmp4,2)); y2 = y2.*tmp4'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y2,x2,'k','LineWidth',1.5);


set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/sFC_RestDay1_ave.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/sFC_RestDay1_ave.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/dFC_MovieDay1_ave','dFC_MovieDay1_ave');
% Draw matrix
imagesc(dFC_MovieDay1_ave);
colorbar;
caxis([0.3 0.45]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(size(tmp1,2),size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp2 = 0:9; y1 = ones(size(tmp2,2),size(tmp2,2)); y1 = y1.*tmp2'+0.5;
tmp3 = 0:9;x2 = ones(size(tmp3,2),size(tmp3,2)); x2 = x2.*tmp3+0.5;
tmp4 = 0:9; y2 = ones(size(tmp4,2),size(tmp4,2)); y2 = y2.*tmp4'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y2,x2,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/dFC_MovieDay1_ave.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/dFC_MovieDay1_ave.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/dFC_RestDay1_ave','dFC_RestDay1_ave');
% Draw matrix
imagesc(dFC_RestDay1_ave);
colorbar;
caxis([0.3 0.45]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(size(tmp1,2),size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp2 = 0:9; y1 = ones(size(tmp2,2),size(tmp2,2)); y1 = y1.*tmp2'+0.5;
tmp3 = 0:9;x2 = ones(size(tmp3,2),size(tmp3,2)); x2 = x2.*tmp3+0.5;
tmp4 = 0:9; y2 = ones(size(tmp4,2),size(tmp4,2)); y2 = y2.*tmp4'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y2,x2,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/dFC_RestDay1_ave.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/dFC_RestDay1_ave.fig');
close all;
