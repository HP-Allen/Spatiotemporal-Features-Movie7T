clear
clc

load('/home/brain/HuPeng_Project/Analysis/WM/ISFC/ROILevel/sISFC_subpair_RestDay1_r');
load('/home/brain/HuPeng_Project/Analysis/WM/ISFC/ROILevel/sISFC_subpair_RestDay2_r');

dim = size(sISFC_subpair_RestDay1_r);

type='1-1';
for neti = 1:dim(3)
    for netj = 1:neti
        tmp = diag(diag(ones(dim(1),dim(2))));
        tmp = reshape(tmp,dim(1)*dim(2),1);
        a = reshape(sISFC_subpair_RestDay1_r(:,:,neti,netj),dim(1)*dim(2),1);
        b = reshape(sISFC_subpair_RestDay2_r(:,:,neti,netj),dim(1)*dim(2),1);
        a(tmp==1) = []; b(tmp==1) = [];
        M = [a,b];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_sISFC_Rest_WM(neti,netj) = r;
    end
end

ICC_sISFC_Rest_WM = ICC_sISFC_Rest_WM+transpose(tril(ICC_sISFC_Rest_WM,-1));

ex = 10;

Input = zeros(size(ICC_sISFC_Rest_WM,1)+ex,size(ICC_sISFC_Rest_WM,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = ICC_sISFC_Rest_WM;

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


saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/ROILevel/ICC_sISFC_Rest_WM.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/ROILevel/ICC_sISFC_Rest_WM.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/ROILevel/ICC_sISFC_Rest_WM','ICC_sISFC_Rest_WM');



