function smooth_WM_GM_separately(functional_dir, segmentation_dir, output_dir, gaussian_FWHM, GM_filename_prefix, WM_filename_prefix)
%
% smooth_WM_GM_separately(functional_dir, segmentation_dir, output_dir, gaussian_FWHM, GM_filename_prefix, WM_filename_prefix)
%
% input:
% functional_dir - directory with functional files (preferably after slice-timing correction, motion correction, covariates regression, filtering)
% segmentation_dir - directory with segmentation results (grey-matter, white-matter)
% output_dir - directory to put the new files in
% gaussian_FWHM - full width at half maximum of the smoothing Gaussian kernel in millimeters (e.g. 4mm, 8mm)
% GM_filename_prefix - the prefix of the grey-matter file in the segmentation directory (e.g. 'wc1' for normalized grey-matter from SPM)
% WM_filename_prefix - the prefix of the white-matter file in the segmentation directory (e.g. 'wc2' for normalized white-matter from SPM)
%
% Michael Peer, April 2017


GM_WM_threshold = 0.5;

% Creating the output directory if not existing
if ~exist(output_dir,'dir'), mkdir(output_dir); end
 
% Getting the filenames of the segmentation files
GM_filename = dir(fullfile(segmentation_dir,[GM_filename_prefix '*']));
WM_filename = dir(fullfile(segmentation_dir,[WM_filename_prefix '*']));
GM_filename = fullfile(segmentation_dir,GM_filename(1).name);
WM_filename = fullfile(segmentation_dir,WM_filename(1).name);

% loading a functional image for later resampling to that image's resolution
func_image_1 = dir(functional_dir);
func_image_1 = fullfile(functional_dir,func_image_1(3).name);

% loading the data and reslicing the anatomical images to functional resolution
GM_image = reslice_data(GM_filename, func_image_1, 1);
WM_image = reslice_data(WM_filename, func_image_1, 1);

% loading all of the functional data
func_mat = get_func_matrix(functional_dir);     

% saving functional images with only the WM voxels and GM voxels separately in the output directory
GM_func_mat = zeros(size(func_mat)); WM_func_mat = zeros(size(func_mat)); 
for i=1:size(func_mat,4)    % go over all timepoints (volumes)
    curr_volume_data = func_mat(:,:,:,i);          % choosing the current time-point (volume)
    curr_volume_data(GM_image<GM_WM_threshold)=0;  % voxel is above threshold for being grey-matter 
    curr_volume_data(WM_image>=GM_WM_threshold)=0; % voxel is also below threshold for being grey-matter
    GM_func_mat(:,:,:,i) = curr_volume_data;       % taking only the grey-matter from the current functional image

    curr_volume_data = func_mat(:,:,:,i);          % choosing the current time-point (volume)
    curr_volume_data(WM_image<GM_WM_threshold)=0;  % voxel is above threshold for being white-matter 
    curr_volume_data(GM_image>=GM_WM_threshold)=0; % voxel is also below threshold for being white-matter
    WM_func_mat(:,:,:,i) = curr_volume_data;       % taking only the white-matter from the current functional image
    
    clear current_volume_data;
end
% saving the images using DPABI's y_Write function
y_Write(GM_func_mat,spm_vol([func_image_1 ',1']),fullfile(output_dir,'GM_func_data.nii'));
y_Write(WM_func_mat,spm_vol([func_image_1 ',1']),fullfile(output_dir,'WM_func_data.nii'));

clear GM_func_mat WM_func_mat 
% clear GM_image WM_image

% applying smoothing using SPM's smooth function
spm('defaults','fmri'); spm_jobman('initcfg');      % initializing SPM's jobman
matlabbatch={struct('spm',struct('spatial',struct('smooth',struct('data','','dtype',0,'fwhm',[gaussian_FWHM gaussian_FWHM gaussian_FWHM],'im',0,'prefix','s'))))};
matlabbatch{1}.spm.spatial.smooth.data = {fullfile(output_dir,'GM_func_data.nii')};   % grey matter smoothing
spm_jobman('run', matlabbatch);
matlabbatch{1}.spm.spatial.smooth.data = {fullfile(output_dir,'WM_func_data.nii')};   % white matter smoothing
spm_jobman('run', matlabbatch);

% loading the new smoothed images, combining them and saving
smoothed_GM_data = spm_read_vols(spm_vol(fullfile(output_dir,'sGM_func_data.nii')));
smoothed_WM_data = spm_read_vols(spm_vol(fullfile(output_dir,'sWM_func_data.nii')));
for i=1:size(func_mat,4)    % go over all timepoints (volumes)
    curr_volume_data = smoothed_GM_data(:,:,:,i);
    curr_volume_data(GM_image<GM_WM_threshold)=0;
    smoothed_GM_data(:,:,:,i) = curr_volume_data;

    curr_volume_data = smoothed_WM_data(:,:,:,i);
    curr_volume_data(WM_image<GM_WM_threshold)=0;
    smoothed_WM_data(:,:,:,i) = curr_volume_data;
end
clear func_ma curr_volume_data WM_image;
final_func_matrix = smoothed_GM_data + smoothed_WM_data;    % combining the GM and WM images
y_Write(final_func_matrix,spm_vol([func_image_1 ',1']),fullfile(output_dir,'sGMWM_func_data.nii'));   % saving the new functional matrix

% deleting the old WM/GM-only functional files
delete(fullfile(output_dir,'GM_func_data.nii')); delete(fullfile(output_dir,'WM_func_data.nii'));
delete(fullfile(output_dir,'sGM_func_data.nii')); delete(fullfile(output_dir,'sWM_func_data.nii'));


