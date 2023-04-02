clear;

load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/dISFC_subpair_MovieDay1','dISFC_subpair_MovieDay1');
load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/dISFC_MovieDay1','dISFC_MovieDay1');

[subn,~,roin,~] = size(dISFC_subpair_MovieDay1);
itern = 5000;
num = 171*(1+171)/2;

% tic;
% % Subject-wise Bootstrapping
% for roii = 1:roin
%    for roij = 1:roin
%       ma = squeeze(dISFC_subpair_MovieDay1(:,:,roii,roij));
%       meanvalue = dISFC_MovieDay1(roii,roij);
% 
%       for count = 1:itern
%          selectsubs = sort(randi([1 subn],1,subn));
%          tmp = ma(selectsubs,selectsubs);
%          tmp = tril(tmp,-1);
%          randmeanvalue(roii,roij,count) = sum(tmp(:))/num;
% 
%       end
%       dynamic_mean_SWB(roii,roij) = (length(find(abs(randmeanvalue(roii,roij,:)) > abs(meanvalue)))+1) / (itern+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/dynamic_mean_SWB','dynamic_mean_SWB');
% 
% toc;

tic;
% Subject-wise Bootstrapping
for roii = 1:roin
   for roij = 1:roin
      disp([1,roii,roij])
      ma = squeeze(dISFC_subpair_MovieDay1(:,:,roii,roij));
      tmp1 = ma;
      tmp2 = diag(diag(ones(subn,subn)));
      tmp1(tmp2==1) = NaN;
      medianvalue = median(tmp1,'All','omitnan');

      parfor count = 1:itern
         selectsubs = sort(randi([1 subn],1,subn));
         tmp3 = ma(selectsubs,selectsubs);
         tmp4 = diag(diag(ones(subn,subn)));
         tmp3(tmp4==1) = NaN;
         randmedianvalue(roii,roij,count) = median(tmp3,'All','omitnan');

      end
      dynamic_median_SWB_Day1_diag(roii,roij) = (length(find(abs(randmedianvalue(roii,roij,:)) > abs(medianvalue)))+1) / (itern+1);
   end
    
end

save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/dynamic_median_SWB_Day1_diag','dynamic_median_SWB_Day1_diag');

toc;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

clear;

load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/sISFC_subpair_MovieDay1_r','sISFC_subpair_MovieDay1_r');
load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/sISFC_MovieDay1_r','sISFC_MovieDay1_r');

[subn,~,roin,~] = size(sISFC_subpair_MovieDay1_r);
itern = 5000;
num = 171*(1+171)/2;

% tic;
% % Subject-wise Bootstrapping
% for roii = 1:roin
%    for roij = 1:roin
%       ma = squeeze(sISFC_subpair_MovieDay1_r(:,:,roii,roij));
%       meanvalue = sISFC_MovieDay1_r(roii,roij);
% 
%       for count = 1:itern
%          selectsubs = sort(randi([1 subn],1,subn));
%          tmp = ma(selectsubs,selectsubs);
%          tmp = tril(tmp,-1);
%          randmeanvalue(roii,roij,count) = sum(tmp(:))/num;
% 
%       end
%       static_mean_SWB(roii,roij) = (length(find(abs(randmeanvalue(roii,roij,:)) > abs(meanvalue)))+1) / (itern+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/static_mean_SWB','static_mean_SWB');
% 
% toc;

tic;
% Subject-wise Bootstrapping
for roii = 1:roin
   for roij = 1:roin
      disp([1,roii,roij])
      ma = squeeze(sISFC_subpair_MovieDay1_r(:,:,roii,roij));
      tmp1 = ma;
      tmp2 = diag(diag(ones(subn,subn)));
      tmp1(tmp2==1) = NaN;
      medianvalue = median(tmp1,'All','omitnan');

      parfor count = 1:itern
         selectsubs = sort(randi([1 subn],1,subn));
         tmp3 = ma(selectsubs,selectsubs);
         tmp4 = diag(diag(ones(subn,subn)));
         tmp3(tmp4==1) = NaN;
         randmedianvalue(roii,roij,count) = median(tmp3,'All','omitnan');

      end
      static_median_SWB_Day1_diag(roii,roij) = (length(find(abs(randmedianvalue(roii,roij,:)) > abs(medianvalue)))+1) / (itern+1);
   end
    
end

save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/static_median_SWB_Day1_diag','static_median_SWB_Day1_diag');

toc;

% % Element-wise Bootstrapping
% for roii = 1:image_dim(2)
%    for roij = 1:roii
%       ma = squeeze(dISFC_subpair_MovieDay1(:,:,roii,roij));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = dISFC_MovieDay1(roii,roij);
% 
%       for count = 1:5000
%          selectsubs = sort(randi([1 num],1,num));
%          tmp = vec(selectsubs);
%          randmeanvalue(roii,roij,count) = sum(tmp)/num;
% 
%       end
%       dynamic_p_EWB(roii,roij) = (length(find(abs(randmeanvalue(roii,roij,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/dynamic_p_EWB','dynamic_p_EWB');
% 
% % Element-wise Permutation
% for roii = 1:image_dim(2)
%    for roij = 1:roii
%       ma = squeeze(dISFC_subpair_MovieDay1(:,:,roii,roij));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = dISFC_MovieDay1(roii,roij);
%       
%       for count = 1:5000
%          selectelems = sort(randperm(num,num/2));
%          tmp = vec;
%          tmp(selectelems) = -tmp(selectelems);
%          randmeanvalue(roii,roij,count) = sum(tmp)/num;
% 
%       end
%       dynamic_p_EWP(roii,roij) = (length(find(abs(randmeanvalue(roii,roij,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/dynamic_p_EWP','dynamic_p_EWP');
% 
% 
% % Subject-wise Permutation
% for roii = 1:image_dim(2)
%    for roij = 1:roii
%       ma = squeeze(dISFC_subpair_MovieDay1(:,:,roii,roij));
%       meanvalue = dISFC_MovieDay1(roii,roij);
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
%          randmeanvalue(roii,roij,count) = sum(tmp(:))/num;
% 
%       end
%       dynamic_p_SWP(roii,roij) = (length(find(abs(randmeanvalue(roii,roij,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/ROILevel/dynamic_p_SWP','dynamic_p_SWP');













