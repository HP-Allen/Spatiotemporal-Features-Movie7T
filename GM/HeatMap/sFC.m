clear;
% clc;
tic;

load('/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/sFC_MovieDay1.mat')
load('/home/brain/HuPeng_Project/Analysis/GM/FC/NetworkLevel/sFC_RestDay1.mat')

[subn,netn,netm] = size(sFC_MovieDay1);

x = tanh(reshape(sFC_MovieDay1,[subn*netn*netm,1]));
y = tanh(reshape(sFC_RestDay1,[subn*netn*netm,1]));

scatplot(x,y,'circles', sqrt((range(x)/30)^2 + (range(y)/30)^2), 100, 5, 1, 8);

saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/Heatmap/sFC.jpg');
saveas(gcf,'/home/brain/HuPeng_Project/Analysis/GM/Heatmap/sFC.fig');

close all;

toc;











