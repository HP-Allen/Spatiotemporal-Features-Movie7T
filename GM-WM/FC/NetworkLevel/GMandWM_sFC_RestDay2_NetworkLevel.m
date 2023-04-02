clear
clc

% GM
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/NetworkLevel/RestDay2_GM_NetworkLevel','RestDay2_GM_NetworkLevel');
% WM
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/RestDay2_WM_NetworkLevel','RestDay2_WM_NetworkLevel');

image_dim = size(RestDay2_GM_NetworkLevel);

for subi = 1:image_dim(1)
    tic
    disp(['Now running sub' num2str(subi) '......']);

    sFC_RestDay2(subi,:,:) = corr(squeeze(RestDay2_GM_NetworkLevel(subi,:,:))',squeeze(RestDay2_WM_NetworkLevel(subi,:,:))');

    toc
end


sFC_RestDay2_ave = squeeze(tanh(mean(atanh(sFC_RestDay2),1)));

% Draw matrix
imagesc(sFC_RestDay2_ave);
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/sFC_RestDay2_ave.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/sFC_RestDay2_ave.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/sFC_RestDay2','sFC_RestDay2');
save('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/sFC_RestDay2_ave','sFC_RestDay2_ave');




