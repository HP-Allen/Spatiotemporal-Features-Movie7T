clear
clc

load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/dISFC_subpair_MovieDay1');
load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/dISFC_subpair_MovieDay2');

dim = size(dISFC_subpair_MovieDay1);

type='1-1';
for neti = 1:dim(3)
    for netj = 1:neti
        tmp = diag(diag(ones(dim(1),dim(2))));
        tmp = reshape(tmp,dim(1)*dim(2),1);
        a = reshape(dISFC_subpair_MovieDay1(:,:,neti,netj),dim(1)*dim(2),1);
        b = reshape(dISFC_subpair_MovieDay2(:,:,neti,netj),dim(1)*dim(2),1);
        a(tmp==1) = []; b(tmp==1) = [];
        M = [a,b];
        [r, LB, UB, F, df1, df2, p] = ICC(M, type);
        ICC_dISFC_Movie_GM(neti,netj) = r;
    end
end

ICC_dISFC_Movie_GM = ICC_dISFC_Movie_GM+transpose(tril(ICC_dISFC_Movie_GM,-1));

% Draw matrix
imagesc(ICC_dISFC_Movie_GM);
colorbar;
colormap(hot);
axis off;
hold on;

% Draw lines to separate networks
tmp1 = 0:8;x1 = ones(9,size(tmp1,2)); x1 = x1.*tmp1+0.5;
tmp = 0:8; y1 = ones(9,size(tmp1,2)); y1 = y1.*tmp'+0.5;
plot(x1,y1,'k','LineWidth',1.5);
hold on;
plot(y1,x1,'k','LineWidth',1.5);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/ICC_dISFC_Movie_GM.png');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/ICC_dISFC_Movie_GM.fig');
close all;

save('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/ICC_dISFC_Movie_GM','ICC_dISFC_Movie_GM');



