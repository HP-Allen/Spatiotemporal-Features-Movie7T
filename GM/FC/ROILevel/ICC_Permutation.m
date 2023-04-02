clear
clc

load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/ROILevel/ICC_sFC_Rest_GM');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/ROILevel/ICC_sFC_Movie_GM');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/ROILevel/ICC_dFC_Rest_GM');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/ROILevel/ICC_dFC_Movie_GM');

image_dim = size(ICC_sFC_Rest_GM);
tmp = ones(image_dim(1),image_dim(2));
tmp = triu(tmp,1);

ICC_sFC_Movie_GM_vector = ICC_sFC_Movie_GM(tmp==1);
ICC_sFC_Rest_GM_vector = ICC_sFC_Rest_GM(tmp==1);
sFC_difference_Movie_Rest = mean(ICC_sFC_Movie_GM_vector) - mean(ICC_sFC_Rest_GM_vector);

ICC_dFC_Movie_GM_vector = ICC_dFC_Movie_GM(tmp==1);
ICC_dFC_Rest_GM_vector = ICC_dFC_Rest_GM(tmp==1);
dFC_difference_Movie_Rest = mean(ICC_dFC_Movie_GM_vector) - mean(ICC_dFC_Rest_GM_vector);

vectorsize = size(ICC_sFC_Movie_GM_vector);
iterNum = 5000;
sFC_count = 0;
dFC_count = 0;

for iter = 1:iterNum
    
    ICC_sFC_Movie_Rest_vector = [ICC_sFC_Movie_GM_vector;ICC_sFC_Rest_GM_vector];
   
    idx = randperm(vectorsize(1)*2)';
     
    ICC_sFC_Movie_Rest_vector_shuffle = ICC_sFC_Movie_Rest_vector(idx);
    
    sFC_difference_Movie_Rest_shuffle = mean(ICC_sFC_Movie_Rest_vector_shuffle(1:vectorsize(1)))-mean(ICC_sFC_Movie_Rest_vector_shuffle(vectorsize(1)+1:end));
    
    if sFC_difference_Movie_Rest < sFC_difference_Movie_Rest_shuffle
        sFC_count = sFC_count + 1;
    end
    
    
    ICC_dFC_Movie_Rest_vector = [ICC_dFC_Movie_GM_vector;ICC_dFC_Rest_GM_vector];
   
    idx = randperm(vectorsize(1)*2)';
     
    ICC_dFC_Movie_Rest_vector_shuffle = ICC_dFC_Movie_Rest_vector(idx);
    
    dFC_difference_Movie_Rest_shuffle = mean(ICC_dFC_Movie_Rest_vector_shuffle(1:vectorsize(1)))-mean(ICC_dFC_Movie_Rest_vector_shuffle(vectorsize(1)+1:end));
    
    if dFC_difference_Movie_Rest < dFC_difference_Movie_Rest_shuffle
        dFC_count = dFC_count + 1;
    end
end

sFC_p = sFC_count / iterNum;
dFC_p = dFC_count / iterNum;




