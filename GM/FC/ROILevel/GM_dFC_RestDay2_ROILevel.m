clear
clc

% FC
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/ROILevel/RestDay2_GM_ROILevel');

image_dim = size(RestDay2_GM_ROILevel);

for subi = 1:image_dim(1)
    tic
    disp(['Now running sub' num2str(subi) '......']);
    
    for step = 1:image_dim(3)-30+1
        dFC_series(subi,:,:,step) = corr(squeeze(RestDay2_GM_ROILevel(subi,:,step:step+30-1))', squeeze(RestDay2_GM_ROILevel(subi,:,step:step+30-1))');
    end
            
    for roii = 1:image_dim(2)
        for roij = 1:image_dim(2)
            dFC_RestDay2(subi,roii,roij) = std(dFC_series(subi,roii,roij,:));
        end
    end
    
    toc
end


dFC_RestDay2_ave = squeeze(mean(dFC_RestDay2,1));

ex = 10;

Input = zeros(size(dFC_RestDay2_ave,1)+ex,size(dFC_RestDay2_ave,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = dFC_RestDay2_ave;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
caxis([0 0.5]);
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/FC/ROILevel/dFC_RestDay2_ave.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/FC/ROILevel/dFC_RestDay2_ave.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GM/FC/ROILevel/dFC_RestDay2','dFC_RestDay2');
save('/home/brain/HuPeng_Project/Analysis/GM/FC/ROILevel/dFC_RestDay2_ave','dFC_RestDay2_ave');




