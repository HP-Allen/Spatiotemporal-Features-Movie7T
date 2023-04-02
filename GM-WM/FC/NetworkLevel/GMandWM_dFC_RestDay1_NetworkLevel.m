clear
clc

% GM
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/NetworkLevel/RestDay1_GM_NetworkLevel','RestDay1_GM_NetworkLevel');
% WM
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/RestDay1_WM_NetworkLevel','RestDay1_WM_NetworkLevel');

GM_dim = size(RestDay1_GM_NetworkLevel);
WM_dim = size(RestDay1_WM_NetworkLevel);

for subi = 1:GM_dim(1)
    tic
    disp(['Now running sub' num2str(subi) '......']);
    
    for step = 1:GM_dim(3)-30+1
        dFC_series(subi,:,:,step) = corr(squeeze(RestDay1_GM_NetworkLevel(subi,:,step:step+30-1))', squeeze(RestDay1_WM_NetworkLevel(subi,:,step:step+30-1))');
    end
            
    for Networki = 1:GM_dim(2)
        for Networkj = 1:WM_dim(2)
            dFC_RestDay1(subi,Networki,Networkj) = std(dFC_series(subi,Networki,Networkj,:));
        end
    end
    
    toc
end

dFC_RestDay1_ave = squeeze(mean(dFC_RestDay1,1));

% Draw matrix
imagesc(dFC_RestDay1_ave);
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_RestDay1_ave.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_RestDay1_ave.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_RestDay1','dFC_RestDay1');
save('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_RestDay1_ave','dFC_RestDay1_ave');




