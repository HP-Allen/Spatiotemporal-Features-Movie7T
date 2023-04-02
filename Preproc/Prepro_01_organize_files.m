% Unzip .gz files into .nii image files
clear

project_path = 'F:/HCP/';

data_path = 'F:/HCP/Data/';
datafolder = dir(data_path); datafolder(1:2) = [];

output_path = [project_path 'Analysis/'];

% fMRI
for datatype = 1:length(datafolder)-1
    subjfolder = dir([data_path datafolder(datatype).name '/']); subjfolder(1:2) = [];

%     for subji = 1:length(subjfolder)
    for subji = 1:3
        foldername = datafolder(datatype).name; % Movie1~4 Or Rest1~4
        
        fun_clip1 = subjfolder(subji).name; % SubjectNumber_7T_tfMRI_MOVIE1~4_unproc  Or  SubjectNumber_7T_rfMRI_REST1~4_unproc
        fun_clip2 = subjfolder(subji).name(1:6); % SubjectNumber
        fun_clip3 = subjfolder(1).name(8:9); % 7T
        fun_clip4 = dir([data_path foldername '/' fun_clip1 '/' fun_clip2 '/unprocessed/' fun_clip3 '/']);
        fun_clip4 = fun_clip4(3).name; % rfMRI_REST1~4_PA(AP) or rfMRI_MOVIE1~4_PA(AP)
        
        disp(['unzipping ' datafolder(datatype).name ' subject:' fun_clip2 ' ...']);
        mkdir([output_path datafolder(datatype).name '/' fun_clip2]);
        
        zip_path = [data_path foldername '/' fun_clip1 '/' fun_clip2 '/unprocessed/' fun_clip3 '/' fun_clip4 '/' fun_clip2 '_' fun_clip3 '_' fun_clip4 '.nii.gz'];
        unzip_path = [output_path foldername '/' fun_clip2 '/'];
        
        gunzip(zip_path,unzip_path);
    end
end

% T1
for datatype = length(datafolder)
    subjfolder = dir([data_path datafolder(datatype).name '/']); subjfolder(1:2) = [];

%     for subji = 1:length(subjfolder)
    for subji = 1:3
        foldername = datafolder(datatype).name; % T1
        
        T1_clip1 = subjfolder(subji).name; % SubjectNumber_3T_Structural_unproc
        T1_clip2 = subjfolder(subji).name(1:6); % SubjectNumber
        T1_clip3 = subjfolder(1).name(8:9);  % 3T
        T1_clip4 = 'T1w_MPR1';
        
        disp(['unzipping ' datafolder(datatype).name ' subject:' T1_clip2 ' ...']);
        mkdir([output_path datafolder(datatype).name '/' T1_clip2]);
        
        zip_path = [data_path foldername '/' T1_clip1 '/' T1_clip2 '/unprocessed/' T1_clip3 '/' T1_clip4 '/' T1_clip2 '_' T1_clip3  '_' T1_clip4 '.nii.gz'];
        unzip_path = [output_path foldername '/' T1_clip2 '/'];
        
        gunzip(zip_path,unzip_path);
    end
end