clear
clc

load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/sFC_RestDay1');
load('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/sFC_RestDay2');

dim = size(sFC_RestDay1);
type='1-1';

for neti = 1:dim(2)
    for netj = 1:neti
        if netj == neti
            ICC_sFC_Rest_WM(neti,netj) = NaN;
            continue
        end
        M=[sFC_RestDay1(:,neti,netj),sFC_RestDay2(:,neti,netj)];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_sFC_Rest_WM(neti,netj) = r;
    end
end

ICC_sFC_Rest_WM = ICC_sFC_Rest_WM+transpose(tril(ICC_sFC_Rest_WM,-1));

save('/media/brain/data/HuPeng_Project/Movie/Analysis/WM/FC/NetworkLevel/ICC_sFC_Rest_WM','ICC_sFC_Rest_WM');

