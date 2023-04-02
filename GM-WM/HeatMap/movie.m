clear;
clc;
tic;

load('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/sFC_MovieDay1.mat')
load('/home/brain/HuPeng_Project/Analysis/GMandWM/FC/NetworkLevel/dFC_MovieDay1.mat')

% Extrating lower triangular (The upper triangular matrix is empty) for
% ROI x ROI
tmp = ones(size(sFC_MovieDay1,2:3));
tmp = triu(tmp);
tmp1(1,:,:) = tmp;
tmp1 = repmat(tmp1,[172,1,1]);
sFC_MovieDay1(tmp1==1) = [];
dFC_MovieDay1(tmp1==1) = [];

scatplot(sFC_MovieDay1,dFC_MovieDay1,'circles', ...
sqrt((range(sFC_MovieDay1)/30)^2 + (range(dFC_MovieDay1)/30)^2), 100, 5, 1, 8);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/Heatmap/Movie_FC.jpg');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/Heatmap/Movie_FC.fig');

close all;

toc;

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%                                        ISFC
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

clear
tic;

load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/sISFC_subpair_MovieDay1_r.mat')
load('/home/brain/HuPeng_Project/Analysis/GMandWM/ISFC/NetworkLevel/dISFC_subpair_MovieDay1.mat')

[subn,subm,netn,netm] = size(sISFC_subpair_MovieDay1_r);

x = [];
y = [];
for i = 1:netn
    disp(i);
    parfor j = 1:netm
        x1 = [];
        x1 = sISFC_subpair_MovieDay1_r(:,:,i,j);
        tmp1 = diag(diag(ones(subn,subn)));
        x1(tmp1==1) = [];
        x = [x , x1];
        
        y1 = [];
        y1 = dISFC_subpair_MovieDay1(:,:,i,j);
        tmp1 = diag(diag(ones(subn,subn)));
        y1(tmp1==1) = [];
        y = [y , y1];
    end
end

scatplot(x,y,'circles',...
sqrt((range(x)/30)^2 + (range(y)/30)^2), 100, 5, 1, 8);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/Heatmap/Movie_ISFC.jpg');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GMandWM/Heatmap/Movie_ISFC.fig');

close all;

toc;






