clear;
clc;
tic;

load('/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/sFC_RestDay1.mat')
load('/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/dFC_RestDay1.mat')

% Extrating lower triangular (The upper triangular matrix is empty) for
% ROI x ROI
tmp = ones(size(sFC_RestDay1,2:3));
tmp = triu(tmp);
tmp1(1,:,:) = tmp;
tmp1 = repmat(tmp1,[172,1,1]);
sFC_RestDay1(tmp1==1) = [];
dFC_RestDay1(tmp1==1) = [];

scatplot(sFC_RestDay1,dFC_RestDay1,'circles', ...
sqrt((range(sFC_RestDay1)/30)^2 + (range(dFC_RestDay1)/30)^2), 100, 5, 1, 8);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/Heatmap/Rest_FC.jpg');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/Heatmap/Rest_FC.fig');

close all;

toc;

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%                                        ISFC
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


clear
tic;

load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/sISFC_subpair_RestDay1_r.mat')
load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/dISFC_subpair_RestDay1.mat')

[subn,subm,netn,netm] = size(sISFC_subpair_RestDay1_r);

x = [];
y = [];
for i = 1:netn
    disp(i);
    parfor j = 1:i
        x1 = [];
        x1 = sISFC_subpair_RestDay1_r(:,:,i,j);
        tmp1 = diag(diag(ones(subn,subn)));
        x1(tmp1==1) = [];
        x = [x , x1];
        
        y1 = [];
        y1 = dISFC_subpair_RestDay1(:,:,i,j);
        tmp1 = diag(diag(ones(subn,subn)));
        y1(tmp1==1) = [];
        y = [y , y1];
    end
end

scatplot(x,y,'circles',...
sqrt((range(x)/30)^2 + (range(y)/30)^2), 100, 5, 1, 8);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/Heatmap/Rest_ISFC.jpg');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/Heatmap/Rest_ISFC.fig');

close all;

toc;








