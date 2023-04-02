
%???K???????K=7???????
clc
clear

load('/home/brain/HuPeng_Project/Analysis/GM/Parcellation/FC_ROI');

k = 8;

data=mean(FC_ROI,3);

networks_idx = kmeans(data, k,'distance','sqeuclidean','replicates',30);            % K-means clustering

[ROI,ROIHead]=y_Read('/home/brain/HuPeng_Project/Analysis/GM/Parcellation/step4/rm_group_tcorr_cluster_200.nii');
% ROIn = unique(ROI); ROIn(1) = [];
tmp = 0;
ROI_organized=ROI;

for idxi = 1: k
    label=find(networks_idx==idxi);
    Networks = zeros(61,73,61);
    for i=1:length(label)
        tmp = tmp + 1;
        ROI_organized(ROI==label(i)) = tmp;
        Networks(ROI==label(i)) = idxi;
        ROIstoNetworks(tmp) = idxi;
    end
    
    y_Write(Networks,ROIHead,['/home/brain/HuPeng_Project/Analysis/GM/Parcellation/Networks/' num2str(k) '/' num2str(idxi) '.nii']);

end
y_Write(ROI_organized,ROIHead,['/home/brain/HuPeng_Project/Analysis/GM/Parcellation/Networks/' num2str(k) '/ROI_organized.nii']);
save(['/home/brain/HuPeng_Project/Analysis/GM/Parcellation/Networks/' num2str(k) '/ROIstoNetworks'], 'ROIstoNetworks');