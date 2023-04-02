clear
clc

% GM
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/NetworkLevel/MovieDay2_GM_NetworkLevel','MovieDay2_GM_NetworkLevel');
% WM
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/MovieDay2_WM_NetworkLevel','MovieDay2_WM_NetworkLevel');

GM_dim = size(MovieDay2_GM_NetworkLevel);
WM_dim = size(MovieDay2_WM_NetworkLevel);

for subi = 1:GM_dim(1)
    tic
    disp(['Now running sub' num2str(subi) '......']);
    
    for step = 1:GM_dim(3)-30+1
        dFC_series(subi,:,:,step) = corr(squeeze(MovieDay2_GM_NetworkLevel(subi,:,step:step+30-1))', squeeze(MovieDay2_WM_NetworkLevel(subi,:,step:step+30-1))');
    end
    
    for Networki = 1:GM_dim(2)
        for Networkj = 1:WM_dim(2)
            dFC_MovieDay2(subi,Networki,Networkj) = std(dFC_series(subi,Networki,Networkj,:));
        end
    end
    toc
end


dFC_MovieDay2_ave = squeeze(mean(dFC_MovieDay2,1));

% Draw matrix
imagesc(dFC_MovieDay2_ave);
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_MovieDay2_ave.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_MovieDay2_ave.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_MovieDay2','dFC_MovieDay2');
save('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_MovieDay2_ave','dFC_MovieDay2_ave');



