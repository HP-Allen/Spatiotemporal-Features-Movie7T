clear
clc

% FC
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/RestDay2_WM_NetworkLevel','RestDay2_WM_NetworkLevel');

image_dim = size(RestDay2_WM_NetworkLevel);

for subi = 1:image_dim(1)
    tic
    disp(['Now running sub' num2str(subi) '......']);
  
    sFC_RestDay2(subi,:,:) = corr(squeeze(RestDay2_WM_NetworkLevel(subi,:,:))',squeeze(RestDay2_WM_NetworkLevel(subi,:,:))');
    
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
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/FC/NetworkLevel/sFC_RestDay2_ave.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/FC/NetworkLevel/sFC_RestDay2_ave.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/WM/FC/NetworkLevel/sFC_RestDay2','sFC_RestDay2');
save('/home/brain/HuPeng_Project/Analysis/WM/FC/NetworkLevel/sFC_RestDay2_ave','sFC_RestDay2_ave');




