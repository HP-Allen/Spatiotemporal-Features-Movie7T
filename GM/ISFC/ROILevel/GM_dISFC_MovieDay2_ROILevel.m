clear
clc

% ISFC
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/ROILevel/MovieDay2_GM_ROILevel','MovieDay2_GM_ROILevel');

image_dim = size(MovieDay2_GM_ROILevel);

for roii = 1:image_dim(2)
    tic
    disp(['Now running ROI' num2str(roii) '......']);
    for roij = 1:image_dim(2)

        for step = 1:image_dim(3)-30+1
        	dISFC_series(:,:,step) = corr(squeeze(MovieDay2_GM_ROILevel(:,roii,step:step+30-1))',squeeze(MovieDay2_GM_ROILevel(:,roij,step:step+30-1))');
        end
        
        dISFC_subpair_MovieDay2(:,:,roii,roij) = std(dISFC_series,0,3);

        tmp = ones(image_dim(1),image_dim(1));
        tmp = diag(diag(tmp));
        
        ma = dISFC_subpair_MovieDay2(:,:,roii,roij);
        ma(tmp==1) = 0;
        
        sumval = sum(sum(ma));
        num = 171*(1+171)/2 * 2;
        dISFC_MovieDay2(roii,roij) = sumval/num;
    end
    toc
end

ex = 10;

Input = zeros(size(dISFC_MovieDay2,1)+ex,size(dISFC_MovieDay2,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = dISFC_MovieDay2;

% Draw matrix
imagesc(Input,'AlphaData',~isnan(Input));
colorbar;
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = [15,48,71,87,108,128,168];x1 = ones(201,size(tmp1,2)); x1 = x1.*tmp1;
tmp = 1:201; y1 = ones(201,size(tmp1,2)); y1 = y1.*tmp';
plot(x1+ex-1,y1,'k','LineWidth',1.5);
hold on;
plot(y1+ex,x1,'k','LineWidth',1.5);
hold on;

% Draw lines to show networks
tmp2 = [0,15,48,71,87,108,128,168,200];
colors = [254/255 67/255  101/255;252/255 157/255 154/255;
    249/255 205/255 173/255;200/255 200/255 169/255;
    131/255 175/255 155/255;138/255 151/255 123/255;
    244/255 208/255 0;229/255 131/255 8/255;
    220/255 87/255 18/255];
for iter = 2:length(tmp2)
    y2 = tmp2(iter-1)+1:tmp2(iter);
    x2 = ones(1,size(y2,2));
    plot(x2,y2,'Color',colors(iter-1,:),'LineWidth',ex);
    plot(y2+ex,x2*200+ex,'Color',colors(iter-1,:),'LineWidth',ex);
    hold on;
end

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dISFC_MovieDay2.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dISFC_MovieDay2.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dISFC_subpair_MovieDay2','dISFC_subpair_MovieDay2');
save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dISFC_MovieDay2','dISFC_MovieDay2');

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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dynamic_p_SWB','dynamic_p_SWB');
% 
% 
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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dynamic_p_EWB','dynamic_p_EWB');
% 
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
%          selectsubs = sort(randi([1 num],1,num));
%          tmp = vec;
%          for m = 1:num
%             sub = selectsubs(m);
%             tmp(sub) = -tmp(sub);
%          end
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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dynamic_p_EWP','dynamic_p_EWP');
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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dynamic_p_SWP','dynamic_p_SWP');



