clear
clc

[ROI,ROIHead] = y_Read('/home/brain/HuPeng_Project/Analysis/WM/Parcellation/step4/rm_group_tcorr_cluster_200.nii');
ROIn = unique(ROI); ROIn(1) = [];
[x,y,z] = size(ROI);
ROI_1row = reshape(ROI,(x*y*z),1);

subfolder  = dir('/home/brain/HuPeng_Project/Analysis/Preproc/Rest_Day1'); subfolder(1:2) = [];

for subi = 1:length(subfolder)
    tic
    disp(['Now running Extract Average Timeseries in sub' num2str(subi) '......']);
    [Data, Header] = y_Read([ subfolder(subi).folder '/' subfolder(subi).name '/Day1_rest_data.nii']);

    Data_1row = reshape(Data,(x*y*z),size(Data,4));

    for ROIi = 1:length(ROIn)
        Data_ROI(ROIi,subi,:) = mean(Data_1row(find(ROI==ROIi),:));
    end
    toc
end

for subj = 1:size(Data_ROI,2)
    tic
    disp(['Now running FC sub' num2str(subj) '......']);
    
    for roim = 1:size(Data_ROI,1)
        for roin = 1:size(Data_ROI,1)
            FC_ROI(roim,roin,subj) = corr(squeeze(Data_ROI(roim,subj,:)),squeeze(Data_ROI(roin,subj,:)));
        end
    end
    toc
end

save('/home/brain/HuPeng_Project/Analysis/WM/Parcellation/Data_ROI','Data_ROI');
save('/home/brain/HuPeng_Project/Analysis/WM/Parcellation/FC_ROI','FC_ROI');