clear
clc

movie_clip_timing(1,1:10) = [245 264 487 506 695 714 779 798 882 901];
movie_clip_timing(2,1:8) = [228 247 507 526 776 795 879 898];
movie_clip_timing(3,1:10) = [182 201 387 406 611 630 773 792 876 895];
movie_clip_timing(4,1:8) = [234 253 484 503 759 778 862 881];

Day = 2;

if Day ==1
    movie_num1 = 1;
    movie_num2 = 2;
else
    movie_num1 = 3;
    movie_num2 = 4;
end

subfolder  = dir(['/home/brain/HuPeng_Project/Analysis/Preproc/Movie' num2str(movie_num1) '/FunImgRCDFSWrmrest']); subfolder(1:2) = [];

for subi = 1:length(subfolder)
    tic
    disp(['Now running sub' num2str(subi) '......']);
    [Data1, Header1] = y_Read(['/home/brain/HuPeng_Project/Analysis/Preproc/Movie' num2str(movie_num1) '/FunImgRCDFSWrmrest/' subfolder(subi).name '/rmrest_movie_data.nii']);
    [Data2, Header2] = y_Read(['/home/brain/HuPeng_Project/Analysis/Preproc/Movie' num2str(movie_num2) '/FunImgRCDFSWrmrest/' subfolder(subi).name '/rmrest_movie_data.nii']);

    Day_image = [];
    Day_image = cat(4,Day_image,Data1);
    Day_image = cat(4,Day_image,Data2);

    filename = ['/home/brain/HuPeng_Project/Analysis/Preproc/Movie_Day' num2str(Day) '/' subfolder(subi).name '/Day' num2str(Day) '_movie_data.nii'];
    H = Header1;
    H.fname = filename;
    H.dim = size(Day_image);
    mkdir(['/home/brain/HuPeng_Project/Analysis/Preproc/Movie_Day' num2str(Day) '/' subfolder(subi).name]);
    y_Write(Day_image,H,filename);
    toc
end

