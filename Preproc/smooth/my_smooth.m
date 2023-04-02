clear
clc

Data_type = ["Movie1";"Movie1";"Movie3";"Movie4";"Rest1";"Rest2";"Rest3";"Rest4"];

for typei = 1:length(Data_type)

    T1_path = ['/home/brain/HuPeng_Project/Analysis/Preproc/' char(Data_type(typei)) '/T1ImgNewSegment'];
    Fun_path = ['/home/brain/HuPeng_Project/Analysis/Preproc/' char(Data_type(typei)) '/FunImgRCDF'];
    output_path = ['/home/brain/HuPeng_Project/Analysis/Preproc/' char(Data_type(typei)) '/FunImgRCDFS'];
    GM_filename_prefix = 'c1';
    WM_filename_prefix = 'c2';
    gaussian_FWHM = '4mm';

    T1_dir = dir(T1_path); T1_dir(1:2)=[];
    Fun_dir = dir(Fun_path);Fun_dir(1:2)=[];

    
    for isub = 1:length(Fun_dir)
        disp(['Now running ' char(Data_type(typei)) ' sub' num2str(isub) '......']);
        tic
        sub_name = Fun_dir(isub).name;
        functional_dir = fullfile(Fun_path,sub_name);
        segmentation_dir = fullfile(T1_path,sub_name);
        output_dir = fullfile(output_path,sub_name);
        smooth_WM_GM_separately(functional_dir, segmentation_dir, output_dir, gaussian_FWHM, GM_filename_prefix, WM_filename_prefix); 
        toc
    end

end

