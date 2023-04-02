% Extract images based on NCUT Spectral Clustering
clear
clc

subfolder = dir('/home/brain/HuPeng_Project/Analysis/Preproc/Movie_Day2'); subfolder(1:2) = [];

% load masks
disp('Loading masks...');
[WM_mask,WM_head] = y_Read('/home/brain/HuPeng_Project/Analysis/WM/Parcellation/Networks/9/ROI_organized.nii');

dim = WM_head.dim;

mask = reshape(WM_mask,dim(1)*dim(2)*dim(3),1);

ROIn = unique(mask); ROIn(1) = [];  % ROIn(1) == 0  is not the brain area

disp('Done!');

% Get masked data
% MovieDay2_WM_ROILevel : subject x ROI x Time
for subi = 1:length(subfolder)
    tic
    disp(['Now running sub' num2str(subi) '.......']);
    [Data,Header] = y_Read([subfolder(subi).folder '/' subfolder(subi).name '/Day2_movie_data.nii']);

    Data = reshape(Data,dim(1)*dim(2)*dim(3),size(Data,4));
    
    for roii = 1:length(ROIn)
        MovieDay2_WM_ROILevel(subi,roii,:) = mean(Data(find(mask==ROIn(roii)),:),1);
    end
    toc
end

save('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/ROILevel/MovieDay2_WM_ROILevel','MovieDay2_WM_ROILevel');
