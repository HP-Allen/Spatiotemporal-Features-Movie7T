clear
clc

% ISFC
load('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/MovieDay2_WM_NetworkLevel','MovieDay2_WM_NetworkLevel');

image_dim = size(MovieDay2_WM_NetworkLevel);

for neti = 1:image_dim(2)
    tic
    disp(['Now running Net' num2str(neti) '......']);
    for netj = 1:image_dim(2)
        
        for step = 1:image_dim(3)-30+1
        	dISFC_series(:,:,neti,netj,step) = corr(squeeze(MovieDay2_WM_NetworkLevel(:,neti,step:step+30-1))',squeeze(MovieDay2_WM_NetworkLevel(:,netj,step:step+30-1))');
        end
        
        dISFC_subpair_MovieDay2(:,:,neti,netj) = std(dISFC_series(:,:,neti,netj,:),0,5);
        
        tmp = ones(image_dim(1),image_dim(1));
        tmp = diag(diag(tmp));
        
        ma = dISFC_subpair_MovieDay2(:,:,neti,netj);
        ma(tmp==1) = 0;
        
        sumval = sum(sum(ma));
        num = 171*(1+171)/2 * 2;
        dISFC_MovieDay2(neti,netj) = sumval/num;
    end
    toc
end

% Draw matrix
imagesc(dISFC_MovieDay2);
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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dISFC_MovieDay2.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dISFC_MovieDay2.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dISFC_subpair_MovieDay2','dISFC_subpair_MovieDay2');
save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dISFC_MovieDay2','dISFC_MovieDay2');


% % Subject-wise Bootstrapping
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(dISFC_subpair_MovieDay2(:,:,neti,netj));
%       meanvalue = dISFC_MovieDay2(neti,netj);
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
% %           dynamic_p_SWB(neti,netj) = p1;
% %       else
% %           dynamic_p_SWB(neti,netj) = p2;
% %       end
% 
%         dynamic_p_SWB(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dynamic_p_SWB','dynamic_p_SWB');


% % Element-wise Bootstrapping
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(dISFC_subpair_MovieDay2(:,:,neti,netj));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = dISFC_MovieDay2(neti,netj);
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
% %           dynamic_p_EWB(neti,netj) = p1;
% %       else
% %           dynamic_p_EWB(neti,netj) = p2;
% %       end
%       
%       dynamic_p_EWB(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dynamic_p_EWB','dynamic_p_EWB');

% % Element-wise Permutation
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(dISFC_subpair_MovieDay2(:,:,neti,netj));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = dISFC_MovieDay2(neti,netj);
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
% %           dynamic_p_EWP(neti,netj) = p1;
% %       else
% %           dynamic_p_EWP(neti,netj) = p2;
% %       end
%       
%       dynamic_p_EWP(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dynamic_p_EWP','dynamic_p_EWP');
% 
% 
% % Subject-wise Permutation
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(dISFC_subpair_MovieDay2(:,:,neti,netj));
%       meanvalue = dISFC_MovieDay2(neti,netj);
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
% %           dynamic_p_SWP(neti,netj) = p1;
% %       else
% %           dynamic_p_SWP(neti,netj) = p2;
% %       end
%       dynamic_p_SWP(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/WM/ISFC/NetworkLevel/dynamic_p_SWP','dynamic_p_SWP');


