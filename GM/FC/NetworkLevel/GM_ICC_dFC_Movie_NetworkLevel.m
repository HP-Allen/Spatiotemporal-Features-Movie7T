clear
clc

load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/dFC_MovieDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/dFC_MovieDay2');

dim = size(dFC_MovieDay1);
type='1-1';
for neti = 1:dim(2)
    for netj = 1:neti
        if netj == neti
            ICC_dFC_Movie_GM(neti,netj) = NaN;
            continue
        end
        M=[dFC_MovieDay1(:,neti,netj),dFC_MovieDay2(:,neti,netj)];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_dFC_Movie_GM(neti,netj) = r;
    end
end

ICC_dFC_Movie_GM = ICC_dFC_Movie_GM+transpose(tril(ICC_dFC_Movie_GM,-1));

save('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/ICC_dFC_Movie_GM','ICC_dFC_Movie_GM');



