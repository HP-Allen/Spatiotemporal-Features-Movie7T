clear
clc

load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/ROILevel/sFC_MovieDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/ROILevel/sFC_MovieDay2');

dim = size(sFC_MovieDay1);
type='1-1';

for roii = 1:dim(2)
    for roij = 1:roii
        if roij == roii
            ICC_sFC_Movie_GM(roii,roij) = NaN;
            continue
        end
        M=[sFC_MovieDay1(:,roii,roij),sFC_MovieDay2(:,roii,roij)];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_sFC_Movie_GM(roii,roij) = r;
    end
end

ICC_sFC_Movie_GM = ICC_sFC_Movie_GM+transpose(tril(ICC_sFC_Movie_GM,-1));

save('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/ROILevel/ICC_sFC_Movie_GM','ICC_sFC_Movie_GM');



