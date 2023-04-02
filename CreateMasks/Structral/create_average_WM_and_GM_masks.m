% This script uses data from all subjects to create average white-matter
% and grey-matter masks, for further analysis of the WM and GM separately.
% Michael Peer, April 2017


%% definition of path containing all subjects' segmented T1 data
% (the parent directory should contain a directory for each subject)
% (each subject's directory should contain segmentation results from SPM in NIFTI format - files for grey-matter, white-matter and CSF)
T1dir = 'D:\CC_DTI\rest\T1ImgNewSegment'; %%%% input the segmented path using DPARSF
subjects = dir(T1dir); subjects = subjects(3:end); 
num_subjs = length(subjects);


%% definition of a file name with functional data - so that all other masks will be resampled to this file's resolution
func_img1_filename = 'D:\CC_DTI\rest\rest1\100307\w100307.nii';    % functional image for reslicing
%%%%% input any one functional image with finishing all preprocessing steps


%% Creating a combined segmentation mask with maximum tissue probability in each voxel
% (each voxel will be coded according to the most probable tissue there) 
% saves the combined mask in the subject's directory, with the following code:
% 0 - outside the brain
% 1 - grey matter
% 2 - white matter
% 3 - cerebrospinal fluid 

% definition of prefix of files for each tissue type
GM_file_prefix = 'wc1';
WM_file_prefix = 'wc2';
CSF_file_prefix = 'wc3';
T1_image_prefix = 'w';      % leave blank ('') if not normalized

for subj=1:num_subjs
    subj
    % getting the current subject's segmentation directory
    current_seg_dir = fullfile(T1dir, subjects(subj).name);
    
    % getting the full paths of the grey-matter, white-matter and CSF files, for the current subject
    GM_file_temp = dir(fullfile(current_seg_dir, [GM_file_prefix '*.nii'])); GM_file = fullfile(current_seg_dir, GM_file_temp.name);
    WM_file_temp = dir(fullfile(current_seg_dir, [WM_file_prefix '*.nii'])); WM_file = fullfile(current_seg_dir, WM_file_temp.name);
    CSF_file_temp = dir(fullfile(current_seg_dir, [CSF_file_prefix '*.nii'])); CSF_file = fullfile(current_seg_dir, CSF_file_temp.name);
        
    % reading the images using SPM's spm_read_vols
    GM_image=spm_read_vols(spm_vol(GM_file));
    WM_image=spm_read_vols(spm_vol(WM_file));
    CSF_image=spm_read_vols(spm_vol(CSF_file));
    
    % creating the combined mask
    temp_mask = GM_image; 
    temp_mask(:,:,:,2) = WM_image; 
    temp_mask(:,:,:,3) = CSF_image;
    [max_val,max_ind] = max(temp_mask,[],4);    % finding the tissue with maximum probability in the voxel
    max_ind(max_val<0.2)=0;     % if the maximum probability for any tissue type is smaller than 0.2 (e.g. outside the brain), assign as 0
    segmentation_mask = max_ind;
    
    % getting a T1 image for saving in that image format
    T1_image_name_temp = [T1_image_prefix GM_file_temp.name(length(GM_file_prefix)+1 : end-4)];   % assumes the T1 image has the same name as the GM file but without the prefix
    if ~isempty(dir(fullfile(current_seg_dir, [T1_image_name_temp '*.nii'])))
        T1_image_temp = fullfile(current_seg_dir, [T1_image_name_temp '.nii']);
    elseif ~isempty(dir(fullfile(current_seg_dir, [T1_image_name_temp '.img']))) % old nifti format
        T1_image_temp = fullfile(current_seg_dir, [T1_image_name_temp '.img']);
    else
        disp('No T1 image found in the segmentation directory!')
        break;
    end

    % saving the combined mask
    save_mat_to_nifti(T1_image_temp, segmentation_mask, fullfile(current_seg_dir, 'wSegmentation.nii'));
end



%% Creating average grey-matter and white-matter masks from all subjects

size_mask = size(spm_read_vols(spm_vol(func_img1_filename))); size_mask = size_mask(1:3);
WMmask_full = zeros(size_mask); GMmask_full = zeros(size_mask);
for subj=1:num_subjs
    subj
    % getting the current subject's segmentation directory
    current_seg_dir = fullfile(T1dir, subjects(subj).name);
    
    % loading the full segmentation mask, created in the previous stage 
    % (each voxel shows the tissue type with the maximum probability in that voxel)
    current_seg_mask = fullfile(current_seg_dir, 'wSegmentation.nii');
    
    % resampling of the current segmentation file to the resolution of the
    % functional image
    current_seg_mask = reslice_data(current_seg_mask, func_img1_filename, 0);
    
    % adding the current segmentation mask to the sum of all subjects'
    % segmentation masks, for later averaging
    GMmask_full = GMmask_full + (current_seg_mask==1);
    WMmask_full = WMmask_full + (current_seg_mask==2);
end

% calculating the average of all masks (dividing the sum by number of
% subjects)
GMmask_full = GMmask_full./num_subjs; 
WMmask_full = WMmask_full./num_subjs;


%% Optional stage - remove subcortical structures from the white-matter mask
% these structures (putamen, globus pallidus) are erroneously identified in SPM as
% white-matter due to their high iron content (see Lorio et al. 2016, NeuroImage).
% We used here the Harvard-Oxford Atlas (obtained from DPABI toolbox) to delineate these subcortical structures, 
% and thrn remove them from the WM mask (and add them to the GM mask).

% reading the Harvard-Oxford atlas and resampling it to the functional image's resolution
HO_atlas_filename = 'C:\Users\joepan\Desktop\cc_code\corpus callosum segmentation\mask\HarvardOxford-sub-maxprob-thr25-2mm_YCG.nii'; %%% choose the HarvardOxford-sub-maxprob-thr25-2mm_YCG.nii from the mask file
HO_atlas = reslice_data(HO_atlas_filename, [func_img1_filename], 0);

% find the voxels defined as subcortical structures
indices_subcortical = [find(HO_atlas==2010);	find(HO_atlas==2049);	find(HO_atlas==3011);	find(HO_atlas==3050);	find(HO_atlas==4012);	find(HO_atlas==4051);	find(HO_atlas==5013);	find(HO_atlas==5052);	find(HO_atlas==8026);	find(HO_atlas==8058);];

% Remove these voxels from the white-matter mask and add them to the grey-matter mask
WMmask_full(indices_subcortical)=0;
GMmask_full(indices_subcortical)=1;


%% Thresholding to find voxels defined as WM or GM in a big enough percent of the subjects
WMmask = WMmask_full > 0.6;               % threshold for WM mask - >60% probability of identification as white-matter
GMmask = GMmask_full > 0.2 & ~WMmask;     % threshold for GM mask is more relaxed (20% probability of being GM, and not recognized as WM), for regions with very thin GM such as the top of the brain (otherwise we'll have holes in the mask)
WM_voxels = find(WMmask>0); 
GM_voxels = find(GMmask>0);


%% Removal of parts of the mask for which functional data exists only in <80% of subjects, such as the spinal cord 
threshold_notnan = 0.8;     % 80% of voxels need to be not NaN for each voxel to be included in the mask

% defining the directory with average functional data of all subjects,
% arranged in separate directories for each subject
func_dir = 'D:\CC_DTI\rest\rest1\';%%% input the path of all functional images with finishing all preprocessing steps
mean_func_prefix = 'w';     % leave blank ('') for un-normalized images

% reading these files and counting how many subjects have data in each voxel
num_subjs_notnan_WM = zeros(length(WM_voxels),1); 
num_subjs_notnan_GM = zeros(length(GM_voxels),1);
for subj=1:num_subjs
    subj
    % reading the current subject's mean functional file
    if ~isempty(dir(fullfile(fullfile(func_dir,subjects(subj).name),[mean_func_prefix '*.nii'])))
        curr_filename = dir(fullfile(fullfile(func_dir,subjects(subj).name),[mean_func_prefix '*.nii']));
    elseif ~isempty(dir(fullfile(fullfile(func_dir,subjects(subj).name),[mean_func_prefix '*.img'])))
        curr_filename = dir(fullfile(fullfile(func_dir,subjects(subj).name),[mean_func_prefix '*.img']));
    else
        disp('No average functional image found!')
        break;
    end
    curr_mean_func = spm_read_vols(spm_vol(fullfile(fullfile(func_dir,subjects(subj).name),curr_filename(1).name)));  % loading the subjects' mean functional image
    
    % current subject - finding voxels which are not zero or NaN
    WM_voxels_with_data = find(curr_mean_func(WM_voxels)~=0 & ~isnan(curr_mean_func(WM_voxels)));
    GM_voxels_with_data = find(curr_mean_func(GM_voxels)~=0 & ~isnan(curr_mean_func(GM_voxels)));
    
    % counting, for each voxel, in how many subjects it is "good"
    num_subjs_notnan_WM(WM_voxels_with_data) = num_subjs_notnan_WM(WM_voxels_with_data) + 1;
    num_subjs_notnan_GM(GM_voxels_with_data) = num_subjs_notnan_GM(GM_voxels_with_data) + 1;
    clear curr_mean_func;
end

% Removing voxels with <80% subjects in which they are not NaN
WM_voxels(num_subjs_notnan_WM < threshold_notnan*num_subjs) = []; 
GM_voxels(num_subjs_notnan_GM < threshold_notnan*num_subjs) = [];
WMmask = zeros(size(WMmask)); WMmask(WM_voxels) = 1; 
GMmask = zeros(size(GMmask)); GMmask(GM_voxels) = 1;


%% Saving the resulting masks
save_mat_to_nifti([func_img1_filename], WMmask, 'D:\CC_DTI\rest\mask\WMmask_allsubjs_buckner.nii');
save_mat_to_nifti([func_img1_filename], GMmask, 'D:\CC_DTI\rest\mask\GMmask_allsubjs_buckner.nii');
%%%% set output path



