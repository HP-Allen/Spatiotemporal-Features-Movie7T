clear
clc

% ISFC
load('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/ROILevel/MovieDay1_GM_ROILevel','MovieDay1_GM_ROILevel');

image_dim = size(MovieDay1_GM_ROILevel);

for roii = 1:image_dim(2)
    tic
    disp(['Now running ROI' num2str(roii) '......']);
    for roij = 1:image_dim(2)
        sISFC_subpair_MovieDay1_z(:,:,roii,roij) = atanh(corr(squeeze(MovieDay1_GM_ROILevel(:,roii,:))',squeeze(MovieDay1_GM_ROILevel(:,roij,:))'));
        
        tmp = ones(image_dim(1),image_dim(1));
        tmp = diag(diag(tmp));
        
        ma = sISFC_subpair_MovieDay1_z(:,:,roii,roij);
        ma(tmp==1) = 0;
        
        sumval = sum(sum(ma));
        num = 171*(1+171)/2 * 2;
        sISFC_MovieDay1_z(roii,roij) = sumval/num;
    end
    toc
end

sISFC_subpair_MovieDay1_r = tanh(sISFC_subpair_MovieDay1_z);
sISFC_MovieDay1_r = tanh(sISFC_MovieDay1_z);

ex = 10;

Input = zeros(size(sISFC_MovieDay1_r,1)+ex,size(sISFC_MovieDay1_r,2)+ex);
Input = Input + NaN;
Input(1:200,1+ex:200+ex) = sISFC_MovieDay1_r;

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

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/sISFC_MovieDay1_r.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/sISFC_MovieDay1_r.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/sISFC_subpair_MovieDay1_r','sISFC_subpair_MovieDay1_r');
save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/sISFC_MovieDay1_r','sISFC_MovieDay1_r');



% % Subject-wise Bootstrapping
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(sISFC_subpair_MovieDay1_r(:,:,neti,netj));
%       meanvalue = sISFC_MovieDay1_r(neti,netj);
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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/static_p_SWB','static_p_SWB');
% 
% 
% % Element-wise Bootstrapping
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(sISFC_subpair_MovieDay1_r(:,:,neti,netj));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = sISFC_MovieDay1_r(neti,netj);
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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/static_p_EWB','static_p_EWB');
% 
% % Element-wise Permutation
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(sISFC_subpair_MovieDay1_r(:,:,neti,netj));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = sISFC_MovieDay1_r(neti,netj);
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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/static_p_EWP','static_p_EWP');
% 
% 
% % Subject-wise Permutation
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(sISFC_subpair_MovieDay1_r(:,:,neti,netj));
%       meanvalue = sISFC_MovieDay1_r(neti,netj);
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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/static_p_SWP','static_p_SWP');

