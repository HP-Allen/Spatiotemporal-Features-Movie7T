% Extract images based on NCUT Spectral Clustering
clear
clc

subfolder = dir('/home/brain/HuPeng_Project/Analysis/Preproc/Rest_Day1'); subfolder(1:2) = [];

% load masks
disp('Loading masks...');
[GM_mask,GM_head] = y_Read('/home/brain/HuPeng_Project/Analysis/GM/Parcellation/Networks/8/Network_organized.nii');

dim = GM_head.dim;

mask = reshape(GM_mask,dim(1)*dim(2)*dim(3),1);

Networkn = unique(mask); Networkn(1) = [];  % Networkn(1) == 0  is not the brain area

disp('Done!');

% Get masked data
% RestDay1_GM_NetworkLevel : subject x Network x Time
for subi = 1:length(subfolder)
    tic
    disp(['Now running sub' num2str(subi) '.......']);
    [Data,Header] = y_Read([subfolder(subi).folder '/' subfolder(subi).name '/Day1_rest_data.nii']);

    Data = reshape(Data,dim(1)*dim(2)*dim(3),size(Data,4));
    
    for Networki = 1:length(Networkn)
        RestDay1_GM_NetworkLevel(subi,Networki,:) = mean(Data(find(mask==Networkn(Networki)),:),1);
    end
    toc
end

save('/home/brain/HuPeng_Project/Analysis/GM/Timeseries/NetworkLevel/RestDay1_GM_NetworkLevel','RestDay1_GM_NetworkLevel');
