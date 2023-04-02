clear
clc

movie_clip_timing(1,1:10) = [245 264 487 506 695 714 779 798 882 901];
movie_clip_timing(2,1:8) = [228 247 507 526 776 795 879 898];
movie_clip_timing(3,1:10) = [182 201 387 406 611 630 773 792 876 895];
movie_clip_timing(4,1:8) = [234 253 484 503 759 778 862 881];

for movie_num = 3:4

    subfolder  = dir(['/home/brain/HuPeng_Project/Analysis/Preproc/Movie' num2str(movie_num) '/FunImgRCDFSW']); subfolder(1:2) = [];

    for subi = 1:length(subfolder)
        tic
        disp(['Now running Movie' num2str(movie_num) ' sub' num2str(subi) '......']);
        [Data, Header] = y_Read(['/home/brain/HuPeng_Project/Analysis/Preproc/Movie' num2str(movie_num) '/FunImgRCDFSW/' subfolder(subi).name '/wsGMWM_func_data.nii']);
        rmrest_image = Data;

        if mod(movie_num,2) == 1
            rmrest_image(:,:,:,movie_clip_timing(movie_num,9):movie_clip_timing(movie_num,10)) = [];
        end
        rmrest_image(:,:,:,movie_clip_timing(movie_num,7):movie_clip_timing(movie_num,8)) = [];
        rmrest_image(:,:,:,movie_clip_timing(movie_num,5):movie_clip_timing(movie_num,6)) = [];
        rmrest_image(:,:,:,movie_clip_timing(movie_num,3):movie_clip_timing(movie_num,4)) = [];
        rmrest_image(:,:,:,movie_clip_timing(movie_num,1):movie_clip_timing(movie_num,2)) = [];

        filename = ['/home/brain/HuPeng_Project/Analysis/Preproc/Movie' num2str(movie_num) '/FunImgRCDFSWrmrest/' subfolder(subi).name '/rmrest_movie_data.nii'];
        H = Header;
        H.fname = filename;
        H.dim = size(rmrest_image);
        mkdir(['/home/brain/HuPeng_Project/Analysis/Preproc/Movie' num2str(movie_num) '/FunImgRCDFSWrmrest/' subfolder(subi).name]);
        y_Write(rmrest_image,H,filename);
        toc
    end

end