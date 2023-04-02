clear;
clc;

load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/sFC_MovieDay1','sFC_MovieDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/sFC_RestDay1','sFC_RestDay1');

matrix_size = size(sFC_MovieDay1);

sFC_MovieDay1_z = atanh(sFC_MovieDay1);
sFC_RestDay1_z = atanh(sFC_RestDay1);

% pair-T
[h,p,ci,stats] = ttest(sFC_MovieDay1_z,sFC_RestDay1_z);
t = squeeze(stats.tstat);
p = squeeze(p);

ex = 10;
Input = zeros(size(t,1)+ex,size(t,2)+ex)-5;
Input(1:200,1+ex:200+ex) = t;

% Bonferroni
thres = zeros(size(Input,1),size(Input,2));
thres(1:200,1+ex:200+ex) = p < 0.05/(matrix_size(2)*matrix_size(3));

% White background color
ax1 = axes;
imagesc(Input,'alphadata',thres==0);
colormap(ax1,'white');
axis off;

% PairT figure
ax2 = axes;
imagesc(Input,'alphadata',thres==1);
colormap(ax2,'jet');
axis off;

% Link these two figure
linkprop([ax1 ax2],'Position');
colorbar;
hold on;

% Draw lines to separate networks
tmp1 = [1,34,66,79,103,112,125,159,180,201];x = ones(201,size(tmp1,2)); x = x.*tmp1;
tmp = 1:201; y = ones(201,size(tmp1,2)); y = y.*tmp';
plot(x+ex-1,y,'k','LineWidth',1.5);
hold on;
plot(y+ex,x,'k','LineWidth',1.5);

% Draw lines to show networks
tmp2 = [0,34,66,79,103,112,125,159,180,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp2)
    y2 = tmp2(iter-1)+1:tmp2(iter);
    x2 = ones(1,size(y2,2));
    plot(x2,y2,'Color',colors(iter-1,:),'LineWidth',ex);
    plot(y2+ex,x2*200+ex,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/sFC_pairT.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/sFC_pairT.fig');
close;


clear;
clc;

load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/dFC_MovieDay1','dFC_MovieDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/dFC_RestDay1','dFC_RestDay1');

matrix_size = size(dFC_MovieDay1);

% pair-T
[h,p,ci,stats] = ttest(dFC_MovieDay1,dFC_RestDay1);
t = squeeze(stats.tstat);
p = squeeze(p);

ex = 10;
Input = zeros(size(t,1)+ex,size(t,2)+ex)-5;
Input(1:200,1+ex:200+ex) = t;

% Bonferroni
thres = zeros(size(Input,1),size(Input,2));
thres(1:200,1+ex:200+ex) = p < 0.05/(matrix_size(2)*matrix_size(3));

% White background color
ax1 = axes;
imagesc(Input,'alphadata',thres==0);
colormap(ax1,'white');
axis off;

% PairT figure
ax2 = axes;
imagesc(Input,'alphadata',thres==1);
colormap(ax2,'jet');
axis off;

% Link these two figure
linkprop([ax1 ax2],'Position');
colorbar;
hold on;

% Draw lines to separate networks
tmp1 = [1,34,66,79,103,112,125,159,180,201];x = ones(201,size(tmp1,2)); x = x.*tmp1;
tmp = 1:201; y = ones(201,size(tmp1,2)); y = y.*tmp';
plot(x+ex-1,y,'k','LineWidth',1.5);
hold on;
plot(y+ex,x,'k','LineWidth',1.5);

% Draw lines to show networks
tmp2 = [0,34,66,79,103,112,125,159,180,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp2)
    y2 = tmp2(iter-1)+1:tmp2(iter);
    x2 = ones(1,size(y2,2));
    plot(x2,y2,'Color',colors(iter-1,:),'LineWidth',ex);
    plot(y2+ex,x2*200+ex,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/dFC_pairT.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/dFC_pairT.fig');
close;


