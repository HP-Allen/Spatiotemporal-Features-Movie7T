clear
clc

% ISFC
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/NetworkLevel/RestDay2_GM_NetworkLevel','RestDay2_GM_NetworkLevel');
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/RestDay2_WM_NetworkLevel','RestDay2_WM_NetworkLevel');

image_dim_GM = size(RestDay2_GM_NetworkLevel);
image_dim_WM = size(RestDay2_WM_NetworkLevel);


for neti = 1:image_dim_GM(2)
    tic
    disp(['Now running Net' num2str(neti) '......']);
    for netj = 1:image_dim_WM(2)
        sISFC_subpair_RestDay2_z(:,:,neti,netj) = atanh(corr(squeeze(RestDay2_GM_NetworkLevel(:,neti,:))',squeeze(RestDay2_WM_NetworkLevel(:,netj,:))'));

        tmp = ones(image_dim_GM(1),image_dim_GM(1));
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
tmp1 = 0:9;x1 = ones(size(tmp1,2),size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp2 = 0:9; y1 = ones(size(tmp2,2),size(tmp2,2)); y1 = y1.*tmp2'+0.5;
tmp3 = 0:9;x2 = ones(size(tmp3,2),size(tmp3,2)); x2 = x2.*tmp3+0.5;
tmp4 = 0:9; y2 = ones(size(tmp4,2),size(tmp4,2)); y2 = y2.*tmp4'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y2,x2,'k','LineWidth',1.5);


saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_RestDay2_r.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_RestDay2_r.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_subpair_RestDay2_r','sISFC_subpair_RestDay2_r');
save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_RestDay2_r','sISFC_RestDay2_r');
