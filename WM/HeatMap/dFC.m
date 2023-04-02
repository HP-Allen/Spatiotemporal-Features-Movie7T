clear;
% clc;
tic;

load('/home/brain/HuPeng_Project/Analysis/WM/FC/NetworkLevel/dFC_MovieDay1.mat')
load('/home/brain/HuPeng_Project/Analysis/WM/FC/NetworkLevel/dFC_RestDay1.mat')

[subn,netn,netm] = size(dFC_MovieDay1);

x = reshape(dFC_MovieDay1,subn*netn*netm,1);
y = reshape(dFC_RestDay1,subn*netn*netm,1);

scatplot(x,y,'circles', sqrt((range(x)/30)^2 + (range(y)/30)^2), 100, 5, 1, 8);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/Heatmap/dFC.jpg');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/WM/Heatmap/dFC.fig');

close all;

toc;











