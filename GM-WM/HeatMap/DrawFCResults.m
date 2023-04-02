clear
clc
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/sFC_MovieDay1.mat')
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/sFC_RestDay1.mat')

[subn,netn,netm] = size(sFC_MovieDay1);

x = reshape(sFC_MovieDay1,[subn*netn*netm,1]);
y = reshape(sFC_RestDay1,[subn*netn*netm,1]);

[r,p] = corr(x,y);

open('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/Heatmap/sFC.fig')

text(0.3,-0.7,'r=0.8171 p<0.0001','FontName','Times New Roman','FontWeight','bold');
xlabel('Movie');
ylabel('Rest');
set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/Heatmap/sFC.fig');

close all


clear
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/dFC_MovieDay1.mat')
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/FC/NetworkLevel/dFC_RestDay1.mat')

[subn,netn,netm] = size(dFC_MovieDay1);

x = reshape(dFC_MovieDay1,[subn*netn*netm,1]);
y = reshape(dFC_RestDay1,[subn*netn*netm,1]);

[r,p] = corr(x,y);

open('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/Heatmap/dFC.fig')

text(0.05,0.67,'r=0.7472 p<0.0001','FontName','Times New Roman','FontWeight','bold');
xlabel('Movie');
ylabel('Rest');
set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/Heatmap/dFC.fig');

close all

clear
clc
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/NetworkLevel/sISFC_subpair_MovieDay1_r.mat')
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/NetworkLevel/sISFC_subpair_RestDay1_r.mat')

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
        y1 = sISFC_subpair_RestDay1_r(:,:,i,j);
        tmp1 = diag(diag(ones(subn,subn)));
        y1(tmp1==1) = [];
        y = [y , y1];
    end
end

[r,p] = corr(x',y');

open('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/Heatmap/sISFC.fig')

text(-0.5,0.35,'r=-0.0013 p=0.1758','FontName','Times New Roman','FontWeight','bold');
xlabel('Movie');
ylabel('Rest');
set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/Heatmap/sISFC.fig');

close all



clear
clc
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/NetworkLevel/dISFC_subpair_MovieDay1.mat')
load('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/ISFC/NetworkLevel/dISFC_subpair_RestDay1.mat')

[subn,subm,netn,netm] = size(dISFC_subpair_MovieDay1);

x = [];
y = [];
for i = 1:netn
    disp(i);
    for j = 1:i
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
[r,p] = corr(x',y');

open('/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/Heatmap/dISFC.fig')

text(0.22,0.57,'r=0.0902 p<0.0001','FontName','Times New Roman','FontWeight','bold');
xlabel('Movie');
ylabel('Rest');
set(gca,'FontName','Times New Roman','FontWeight','bold');

saveas(gcf,'/media/brain/data/HuPeng_Project/Movie/Analysis/GM-WM/Heatmap/dISFC.fig');

close all