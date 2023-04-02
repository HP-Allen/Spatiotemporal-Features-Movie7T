clear
clc

% FC
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/ROILevel/MovieDay1_GM_ROILevel');

image_dim = size(MovieDay1_GM_ROILevel);

for subi = 1:image_dim(1)
    tic
    disp(['Now running sub' num2str(subi) '......']);
    
    sFC_MovieDay1(subi,:,:) = corr(squeeze(MovieDay1_GM_ROILevel(subi,:,:))',squeeze(MovieDay1_GM_ROILevel(subi,:,:))');
   
    toc
end


sFC_MovieDay1_ave = squeeze(tanh(mean(atanh(sFC_MovieDay1),1)));

ex = 10;

Input = zeros(size(sFC_MovieDay1_ave,1)+ex,size(sFC_MovieDay1_ave,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = sFC_MovieDay1_ave;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([-0.4 1]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = [15,48,71,87,108,128,168];x1 = ones(201,size(tmp1,2)); x1 = x1.*tmp1;
tmp = 1:201; y1 = ones(201,size(tmp1,2)); y1 = y1.*tmp';
plot(x1+ex-1,y1,'k','LineWidth',1.5);
hold on;
plot(y1+ex,x1,'k','LineWidth',1.5);
hold on;

% Draw lines to show networks
tmp2 = [0,15,48,71,87,108,128,168,200];
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/FC/ROILevel/sFC_MovieDay1_ave.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/FC/ROILevel/sFC_MovieDay1_ave.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GM/FC/ROILevel/sFC_MovieDay1','sFC_MovieDay1');
save('/home/brain/HuPeng_Project/Analysis/GM/FC/ROILevel/sFC_MovieDay1_ave','sFC_MovieDay1_ave');




