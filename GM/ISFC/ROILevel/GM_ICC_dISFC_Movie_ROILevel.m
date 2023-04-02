clear
clc

load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dISFC_subpair_MovieDay1');
load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dISFC_subpair_MovieDay2');

dim = size(dISFC_subpair_MovieDay1);

type='1-1';
for roii = 1:dim(3)
    for roij = 1:roii
        tmp = diag(diag(ones(dim(1),dim(2))));
        tmp = reshape(tmp,dim(1)*dim(2),1);
        a = reshape(dISFC_subpair_MovieDay1(:,:,roii,roij),dim(1)*dim(2),1);
        b = reshape(dISFC_subpair_MovieDay2(:,:,roii,roij),dim(1)*dim(2),1);
        a(tmp==1) = []; b(tmp==1) = [];
        M = [a,b];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_dISFC_Movie_GM(roii,roij) = r;
    end
end

ICC_dISFC_Movie_GM = ICC_dISFC_Movie_GM+transpose(tril(ICC_dISFC_Movie_GM,-1));

ex = 10;

Input = zeros(size(ICC_dISFC_Movie_GM,1)+ex,size(ICC_dISFC_Movie_GM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_dISFC_Movie_GM;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
colormap(hot);
axis off;
hold on;

% Draw lines to separate roiworks
tmp1 = [15,48,71,87,108,128,168];x1 = ones(201,size(tmp1,2)); x1 = x1.*tmp1;
tmp = 1:201; y1 = ones(201,size(tmp1,2)); y1 = y1.*tmp';
plot(x1+ex-1,y1,'k','LineWidth',1.5);
hold on;
plot(y1+ex,x1,'k','LineWidth',1.5);
hold on;

% Draw lines to show roiworks
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


saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/ICC_dISFC_Movie_GM.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/ICC_dISFC_Movie_GM.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/ICC_dISFC_Movie_GM','ICC_dISFC_Movie_GM');



