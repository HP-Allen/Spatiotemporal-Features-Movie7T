clear
clc
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/sFC_MovieDay1.mat')
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/dFC_MovieDay1.mat')

% Extrating lower triangular (The upper triangular matrix is empty) for
% ROI x ROI
tmp = ones(size(sFC_MovieDay1,2:3));
tmp = triu(tmp);
tmp1(1,:,:) = tmp;
tmp1 = repmat(tmp1,[172,1,1]);
sFC_MovieDay1(tmp1==1) = [];
dFC_MovieDay1(tmp1==1) = [];

[r,p] = corr(sFC_MovieDay1',dFC_MovieDay1');

open('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/Heatmap/Movie_FC.fig')

text(-0.4,0.15,'r=-0.6601 p<0.0001','FontName','Times New Roman','FontWeight','bold');
xlabel('sFC');
ylabel('dFC');
set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/Heatmap/Movie_FC.fig');

close all



clear
clc
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/sFC_RestDay1.mat')
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/FC/NetworkLevel/dFC_RestDay1.mat')

% Extrating lower triangular (The upper triangular matrix is empty) for
% ROI x ROI
tmp = ones(size(sFC_RestDay1,2:3));
tmp = triu(tmp);
tmp1(1,:,:) = tmp;
tmp1 = repmat(tmp1,[172,1,1]);
sFC_RestDay1(tmp1==1) = [];
dFC_RestDay1(tmp1==1) = [];

[r,p] = corr(sFC_RestDay1',dFC_RestDay1');

open('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/Heatmap/Rest_FC.fig')

text(-0.7,0.2,'r=-0.5905 p<0.0001','FontName','Times New Roman','FontWeight','bold');
xlabel('sFC');
ylabel('dFC');
set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/Heatmap/Rest_FC.fig');

close all




clear
tic;

load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/ISFC/NetworkLevel/sISFC_subpair_MovieDay1_r.mat')
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/ISFC/NetworkLevel/dISFC_subpair_MovieDay1.mat')

[subn,subm,netn,netm] = size(sISFC_subpair_MovieDay1_r);

x = [];
y = [];
for i = 1:netn
    disp(i);
    for j = 1:i
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

[r,p] = corr(x',y');

open('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/Heatmap/Movie_ISFC.fig');

text(-0.5,0.25,'r=-0.2482 p<0.0001','FontName','Times New Roman','FontWeight','bold');
xlabel('sISFC');
ylabel('dISFC');
set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/Heatmap/Movie_ISFC.fig');

close all



clear
tic;

load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/ISFC/NetworkLevel/sISFC_subpair_RestDay1_r.mat')
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/ISFC/NetworkLevel/dISFC_subpair_RestDay1.mat')

[subn,subm,netn,netm] = size(sISFC_subpair_RestDay1_r);

x = [];
y = [];
for i = 1:netn
    disp(i);
    for j = 1:i
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

[r,p] = corr(x',y');

open('/media/brain/data/HuPeng_Project/Movie/Analysis/GM/Heatmap/Rest_ISFC.fig');

text(-0.35,0.57,'r=0.0019 p=0.0551','FontName','Times New Roman','FontWeight','bold');
xlabel('sISFC');
ylabel('dISFC');
set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM/Heatmap/Rest_ISFC.fig');

close all