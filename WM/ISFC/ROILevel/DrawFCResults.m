clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/sISFC_MovieDay1_r','sISFC_MovieDay1_r');
ex = 10;

Input = zeros(size(sISFC_MovieDay1_r,1)+ex,size(sISFC_MovieDay1_r,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = sISFC_MovieDay1_r;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([-0.2 0.4]);
colormap(hot);
axis off;
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/sISFC_MovieDay1_r.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/sISFC_MovieDay1_r.fig');
close all;



clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/sISFC_RestDay1_r','sISFC_RestDay1_r');
ex = 10;

Input = zeros(size(sISFC_RestDay1_r,1)+ex,size(sISFC_RestDay1_r,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = sISFC_RestDay1_r;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([-0.2 0.4]);
colormap(hot);
axis off;
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/sISFC_RestDay1_r.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/sISFC_RestDay1_r.fig');
close all;







clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/dISFC_MovieDay1','dISFC_MovieDay1');
ex = 10;

Input = zeros(size(dISFC_MovieDay1,1)+ex,size(dISFC_MovieDay1,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = dISFC_MovieDay1;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0.41 0.44]);
colormap(hot);
axis off;
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/dISFC_MovieDay1.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/dISFC_MovieDay1.fig');
close all;



clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/dISFC_RestDay1','dISFC_RestDay1');
ex = 10;

Input = zeros(size(dISFC_RestDay1,1)+ex,size(dISFC_RestDay1,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = dISFC_RestDay1;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0.41 0.44]);
colormap(hot);
axis off;
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/dISFC_RestDay1.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/dISFC_RestDay1.fig');
close all;


