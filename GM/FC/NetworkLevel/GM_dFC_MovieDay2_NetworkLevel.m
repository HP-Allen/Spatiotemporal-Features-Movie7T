clear
clc

% FC
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/NetworkLevel/MovieDay2_GM_NetworkLevel');

image_dim = size(MovieDay2_GM_NetworkLevel);

for subi = 1:image_dim(1)
    tic
    disp(['Now running sub' num2str(subi) '......']);
    
    for step = 1:image_dim(3)-30+1
        dFC_series(subi,:,:,step) = corr(squeeze(MovieDay2_GM_NetworkLevel(subi,:,step:step+30-1))', squeeze(MovieDay2_GM_NetworkLevel(subi,:,step:step+30-1))');
    end
    
    for Networki = 1:image_dim(2)
        for Networkj = 1:image_dim(2)
            dFC_MovieDay2(subi,Networki,Networkj) = std(dFC_series(subi,Networki,Networkj,:));
        end
    end
    toc
end


dFC_MovieDay2_ave = squeeze(mean(dFC_MovieDay2,1));

% Draw matrix
imagesc(dFC_MovieDay2_ave);
colorbar;
caxis([0.25 0.45]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:8;x1 = ones(9,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:8; y1 = ones(9,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/dFC_MovieDay2_ave.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/dFC_MovieDay2_ave.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/dFC_MovieDay2','dFC_MovieDay2');
save('/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/dFC_MovieDay2_ave','dFC_MovieDay2_ave');



