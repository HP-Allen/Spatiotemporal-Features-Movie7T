clear
clc

Day = 2;

for dayi = 1:Day

    if Day ==1
        rest_num1 = 1;
        rest_num2 = 2;
    else
        rest_num1 = 3;
        rest_num2 = 4;
    end

    subfolder  = dir(['/home/brain/HuPeng_Project/Analysis/Preproc/Rest' num2str(rest_num1) '/FunImgRCDFSW']); subfolder(1:2) = [];

    for subi = 1:length(subfolder)
        tic
        disp(['Now running sub' num2str(subi) '......']);
        [Data1, Header1] = y_Read(['/home/brain/HuPeng_Project/Analysis/Preproc/Rest' num2str(rest_num1) '/FunImgRCDFSW/' subfolder(subi).name '/wsGMWM_func_data.nii']);
        [Data2, Header2] = y_Read(['/home/brain/HuPeng_Project/Analysis/Preproc/Rest' num2str(rest_num2) '/FunImgRCDFSW/' subfolder(subi).name '/wsGMWM_func_data.nii']);

        Day_image = [];
        Day_image = cat(4,Day_image,Data1);
        Day_image = cat(4,Day_image,Data2);

        filename = ['/home/brain/HuPeng_Project/Analysis/Preproc/Rest_Day' num2str(Day) '/' subfolder(subi).name '/Day' num2str(Day) '_rest_data.nii'];
        H = Header1;
        H.fname = filename;
        H.dim = size(Day_image);
        mkdir(['/home/brain/HuPeng_Project/Analysis/Preproc/Rest_Day' num2str(Day) '/' subfolder(subi).name]);
        y_Write(Day_image,H,filename);
        toc
    end
    
end