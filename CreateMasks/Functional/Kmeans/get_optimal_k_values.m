clc
clear
load('/home/brain/HuPeng_Project/Analysis/WM/Parcellation/FC_ROI','FC_ROI');

data=mean(FC_ROI,3);

[n,p]=size(data);

for i=1:p
   minr=min(data(:,i));
   maxr=max(data(:,i));
   data(:,i)=(data(:,i)-minr)/(maxr-minr);%???
end

itern = 100;
for iter = 1:itern
    
    disp(['No.' num2str(iter) ' iteration ...'])
    K=20;D=zeros(K-1,2);T=0;
    for k=2:K
        T=T+1;
        [lable,c,sumd,d]=kmeans(data,k,'distance','sqeuclidean','replicate',30);
        sort_num=zeros(k,1);
        for i=1:k
            for j=1:n
                if lable(j,1)==i
                    sort_num(i,1)=sort_num(i,1)+1;
                end
            end
        end

        sort_ind=sumd./sort_num;
        sort_ind_ave=mean(sort_ind);
        
        h=nchoosek(k,2);A=zeros(h,2);t=0;sort_outd=zeros(h,1);
        for i=1:k-1
            for j=i+1:k
                t=t+1;
                A(t,1)=i;
                A(t,2)=j;
            end
        end
        for i=1:h
            for j=1:p
                sort_outd(i,1)=sort_outd(i,1)+(c(A(i,1),j)-c(A(i,2),j))^2;
            end
        end
        sort_outd_ave=mean(sort_outd);
        D(T,1)=k;
        D(T,2)=sort_ind_ave/sort_outd_ave;
    end
    min(D(:,2));
    [f,g]=find(D==min(D(:,2)));
    plot(D(:,1),D(:,2))
    ylabel('Cluster Validity Index');
    xlabel('Number of Clusters (K)');
    saveas(gcf,['/home/brain/HuPeng_Project/Analysis/WM/Parcellation/Optimal_K_Values/' num2str(iter) '.jpg']);
    saveas(gcf,['/home/brain/HuPeng_Project/Analysis/WM/Parcellation/Optimal_K_Values/' num2str(iter) '.fig']);
    close all;
end

