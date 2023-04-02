clear
clc

% FC
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/NetworkLevel/MovieDay1_GM_NetworkLevel');

image_dim = size(MovieDay1_GM_NetworkLevel);

for subi = 1:image_dim(1)
    tic
    disp(['Now running sub' num2str(subi) '......']);
    
    sFC_MovieDay1(subi,:,:) = corr(squeeze(MovieDay1_GM_NetworkLevel(subi,:,:))',squeeze(MovieDay1_GM_NetworkLevel(subi,:,:))');
   
    toc
end


sFC_MovieDay1_ave = squeeze(tanh(mean(atanh(sFC_MovieDay1),1)));

% Draw matrix
imagesc(sFC_MovieDay1_ave);
colorbar;
caxis([0 0.6]);
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:8;x1 = ones(9,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:8; y1 = ones(9,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/sFC_MovieDay1_ave.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/sFC_MovieDay1_ave.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/sFC_MovieDay1','sFC_MovieDay1');
save('/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/sFC_MovieDay1_ave','sFC_MovieDay1_ave');




