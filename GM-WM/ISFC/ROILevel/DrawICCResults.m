clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_sISFC_Movie_GMandWM','ICC_sISFC_Movie_GMandWM');
ex = 10;

Input = zeros(size(ICC_sISFC_Movie_GMandWM,1)+ex,size(ICC_sISFC_Movie_GMandWM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_sISFC_Movie_GMandWM;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0 0.3]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = [1,15,48,71,87,108,128,168,201];x1 = ones(201,size(tmp1,2)); x1 = x1.*tmp1;
tmp = 1:201; y1 = ones(201,size(tmp1,2)); y1 = y1.*tmp';
plot(y1+ex-1,x1,'k','LineWidth',1.5);
hold on;

tmp3 = [1,34,66,79,103,112,125,159,180,201];x2 = ones(201,size(tmp3,2)); x2 = x2.*tmp3;
tmp4 = 1:201; y2 = ones(201,size(tmp3,2)); y2 = y2.*tmp4';
plot(x2+ex-1,y2,'k','LineWidth',1.5);

% Draw lines to show networks
tmp5 = [0,15,48,71,87,108,128,168,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp5)
    y3 = tmp5(iter-1)+1:tmp5(iter);
    x3 = ones(1,size(y3,2));
    plot(x3,y3,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

% Draw lines to show networks
tmp6 = [0,34,66,79,103,112,125,159,180,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp6)
    y4 = tmp6(iter-1)+1:tmp6(iter);
    x4 = ones(1,size(y4,2));
    plot(y4+ex,x4*200+ex,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_sISFC_Movie_GMandWM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_sISFC_Movie_GMandWM.fig');
close all;



clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_sISFC_Rest_GMandWM','ICC_sISFC_Rest_GMandWM');
ex = 10;

Input = zeros(size(ICC_sISFC_Rest_GMandWM,1)+ex,size(ICC_sISFC_Rest_GMandWM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_sISFC_Rest_GMandWM;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0 0.3]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = [1,15,48,71,87,108,128,168,201];x1 = ones(201,size(tmp1,2)); x1 = x1.*tmp1;
tmp = 1:201; y1 = ones(201,size(tmp1,2)); y1 = y1.*tmp';
plot(y1+ex-1,x1,'k','LineWidth',1.5);
hold on;

tmp3 = [1,34,66,79,103,112,125,159,180,201];x2 = ones(201,size(tmp3,2)); x2 = x2.*tmp3;
tmp4 = 1:201; y2 = ones(201,size(tmp3,2)); y2 = y2.*tmp4';
plot(x2+ex-1,y2,'k','LineWidth',1.5);

% Draw lines to show networks
tmp5 = [0,15,48,71,87,108,128,168,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp5)
    y3 = tmp5(iter-1)+1:tmp5(iter);
    x3 = ones(1,size(y3,2));
    plot(x3,y3,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

% Draw lines to show networks
tmp6 = [0,34,66,79,103,112,125,159,180,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp6)
    y4 = tmp6(iter-1)+1:tmp6(iter);
    x4 = ones(1,size(y4,2));
    plot(y4+ex,x4*200+ex,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_sISFC_Rest_GMandWM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_sISFC_Rest_GMandWM.fig');
close all;







clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_dISFC_Movie_GMandWM','ICC_dISFC_Movie_GMandWM');
ex = 10;

Input = zeros(size(ICC_dISFC_Movie_GMandWM,1)+ex,size(ICC_dISFC_Movie_GMandWM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_dISFC_Movie_GMandWM;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0 0.15]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = [1,15,48,71,87,108,128,168,201];x1 = ones(201,size(tmp1,2)); x1 = x1.*tmp1;
tmp = 1:201; y1 = ones(201,size(tmp1,2)); y1 = y1.*tmp';
plot(y1+ex-1,x1,'k','LineWidth',1.5);
hold on;

tmp3 = [1,34,66,79,103,112,125,159,180,201];x2 = ones(201,size(tmp3,2)); x2 = x2.*tmp3;
tmp4 = 1:201; y2 = ones(201,size(tmp3,2)); y2 = y2.*tmp4';
plot(x2+ex-1,y2,'k','LineWidth',1.5);

% Draw lines to show networks
tmp5 = [0,15,48,71,87,108,128,168,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp5)
    y3 = tmp5(iter-1)+1:tmp5(iter);
    x3 = ones(1,size(y3,2));
    plot(x3,y3,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

% Draw lines to show networks
tmp6 = [0,34,66,79,103,112,125,159,180,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp6)
    y4 = tmp6(iter-1)+1:tmp6(iter);
    x4 = ones(1,size(y4,2));
    plot(y4+ex,x4*200+ex,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_dISFC_Movie_GMandWM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_dISFC_Movie_GMandWM.fig');
close all;



clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_dISFC_Rest_GMandWM','ICC_dISFC_Rest_GMandWM');
ex = 10;

Input = zeros(size(ICC_dISFC_Rest_GMandWM,1)+ex,size(ICC_dISFC_Rest_GMandWM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_dISFC_Rest_GMandWM;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0 0.15]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = [1,15,48,71,87,108,128,168,201];x1 = ones(201,size(tmp1,2)); x1 = x1.*tmp1;
tmp = 1:201; y1 = ones(201,size(tmp1,2)); y1 = y1.*tmp';
plot(y1+ex-1,x1,'k','LineWidth',1.5);
hold on;

tmp3 = [1,34,66,79,103,112,125,159,180,201];x2 = ones(201,size(tmp3,2)); x2 = x2.*tmp3;
tmp4 = 1:201; y2 = ones(201,size(tmp3,2)); y2 = y2.*tmp4';
plot(x2+ex-1,y2,'k','LineWidth',1.5);

% Draw lines to show networks
tmp5 = [0,15,48,71,87,108,128,168,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp5)
    y3 = tmp5(iter-1)+1:tmp5(iter);
    x3 = ones(1,size(y3,2));
    plot(x3,y3,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

% Draw lines to show networks
tmp6 = [0,34,66,79,103,112,125,159,180,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp6)
    y4 = tmp6(iter-1)+1:tmp6(iter);
    x4 = ones(1,size(y4,2));
    plot(y4+ex,x4*200+ex,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_dISFC_Rest_GMandWM.png');
saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/ROILevel/ICC_dISFC_Rest_GMandWM.fig');
close all;


