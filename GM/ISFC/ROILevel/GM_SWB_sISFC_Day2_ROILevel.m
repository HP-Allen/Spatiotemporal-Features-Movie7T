clear;

load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dISFC_subpair_MovieDay2','dISFC_subpair_MovieDay2');
load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dISFC_MovieDay2','dISFC_MovieDay2');

[subn,~,roin,~] = size(dISFC_subpair_MovieDay2);
itern = 5000;
num = 171*(1+171)/2;

% Subject-wise Bootstrapping
for roii = 1:roin
   for roij = 1:roii
      ma = squeeze(dISFC_subpair_MovieDay2(:,:,roii,roij));
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
      dynamic_median_SWB_Day2_diag(roii,roij) = (length(find(abs(randmedianvalue(roii,roij,:)) > abs(medianvalue)))+1) / (itern+1);
   end
    
end

save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dynamic_median_SWB_Day2_diag','dynamic_median_SWB_Day2_diag');

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

clear;

load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/sISFC_subpair_MovieDay2_r','sISFC_subpair_MovieDay2_r');
load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/sISFC_MovieDay2_r','sISFC_MovieDay2_r');

[subn,~,roin,~] = size(sISFC_subpair_MovieDay2_r);
itern = 5000;
num = 171*(1+171)/2;

% Subject-wise Bootstrapping
for roii = 1:roin
   for roij = 1:roii
      ma = squeeze(sISFC_subpair_MovieDay2_r(:,:,roii,roij));
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
      static_median_SWB_Day2_diag(roii,roij) = (length(find(abs(randmedianvalue(roii,roij,:)) > abs(medianvalue)))+1) / (itern+1);
   end
    
end

save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/static_median_SWB_Day2_diag','static_median_SWB_Day2_diag');


% % Element-wise Bootstrapping
% for roii = 1:image_dim(2)
%    for roij = 1:roii
%       ma = squeeze(dISFC_subpair_MovieDay2(:,:,roii,roij));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = dISFC_MovieDay2(roii,roij);
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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dynamic_p_EWB','dynamic_p_EWB');
% 
% % Element-wise Permutation
% for roii = 1:image_dim(2)
%    for roij = 1:roii
%       ma = squeeze(dISFC_subpair_MovieDay2(:,:,roii,roij));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = dISFC_MovieDay2(roii,roij);
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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dynamic_p_EWP','dynamic_p_EWP');
% 
% 
% % Subject-wise Permutation
% for roii = 1:image_dim(2)
%    for roij = 1:roii
%       ma = squeeze(dISFC_subpair_MovieDay2(:,:,roii,roij));
%       meanvalue = dISFC_MovieDay2(roii,roij);
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
% save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/ROILevel/dynamic_p_SWP','dynamic_p_SWP');













