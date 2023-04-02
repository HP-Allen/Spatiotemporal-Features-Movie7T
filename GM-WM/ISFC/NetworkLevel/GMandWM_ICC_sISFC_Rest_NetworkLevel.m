clear
clc

load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_subpair_RestDay1_r');
load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_subpair_RestDay2_r');

dim = size(sISFC_subpair_RestDay1_r);

type='1-1';
for neti = 1:dim(3)
    for netj = 1:dim(4)
        tmp = diag(diag(ones(dim(1),dim(2))));
        tmp = reshape(tmp,dim(1)*dim(2),1);
        a = reshape(sISFC_subpair_RestDay1_r(:,:,neti,netj),dim(1)*dim(2),1);
        b = reshape(sISFC_subpair_RestDay2_r(:,:,neti,netj),dim(1)*dim(2),1);
        a(tmp==1) = []; b(tmp==1) = [];
        M = [a,b];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_sISFC_Rest_GMandWM(neti,netj) = r;
    end
end

% Draw matrix
imagesc(ICC_sISFC_Rest_GMandWM);
colorbar;
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(size(tmp1,2),size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp2 = 0:9; y1 = ones(size(tmp2,2),size(tmp2,2)); y1 = y1.*tmp2'+0.5;
tmp3 = 0:9;x2 = ones(size(tmp3,2),size(tmp3,2)); x2 = x2.*tmp3+0.5;
tmp4 = 0:9; y2 = ones(size(tmp4,2),size(tmp4,2)); y2 = y2.*tmp4'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y2,x2,'k','LineWidth',1.5);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/ICC_sISFC_Rest_GMandWM.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/ICC_sISFC_Rest_GMandWM.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/ICC_sISFC_Rest_GMandWM','ICC_sISFC_Rest_GMandWM');



