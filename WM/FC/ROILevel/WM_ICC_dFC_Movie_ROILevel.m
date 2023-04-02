clear
clc

load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/dFC_MovieDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/dFC_MovieDay2');

dim = size(dFC_MovieDay1);
type='1-1';

for roii = 1:dim(2)
    for roij = 1:roii
        if roij == roii
            ICC_dFC_Movie_WM(roii,roij) = NaN;
            continue
        end
        M=[dFC_MovieDay1(:,roii,roij),dFC_MovieDay2(:,roii,roij)];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_dFC_Movie_WM(roii,roij) = r;
    end
end

ICC_dFC_Movie_WM = ICC_dFC_Movie_WM+transpose(tril(ICC_dFC_Movie_WM,-1));

save('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/ICC_dFC_Movie_WM','ICC_dFC_Movie_WM');



