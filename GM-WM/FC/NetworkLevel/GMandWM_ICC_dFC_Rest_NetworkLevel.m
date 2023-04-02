clear
clc

load('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_RestDay1');
load('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_RestDay2');

[~,netn,netm] = size(dFC_RestDay1);
type='1-1';

for neti = 1:netn
    for netj = 1:netm
        M=[dFC_RestDay1(:,neti,netj),dFC_RestDay2(:,neti,netj)];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_dFC_Rest_GMandWM(neti,netj) = r;
    end
end

% Draw matrix
imagesc(ICC_dFC_Rest_GMandWM);
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/ICC_dFC_Rest_GMandWM.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/ICC_dFC_Rest_GMandWM.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/ICC_dFC_Rest_GMandWM','ICC_dFC_Rest_GMandWM');

