clear
clc

load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/dFC_MovieDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/dFC_MovieDay2');

[~,netn,netm] = size(dFC_MovieDay1);
type='1-1';

for neti = 1:netn
    for netj = 1:netm
        M=[dFC_MovieDay1(:,neti,netj),dFC_MovieDay2(:,neti,netj)];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_dFC_Movie_GMandWM(neti,netj) = r;
    end
end

save('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/ICC_dFC_Movie_GMandWM','ICC_dFC_Movie_GMandWM');



