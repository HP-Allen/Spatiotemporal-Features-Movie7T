clear
clc

% ISFC
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/ROILevel/RestDay1_WM_ROILevel','RestDay1_WM_ROILevel');

image_dim = size(RestDay1_WM_ROILevel);

for roii = 1:image_dim(2)
    tic
    disp(['Now running ROI' num2str(roii) '......']);
    for roij = 1:image_dim(2)
        
        for step = 1:image_dim(3)-30+1
        	dISFC_series(:,:,step) = corr(squeeze(RestDay1_WM_ROILevel(:,roii,step:step+30-1))',squeeze(RestDay1_WM_ROILevel(:,roij,step:step+30-1))');
        end
        
        dISFC_subpair_RestDay1(:,:,roii,roij) = std(dISFC_series,0,3);

        tmp = ones(image_dim(1),image_dim(1));
        tmp = diag(diag(tmp));
        
        ma = dISFC_subpair_RestDay1(:,:,roii,roij);
        ma(tmp==1) = 0;
        
        sumval = sum(sum(ma));
        num = 171*(1+171)/2 * 2;
        dISFC_RestDay1(roii,roij) = sumval/num;
    end
    toc
end

ex = 10;

Input = zeros(size(dISFC_RestDay1,1)+ex,size(dISFC_RestDay1,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = dISFC_RestDay1;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = [34,66,79,103,112,125,159,180];x = ones(201,size(tmp1,2)); x = x.*tmp1;
tmp = 1:201; y = ones(201,size(tmp1,2)); y = y.*tmp';
plot(x+ex,y,'k','LineWidth',1.5);
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/ROILevel/dISFC_RestDay1.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/ROILevel/dISFC_RestDay1.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/ROILevel/dISFC_subpair_RestDay1','dISFC_subpair_RestDay1');
save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/ROILevel/dISFC_RestDay1','dISFC_RestDay1');
