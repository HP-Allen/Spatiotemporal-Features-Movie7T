clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_sFC_Movie_GM','ICC_sFC_Movie_GM');
% Draw matrix
imagesc(ICC_sFC_Movie_GM);
colorbar;
caxis([0.1 0.7]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:8;x1 = ones(9,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:8; y1 = ones(9,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_sFC_Movie_GM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_sFC_Movie_GM.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_sFC_Rest_GM','ICC_sFC_Rest_GM');
% Draw matrix
imagesc(ICC_sFC_Rest_GM);
colorbar;
caxis([0.1 0.7]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:8;x1 = ones(9,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:8; y1 = ones(9,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_sFC_Rest_GM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_sFC_Rest_GM.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_dFC_Movie_GM','ICC_dFC_Movie_GM');
% Draw matrix
imagesc(ICC_dFC_Movie_GM);
colorbar;
caxis([-0.1 0.5]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:8;x1 = ones(9,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:8; y1 = ones(9,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_dFC_Movie_GM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_dFC_Movie_GM.fig');
close all;


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_dFC_Rest_GM','ICC_dFC_Rest_GM');
% Draw matrix
imagesc(ICC_dFC_Rest_GM);
colorbar;
caxis([-0.1 0.5]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:8;x1 = ones(9,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:8; y1 = ones(9,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_dFC_Rest_GM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_dFC_Rest_GM.fig');
close all;