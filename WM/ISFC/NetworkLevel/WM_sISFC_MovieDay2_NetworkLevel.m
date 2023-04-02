clear
clc

% ISFC
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/MovieDay2_WM_NetworkLevel','MovieDay2_WM_NetworkLevel');

image_dim = size(MovieDay2_WM_NetworkLevel);


for neti = 1:image_dim(2)
    tic
    disp(['Now running Net' num2str(neti) '......']);
    for netj = 1:image_dim(2)
        sISFC_subpair_MovieDay2_z(:,:,neti,netj) = atanh(corr(squeeze(MovieDay2_WM_NetworkLevel(:,neti,:))',squeeze(MovieDay2_WM_NetworkLevel(:,netj,:))'));

        tmp = ones(image_dim(1),image_dim(1));
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
tmp1 = 0:9;x1 = ones(10,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:9; y1 = ones(10,size(tmp,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/sISFC_MovieDay2_r.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/sISFC_MovieDay2_r.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/sISFC_subpair_MovieDay2_r','sISFC_subpair_MovieDay2_r');
save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/sISFC_MovieDay2_r','sISFC_MovieDay2_r');

% % Subject-wise Bootstrapping
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(sISFC_subpair_MovieDay2_r(:,:,neti,netj));
%       meanvalue = sISFC_MovieDay2_r(neti,netj);
% 
%       for count = 1:5000
%          selectsubs = sort(randi([1 172],1,172));
%          tmp = ma(selectsubs,selectsubs);
%          tmp = tril(tmp,-1);
%          randmeanvalue(neti,netj,count) = sum(tmp(:))/num;
% 
%       end
% 
% %       p1 = (length(find(randmeanvalue(neti,netj,:) > meanvalue))+1) / (5000+1);
% %       p2 = (length(find(randmeanvalue(neti,netj,:) < meanvalue))+1) / (5000+1);
% %       if p1<p2
% %           static_p_SWB(neti,netj) = p1;
% %       else
% %           static_p_SWB(neti,netj) = p2;
% %       end
% 
%         static_p_SWB(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/static_p_SWB','static_p_SWB');
% 
% 
% % Element-wise Bootstrapping
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(sISFC_subpair_MovieDay2_r(:,:,neti,netj));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = sISFC_MovieDay2_r(neti,netj);
% 
%       for count = 1:5000
%          selectsubs = sort(randi([1 num],1,num));
%          tmp = vec(selectsubs);
%          randmeanvalue(neti,netj,count) = sum(tmp)/num;
% 
%       end
% 
% %       p1 = (length(find(randmeanvalue(neti,netj,:) > meanvalue))+1) / (5000+1);
% %       p2 = (length(find(randmeanvalue(neti,netj,:) < meanvalue))+1) / (5000+1);
% %       if p1<p2
% %           static_p_EWB(neti,netj) = p1;
% %       else
% %           static_p_EWB(neti,netj) = p2;
% %       end
%       
%       static_p_EWB(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/static_p_EWB','static_p_EWB');
% 
% % Element-wise Permutation
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(sISFC_subpair_MovieDay2_r(:,:,neti,netj));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = sISFC_MovieDay2_r(neti,netj);
%       
%       for count = 1:5000
%          selectelems = sort(randperm(num,num/2));
%          tmp = vec;
%          tmp(selectelems) = -tmp(selectelems);
%          randmeanvalue(neti,netj,count) = sum(tmp)/num;
% 
%       end
% 
% %       p1 = (length(find(randmeanvalue(neti,netj,:) > meanvalue))+1) / (5000+1);
% %       p2 = (length(find(randmeanvalue(neti,netj,:) < meanvalue))+1) / (5000+1);
% %       if p1<p2
% %           static_p_EWP(neti,netj) = p1;
% %       else
% %           static_p_EWP(neti,netj) = p2;
% %       end
%       
%       static_p_EWP(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/static_p_EWP','static_p_EWP');
% 
% 
% % Subject-wise Permutation
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(sISFC_subpair_MovieDay2_r(:,:,neti,netj));
%       meanvalue = sISFC_MovieDay2_r(neti,netj);
% 
%       for count = 1:5000
%          selectsubs = sort(randperm(172,172/2));
%          tmp = ma;
%          for m = 1:172/2
%             sub = selectsubs(m);
%             tmp(sub,:) = -tmp(sub,:);
%             tmp(:,sub) = -tmp(:,sub);
%          end
%          tmp = tril(tmp,-1);
%          randmeanvalue(neti,netj,count) = sum(tmp(:))/num;
% 
%       end
% 
% %       p1 = (length(find(randmeanvalue(neti,netj,:) > meanvalue))+1) / (5000+1);
% %       p2 = (length(find(randmeanvalue(neti,netj,:) < meanvalue))+1) / (5000+1);
% %       if p1<p2
% %           static_p_SWP(neti,netj) = p1;
% %       else
% %           static_p_SWP(neti,netj) = p2;
% %       end
%       static_p_SWP(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/static_p_SWP','static_p_SWP');




