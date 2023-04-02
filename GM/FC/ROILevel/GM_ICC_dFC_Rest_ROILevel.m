clear
clc

load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/ROILevel/dFC_RestDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/ROILevel/dFC_RestDay2');

dim = size(dFC_RestDay1);
type='1-1';

for roii = 1:dim(2)
    for roij = 1:roii
        if roij == roii
            ICC_dFC_Rest_GM(roii,roij) = NaN;
            continue
        end
        M=[dFC_RestDay1(:,roii,roij),dFC_RestDay2(:,roii,roij)];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_dFC_Rest_GM(roii,roij) = r;
    end
end

ICC_dFC_Rest_GM = ICC_dFC_Rest_GM+transpose(tril(ICC_dFC_Rest_GM,-1));

save('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/ROILevel/ICC_dFC_Rest_GM','ICC_dFC_Rest_GM');

