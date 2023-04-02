clear
clc

load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/NetworkLevel/ICC_sISFC_Rest_GMandWM');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/NetworkLevel/ICC_sISFC_Movie_GMandWM');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/NetworkLevel/ICC_dISFC_Rest_GMandWM');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/NetworkLevel/ICC_dISFC_Movie_GMandWM');

image_dim = size(ICC_sISFC_Rest_GMandWM);
ICC_sISFC_Movie_GMandWM_vector = reshape(ICC_sISFC_Movie_GMandWM, image_dim(1)*image_dim(2),1);
ICC_sISFC_Rest_GMandWM_vector = reshape(ICC_sISFC_Rest_GMandWM, image_dim(1)*image_dim(2),1);
sISFC_difference_Movie_Rest = mean(ICC_sISFC_Movie_GMandWM_vector) - mean(ICC_sISFC_Rest_GMandWM_vector);

ICC_dISFC_Movie_GMandWM_vector = reshape(ICC_dISFC_Movie_GMandWM, image_dim(1)*image_dim(2),1);
ICC_dISFC_Rest_GMandWM_vector = reshape(ICC_dISFC_Rest_GMandWM, image_dim(1)*image_dim(2),1);
dISFC_difference_Movie_Rest = mean(ICC_dISFC_Movie_GMandWM_vector) - mean(ICC_dISFC_Rest_GMandWM_vector);

vectorsize = size(ICC_sISFC_Movie_GMandWM_vector);
iterNum = 5000;
sISFC_count = 0;
dISFC_count = 0;

for iter = 1:iterNum
    
    ICC_sISFC_Movie_Rest_vector = [ICC_sISFC_Movie_GMandWM_vector;ICC_sISFC_Rest_GMandWM_vector];
   
    idx = randperm(vectorsize(1)*2)';
     
    ICC_sISFC_Movie_Rest_vector_shuffle = ICC_sISFC_Movie_Rest_vector(idx);
    
    sISFC_difference_Movie_Rest_shuffle = mean(ICC_sISFC_Movie_Rest_vector_shuffle(1:vectorsize(1)))-mean(ICC_sISFC_Movie_Rest_vector_shuffle(vectorsize(1)+1:end));
    
    if sISFC_difference_Movie_Rest < sISFC_difference_Movie_Rest_shuffle
        sISFC_count = sISFC_count + 1;
    end
    
    
    ICC_dISFC_Movie_Rest_vector = [ICC_dISFC_Movie_GMandWM_vector;ICC_dISFC_Rest_GMandWM_vector];
   
    idx = randperm(vectorsize(1)*2)';
     
    ICC_dISFC_Movie_Rest_vector_shuffle = ICC_dISFC_Movie_Rest_vector(idx);
    
    dISFC_difference_Movie_Rest_shuffle = mean(ICC_dISFC_Movie_Rest_vector_shuffle(1:vectorsize(1)))-mean(ICC_dISFC_Movie_Rest_vector_shuffle(vectorsize(1)+1:end));
    
    if dISFC_difference_Movie_Rest < dISFC_difference_Movie_Rest_shuffle
        dISFC_count = dISFC_count + 1;
    end
end

sISFC_p = sISFC_count / iterNum;
dISFC_p = dISFC_count / iterNum;




