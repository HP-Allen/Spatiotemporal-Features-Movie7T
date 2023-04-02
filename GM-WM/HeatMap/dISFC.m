clear;
% clc;
tic;

load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/dISFC_subpair_MovieDay1.mat')
load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/dISFC_subpair_RestDay1.mat')

[subn,subm,netn,netm] = size(dISFC_subpair_MovieDay1);

x = [];
y = [];
for i = 1:netn
    disp(i);
    parfor j = 1:netm
        x1 = [];
        x1 = dISFC_subpair_MovieDay1(:,:,i,j);
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

scatplot(x,y,'circles', sqrt((range(x)/30)^2 + (range(y)/30)^2), 100, 5, 1, 8);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/Heatmap/dISFC.jpg');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/Heatmap/dISFC.fig');

close all;

toc;











