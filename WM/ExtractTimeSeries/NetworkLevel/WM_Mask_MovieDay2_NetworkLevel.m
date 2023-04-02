% Extract images based on NCUT Spectral Clustering
clear
clc

subfolder = dir('/home/brain/HuPeng_Project/Analysis/Preproc/Movie_Day2'); subfolder(1:2) = [];

% load masks
disp('Loading masks...');
[WM_mask,WM_head] = y_Read('/home/brain/HuPeng_Project/Analysis/WM/Parcellation/Networks/9/Network_organized.nii');

dim = WM_head.dim;

mask = reshape(WM_mask,dim(1)*dim(2)*dim(3),1);

Networkn = unique(mask); Networkn(1) = [];  % Networkn(1) == 0  is not the brain area

disp('Done!');

% Get masked data
% MovieDay2_WM_NetworkLevel : subject x Network x Time
for subi = 1:length(subfolder)
    tic
    disp(['Now running sub' num2str(subi) '.......']);
    [Data,Header] = y_Read([subfolder(subi).folder '/' subfolder(subi).name '/Day2_movie_data.nii']);

    Data = reshape(Data,dim(1)*dim(2)*dim(3),size(Data,4));
    
    for Networki = 1:length(Networkn)
        MovieDay2_WM_NetworkLevel(subi,Networki,:) = mean(Data(find(mask==Networkn(Networki)),:),1);
    end
    toc
end

save('/home/brain/HuPeng_Project/Analysis/WM/Timeseries/NetworkLevel/MovieDay2_WM_NetworkLevel','MovieDay2_WM_NetworkLevel');
