clear
clc

% ISFC
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/NetworkLevel/MovieDay1_GM_NetworkLevel');

image_dim = size(MovieDay1_GM_NetworkLevel);

for neti = 1:image_dim(2)
    tic
    disp(['Now running Net' num2str(neti) '......']);
    for netj = 1:image_dim(2)
        
        for step = 1:image_dim(3)-30+1
        	dISFC_series(:,:,neti,netj,step) = corr(squeeze(MovieDay1_GM_NetworkLevel(:,neti,step:step+30-1))',squeeze(MovieDay1_GM_NetworkLevel(:,netj,step:step+30-1))');
        end
        
        dISFC_subpair_MovieDay1(:,:,neti,netj) = std(dISFC_series(:,:,neti,netj,:),0,5);
        
        tmp = ones(image_dim(1),image_dim(1));
        tmp = diag(diag(tmp));
        
        ma = dISFC_subpair_MovieDay1(:,:,neti,netj);
        ma(tmp==1) = 0;
        
        sumval = sum(sum(ma));
        num = 171*(1+171)/2 * 2;
        dISFC_MovieDay1(neti,netj) = sumval/num;
    end
    toc
end

% Draw matrix
imagesc(dISFC_MovieDay1);
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/dISFC_MovieDay1.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/dISFC_MovieDay1.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/dISFC_subpair_MovieDay1','dISFC_subpair_MovieDay1');
save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/dISFC_MovieDay1','dISFC_MovieDay1');
