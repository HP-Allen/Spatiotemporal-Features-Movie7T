clear
clc

load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/sFC_RestDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/sFC_RestDay2');

dim = size(sFC_RestDay1);
type='1-1';

for roii = 1:dim(2)
    for roij = 1:roii
        if roij == roii
            ICC_sFC_Rest_WM(roii,roij) = NaN;
            continue
        end
        M=[sFC_RestDay1(:,roii,roij),sFC_RestDay2(:,roii,roij)];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_sFC_Rest_WM(roii,roij) = r;
    end
end

ICC_sFC_Rest_WM = ICC_sFC_Rest_WM+transpose(tril(ICC_sFC_Rest_WM,-1));

save('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/ROILevel/ICC_sFC_Rest_WM','ICC_sFC_Rest_WM');

