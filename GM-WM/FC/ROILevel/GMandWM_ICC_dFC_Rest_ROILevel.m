clear
clc

load('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/ROILevel/dFC_RestDay1');
load('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/ROILevel/dFC_RestDay2');

dim = size(dFC_RestDay1);
type='1-1';

for roii = 1:dim(2)
    for roij = 1:dim(2)
        M=[dFC_RestDay1(:,roii,roij),dFC_RestDay2(:,roii,roij)];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_dFC_Rest_GMandWM(roii,roij) = r;
    end
end

ex = 10;

Input = zeros(size(ICC_dFC_Rest_GMandWM,1)+ex,size(ICC_dFC_Rest_GMandWM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_dFC_Rest_GMandWM;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/ROILevel/ICC_dFC_Rest_GMandWM.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/ROILevel/ICC_dFC_Rest_GMandWM.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/ROILevel/ICC_dFC_Rest_GMandWM','ICC_dFC_Rest_GMandWM');

