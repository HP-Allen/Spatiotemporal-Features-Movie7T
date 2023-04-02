clear
clc

% ISFC
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/NetworkLevel/RestDay2_GM_NetworkLevel');

image_dim = size(RestDay2_GM_NetworkLevel);


for neti = 1:image_dim(2)
    tic
    disp(['Now running Net' num2str(neti) '......']);
    for netj = 1:image_dim(2)
        sISFC_subpair_RestDay2_z(:,:,neti,netj) = atanh(corr(squeeze(RestDay2_GM_NetworkLevel(:,neti,:))',squeeze(RestDay2_GM_NetworkLevel(:,netj,:))'));
   
        tmp = ones(image_dim(1),image_dim(1));
        tmp = diag(diag(tmp));
        
        ma = sISFC_subpair_RestDay2_z(:,:,neti,netj);
        ma(tmp==1) = 0;
        
        sumval = sum(sum(ma));
        num = 171*(1+171)/2 * 2;
        sISFC_RestDay2_z(neti,netj) = sumval/num;
    end
    toc
end

sISFC_subpair_RestDay2_r = tanh(sISFC_subpair_RestDay2_z);
sISFC_RestDay2_r = tanh(sISFC_RestDay2_z);

% Draw matrix
figure;
imagesc(sISFC_RestDay2_r);
colorbar;
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:8;x1 = ones(9,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:8; y1 = ones(9,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/sISFC_RestDay2_r.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/sISFC_RestDay2_r.fig');
close all;


save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/sISFC_subpair_RestDay2_r','sISFC_subpair_RestDay2_r');
save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/sISFC_RestDay2_r','sISFC_RestDay2_r');