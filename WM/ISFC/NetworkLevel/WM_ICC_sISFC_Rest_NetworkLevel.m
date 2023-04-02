clear
clc

load('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/sISFC_subpair_RestDay1_r');
load('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/sISFC_subpair_RestDay2_r');

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

% Draw matrix
imagesc(ICC_sISFC_Rest_WM);
colorbar;
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/ICC_sISFC_Rest_WM.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/ICC_sISFC_Rest_WM.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/ICC_sISFC_Rest_WM','ICC_sISFC_Rest_WM');



