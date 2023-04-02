clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_sISFC_Movie_WM','ICC_sISFC_Movie_WM');
ex = 10;

Input = zeros(size(ICC_sISFC_Movie_WM,1)+ex,size(ICC_sISFC_Movie_WM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_sISFC_Movie_WM;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0 0.3]);
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_sISFC_Movie_WM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_sISFC_Movie_WM.fig');
close all;



clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_sISFC_Rest_WM','ICC_sISFC_Rest_WM');
ex = 10;

Input = zeros(size(ICC_sISFC_Rest_WM,1)+ex,size(ICC_sISFC_Rest_WM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_sISFC_Rest_WM;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0 0.3]);
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_sISFC_Rest_WM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_sISFC_Rest_WM.fig');
close all;







clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_dISFC_Movie_WM','ICC_dISFC_Movie_WM');
ex = 10;

Input = zeros(size(ICC_dISFC_Movie_WM,1)+ex,size(ICC_dISFC_Movie_WM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_dISFC_Movie_WM;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0 0.15]);
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_dISFC_Movie_WM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_dISFC_Movie_WM.fig');
close all;



clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_dISFC_Rest_WM','ICC_dISFC_Rest_WM');
ex = 10;

Input = zeros(size(ICC_dISFC_Rest_WM,1)+ex,size(ICC_dISFC_Rest_WM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_dISFC_Rest_WM;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0 0.15]);
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

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_dISFC_Rest_WM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/WM/ISFC/ROILevel/ICC_dISFC_Rest_WM.fig');
close all;


