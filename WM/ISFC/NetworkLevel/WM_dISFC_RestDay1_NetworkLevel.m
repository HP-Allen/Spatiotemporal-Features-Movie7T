clear
clc

% ISFC
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/RestDay1_WM_NetworkLevel','RestDay1_WM_NetworkLevel');

image_dim = size(RestDay1_WM_NetworkLevel);

for neti = 1:image_dim(2)
    tic
    disp(['Now running Net' num2str(neti) '......']);
    for netj = 1:image_dim(2)
        
        for step = 1:image_dim(3)-30+1
        	dISFC_series(:,:,neti,netj,step) = corr(squeeze(RestDay1_WM_NetworkLevel(:,neti,step:step+30-1))',squeeze(RestDay1_WM_NetworkLevel(:,netj,step:step+30-1))');
        end
        
        dISFC_subpair_RestDay1(:,:,neti,netj) = std(dISFC_series(:,:,neti,netj,:),0,5);
        
        tmp = ones(image_dim(1),image_dim(1));
        tmp = diag(diag(tmp));
        
        ma = dISFC_subpair_RestDay1(:,:,neti,netj);
        ma(tmp==1) = 0;
        
        sumval = sum(sum(ma));
        num = 171*(1+171)/2 * 2;
        dISFC_RestDay1(neti,netj) = sumval/num;
    end
    toc
end

% Draw matrix
imagesc(dISFC_RestDay1);
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dISFC_RestDay1.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dISFC_RestDay1.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dISFC_subpair_RestDay1','dISFC_subpair_RestDay1');
save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dISFC_RestDay1','dISFC_RestDay1');
