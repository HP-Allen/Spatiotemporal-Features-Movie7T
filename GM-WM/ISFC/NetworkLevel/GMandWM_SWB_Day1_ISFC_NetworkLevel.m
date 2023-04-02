clear;

load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/dISFC_subpair_MovieDay1','dISFC_subpair_MovieDay1');
load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/dISFC_MovieDay1','dISFC_MovieDay1');

[subn,~,netn,netm] = size(dISFC_subpair_MovieDay1);
itern = 5000;
num = 171*(1+171)/2;


% % Subject-wise Bootstrapping
% for neti = 1:netn
%    for netj = 1:netm
%       ma = squeeze(dISFC_subpair_MovieDay1(:,:,neti,netj));
%       meanvalue = dISFC_MovieDay1(neti,netj);
% 
%       for count = 1:itern
%          selectsubs = sort(randi([1 subn],1,subn));
%          tmp = ma(selectsubs,selectsubs);
%          tmp = tril(tmp,-1);
%          randmeanvalue(neti,netj,count) = sum(tmp(:))/num;
% 
%       end
%       dynamic_mean_SWB(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (itern+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/dynamic_mean_SWB','dynamic_mean_SWB');

% Subject-wise Bootstrapping
for neti = 1:netn
   for netj = 1:netm
      ma = squeeze(dISFC_subpair_MovieDay1(:,:,neti,netj));
      tmp1 = ma;
      tmp2 = diag(diag(ones(subn,subn)));
      tmp1(tmp2==1) = NaN;
      medianvalue = median(tmp1,'All','omitnan');

      parfor count = 1:itern
         selectsubs = sort(randi([1 subn],1,subn));
         tmp3 = ma(selectsubs,selectsubs);
         tmp4 = diag(diag(ones(subn,subn)));
         tmp3(tmp4==1) = NaN;
         randmedianvalue(neti,netj,count) = median(tmp3,'All','omitnan');

      end
      dynamic_median_SWB_Day1_diag(neti,netj) = (length(find(abs(randmedianvalue(neti,netj,:)) > abs(medianvalue)))+1) / (itern+1);
   end
    
end

save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/dynamic_median_SWB_Day1_diag','dynamic_median_SWB_Day1_diag');

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

clear;

load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_subpair_MovieDay1_r','sISFC_subpair_MovieDay1_r');
load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_MovieDay1_r','sISFC_MovieDay1_r');

[subn,~,netn,netm] = size(sISFC_subpair_MovieDay1_r);
itern = 5000;
num = 171*(1+171)/2;

% % Subject-wise Bootstrapping
% for neti = 1:netn
%    for netj = 1:netm
%       ma = squeeze(sISFC_subpair_MovieDay1_r(:,:,neti,netj));
%       meanvalue = sISFC_MovieDay1_r(neti,netj);
% 
%       for count = 1:itern
%          selectsubs = sort(randi([1 subn],1,subn));
%          tmp = ma(selectsubs,selectsubs);
%          tmp = tril(tmp,-1);
%          randmeanvalue(neti,netj,count) = sum(tmp(:))/num;
% 
%       end
%       static_mean_SWB(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (itern+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/static_mean_SWB','static_mean_SWB');


% Subject-wise Bootstrapping
for neti = 1:netn
   for netj = 1:netm
      ma = squeeze(sISFC_subpair_MovieDay1_r(:,:,neti,netj));
      tmp1 = ma;
      tmp2 = diag(diag(ones(subn,subn)));
      tmp1(tmp2==1) = NaN;
      medianvalue = median(tmp1,'All','omitnan');

      parfor count = 1:itern
         selectsubs = sort(randi([1 subn],1,subn));
         tmp3 = ma(selectsubs,selectsubs);
         tmp4 = diag(diag(ones(subn,subn)));
         tmp3(tmp4==1) = NaN;
         randmedianvalue(neti,netj,count) = median(tmp3,'All','omitnan');

      end
      static_median_SWB_Day1_diag(neti,netj) = (length(find(abs(randmedianvalue(neti,netj,:)) > abs(medianvalue)))+1) / (itern+1);
   end
    
end

save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/static_median_SWB_Day1_diag','static_median_SWB_Day1_diag');


% % Element-wise Bootstrapping
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(dISFC_subpair_MovieDay1(:,:,neti,netj));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = dISFC_MovieDay1(neti,netj);
% 
%       for count = 1:5000
%          selectsubs = sort(randi([1 num],1,num));
%          tmp = vec(selectsubs);
%          randmeanvalue(neti,netj,count) = sum(tmp)/num;
% 
%       end
%       dynamic_p_EWB(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/dynamic_p_EWB','dynamic_p_EWB');
% 
% % Element-wise Permutation
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(dISFC_subpair_MovieDay1(:,:,neti,netj));
%       vec = [];
%       for n = 2:image_dim(1)
%          vec = [vec ma(n,1:n-1)];
%       end
%       meanvalue = dISFC_MovieDay1(neti,netj);
%       
%       for count = 1:5000
%          selectelems = sort(randperm(num,num/2));
%          tmp = vec;
%          tmp(selectelems) = -tmp(selectelems);
%          randmeanvalue(neti,netj,count) = sum(tmp)/num;
% 
%       end
%       dynamic_p_EWP(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/dynamic_p_EWP','dynamic_p_EWP');
% 
% 
% % Subject-wise Permutation
% for neti = 1:image_dim(2)
%    for netj = 1:neti
%       ma = squeeze(dISFC_subpair_MovieDay1(:,:,neti,netj));
%       meanvalue = dISFC_MovieDay1(neti,netj);
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
%       dynamic_p_SWP(neti,netj) = (length(find(abs(randmeanvalue(neti,netj,:)) > abs(meanvalue)))+1) / (5000+1);
%    end
%     
% end
% 
% save('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/dynamic_p_SWP','dynamic_p_SWP');













