clear
clc

% FC
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/MovieDay2_WM_NetworkLevel','MovieDay2_WM_NetworkLevel');

image_dim = size(MovieDay2_WM_NetworkLevel);

for subi = 1:image_dim(1)
    tic
    disp(['Now running sub' num2str(subi) '......']);
           
    sFC_MovieDay2(subi,:,:) = corr(squeeze(MovieDay2_WM_NetworkLevel(subi,:,:))',squeeze(MovieDay2_WM_NetworkLevel(subi,:,:))');

    toc
end


sFC_MovieDay2_ave = squeeze(tanh(mean(atanh(sFC_MovieDay2),1)));

% Draw matrix
imagesc(sFC_MovieDay2_ave);
colorbar;
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/FC/NetworkLevel/sFC_MovieDay2_ave.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/FC/NetworkLevel/sFC_MovieDay2_ave.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/WM/FC/NetworkLevel/sFC_MovieDay2','sFC_MovieDay2');
save('/home/brain/HuPeng_Project/Analysis/WM/FC/NetworkLevel/sFC_MovieDay2_ave','sFC_MovieDay2_ave');

