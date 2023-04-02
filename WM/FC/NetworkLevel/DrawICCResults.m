clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_sFC_Movie_WM','ICC_sFC_Movie_WM');
% Draw matrix
imagesc(ICC_sFC_Movie_WM);
colorbar;
caxis([0.1 0.7]);
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_sFC_Movie_WM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_sFC_Movie_WM.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_sFC_Rest_WM','ICC_sFC_Rest_WM');
% Draw matrix
imagesc(ICC_sFC_Rest_WM);
colorbar;
caxis([0.1 0.7]);
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_sFC_Rest_WM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_sFC_Rest_WM.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_dFC_Movie_WM','ICC_dFC_Movie_WM');
% Draw matrix
imagesc(ICC_dFC_Movie_WM);
colorbar;
caxis([0 0.5]);
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_dFC_Movie_WM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_dFC_Movie_WM.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_dFC_Rest_WM','ICC_dFC_Rest_WM');
% Draw matrix
imagesc(ICC_dFC_Rest_WM);
colorbar;
caxis([0 0.5]);
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_dFC_Rest_WM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_dFC_Rest_WM.fig');
close all;
