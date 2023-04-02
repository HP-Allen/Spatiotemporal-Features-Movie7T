clear
clc

% GM
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/ROILevel/MovieDay2_GM_ROILevel','MovieDay2_GM_ROILevel');

% WM
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/ROILevel/MovieDay2_WM_ROILevel','MovieDay2_WM_ROILevel');

image_dim = size(MovieDay2_GM_ROILevel);

for subi = 1:image_dim(1)
    tic
    disp(['Now running sub' num2str(subi) '......']);
    
    sFC_MovieDay2(subi,:,:) = corr(squeeze(MovieDay2_GM_ROILevel(subi,:,:))',squeeze(MovieDay2_WM_ROILevel(subi,:,:))');
   
    toc
end


sFC_MovieDay2_ave = squeeze(tanh(mean(atanh(sFC_MovieDay2),1)));

ex = 10;

Input = zeros(size(sFC_MovieDay2_ave,1)+ex,size(sFC_MovieDay2_ave,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = sFC_MovieDay2_ave;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([-0.4 0.8]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = [15,48,71,87,108,128,168];x1 = ones(201,size(tmp1,2)); x1 = x1.*tmp1;
tmp = 1:201; y1 = ones(201,size(tmp1,2)); y1 = y1.*tmp';
plot(y1+ex,x1,'k','LineWidth',1.5);
hold on;

tmp3 = [34,66,79,103,112,125,159,180];x2 = ones(201,size(tmp3,2)); x2 = x2.*tmp3;
tmp4 = 1:201; y2 = ones(201,size(tmp3,2)); y2 = y2.*tmp4';
plot(x2+ex,y2,'k','LineWidth',1.5);

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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/ROILevel/sFC_MovieDay2_ave.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/ROILevel/sFC_MovieDay2_ave.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/ROILevel/sFC_MovieDay2','sFC_MovieDay2');
save('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/ROILevel/sFC_MovieDay2_ave','sFC_MovieDay2_ave');




