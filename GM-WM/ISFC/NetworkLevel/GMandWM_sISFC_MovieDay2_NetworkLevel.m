clear
clc

% ISFC
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/NetworkLevel/MovieDay2_GM_NetworkLevel','MovieDay2_GM_NetworkLevel');
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/MovieDay2_WM_NetworkLevel','MovieDay2_WM_NetworkLevel');

image_dim_GM = size(MovieDay2_GM_NetworkLevel);
image_dim_WM = size(MovieDay2_WM_NetworkLevel);

for neti = 1:image_dim_GM(2)
    tic
    disp(['Now running Net' num2str(neti) '......']);
    for netj = 1:image_dim_WM(2)
        sISFC_subpair_MovieDay2_z(:,:,neti,netj)  = atanh(corr(squeeze(MovieDay2_GM_NetworkLevel(:,neti,:))',squeeze(MovieDay2_WM_NetworkLevel(:,netj,:))'));
  
        tmp = ones(image_dim_GM(1),image_dim_GM(1));
        tmp = diag(diag(tmp));
        
        ma = sISFC_subpair_MovieDay2_z(:,:,neti,netj);
        ma(tmp==1) = 0;
        
        sumval = sum(sum(ma));
        num = 171*(1+171)/2 * 2;
        sISFC_MovieDay2_z(neti,netj) = sumval/num;
    end
    toc
end

sISFC_subpair_MovieDay2_r = tanh(sISFC_subpair_MovieDay2_z);
sISFC_MovieDay2_r = tanh(sISFC_MovieDay2_z);

% Draw matrix
figure;
imagesc(sISFC_MovieDay2_r);
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_MovieDay2_r.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_MovieDay2_r.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_subpair_MovieDay2_r','sISFC_subpair_MovieDay2_r');
save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_MovieDay2_r','sISFC_MovieDay2_r');

% % Bootstrapping
% for neti = 1:image_dim_GM(2)
%    for netj = 1:image_dim_WM(2)
%       ma = squeeze(sISFC_subpair_MovieDay2_z(:,:,neti,netj));
%       meanvalue = sISFC_MovieDay2_z(neti,netj);
%       
%       big = 0;
%       small = 0;
%       for count = 1:5000
%          selectsubs = sort(randi([1 172],1,172));
%          tmp = ma(selectsubs,selectsubs);
%          tmp = tril(tmp,-1);
%          tmp2 = tmp==Inf | tmp > 18;
%          tmp(tmp2) = 1;
%          randmeanvalue(neti,netj,count) = sum(tmp(:))/num;
% 
%       end
% 
%       p1 = (length(find(randmeanvalue(neti,netj,:) > meanvalue))+1) / (5000+1);
%       p2 = (length(find(randmeanvalue(neti,netj,:) < meanvalue))+1) / (5000+1);
%       if p1<p2
%           p(neti,netj) = p1;
%       else
%           p(neti,netj) = p2;
%       end
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/p_s','p');


