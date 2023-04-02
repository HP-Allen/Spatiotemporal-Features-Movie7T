clear;
clc;

load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/sFC_MovieDay1','sFC_MovieDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/sFC_RestDay1','sFC_RestDay1');

matrix_size = size(sFC_MovieDay1);

sFC_MovieDay1_z = atanh(sFC_MovieDay1);
sFC_RestDay1_z = atanh(sFC_RestDay1);

% pair-T
[h,p,ci,stats] = ttest(sFC_MovieDay1_z,sFC_RestDay1_z);
t = squeeze(stats.tstat);
p = squeeze(p);

% Bonferroni
thres = p < 0.05/(matrix_size(2)*matrix_size(3));

% White background color
ax1 = axes;
imagesc(t,'alphadata',thres==0);
colormap(ax1,'white');
axis off;

% PairT figure
ax2 = axes;
imagesc(t,'alphadata',thres==1);
colormap(ax2,'jet');
axis on

% Link these two figure
linkprop([ax1 ax2],'Position');
colorbar;

hold on;

% Draw lines to separate networks
tmp1 = 0:8;x1 = ones(9,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:8; y1 = ones(9,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/sFC_pairT.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/sFC_pairT.fig');
close;


clear;
clc;

load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/dFC_MovieDay1','dFC_MovieDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/dFC_RestDay1','dFC_RestDay1');

matrix_size = size(dFC_MovieDay1);

% pair-T
[h,p,ci,stats] = ttest(dFC_MovieDay1,dFC_RestDay1);
t = squeeze(stats.tstat);
p = squeeze(p);

% Bonferroni
thres = p < 0.05/(matrix_size(2)*matrix_size(3));

% White background color
ax1 = axes;
imagesc(t,'alphadata',thres==0);
colormap(ax1,'white');
axis off;

% PairT figure
ax2 = axes;
imagesc(t,'alphadata',thres==1);
colormap(ax2,'jet');
axis off;

% Link these two figure
linkprop([ax1 ax2],'Position');
colorbar;

hold on;

% Draw lines to separate networks
tmp1 = 0:8;x1 = ones(9,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:8; y1 = ones(9,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/dFC_pairT.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/dFC_pairT.fig');
close;


