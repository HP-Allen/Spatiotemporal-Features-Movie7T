clear;
% clc;
tic;

load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/sISFC_subpair_MovieDay1_r.mat')
load('/home/brain/HuPeng_Project/Analysis/GM/ISFC/NetworkLevel/sISFC_subpair_RestDay1_r.mat')

[subn,subm,netn,netm] = size(sISFC_subpair_MovieDay1_r);

x = [];
y = [];
for i = 1:netn
    disp(i);
    parfor j = 1:i
        x1 = [];
        x1 = sISFC_subpair_MovieDay1_r(:,:,i,j);
        tmp1 = diag(diag(ones(subn,subn)));
        x1(tmp1==1) = [];
        x = [x , x1];
        
        y1 = [];
        y1 = sISFC_subpair_RestDay1_r(:,:,i,j);
        tmp1 = diag(diag(ones(subn,subn)));
        y1(tmp1==1) = [];
        y = [y , y1];
    end
end


scatplot(x,y,'circles', sqrt((range(x)/30)^2 + (range(y)/30)^2), 100, 5, 1, 8);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/Heatmap/sISFC.jpg');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/Heatmap/sISFC.fig');

close all;

toc;











