check_path = ['F:/HCP/Data/'];

folders = dir(check_path); folders(1:2) = [];

maxlen = 0;
maxidx = 0; 
for i  = 1:length(folders)
    subs = dir([check_path folders(i).name '/FunImg/']); subs(1:2) = [];
    len = length(subs);
    if maxlen < len
        maxlen = len;
        maxidx = i;
        type = 0;
    end
    
    subs = dir([check_path folders(i).name '/T1Img/']); subs(1:2) = [];
    len = length(subs);
    if maxlen < len
        maxlen = len;
        maxidx = i;
        type = 1;
    end
end

if type == 0
    maxfolders = dir([check_path folders(maxidx).name '/FunImg/']); maxfolders(1:2) = [];
else
    maxfolders = dir([check_path folders(maxidx).name '/T1Img/']); maxfolders(1:2) = [];
end

subject_number = zeros(maxlen,length(folders)*2);
for i = 1:maxlen
    subject_number(i) = str2double(maxfolders(i).name(1:6));
end

for i = 1:maxlen
    for j = 1:length(folders)
        
        subs = dir([check_path folders(j).name '/FunImg/']); subs(1:2) = [];
        for k = 1:length(subs)
            if str2double(subs(k).name(1:6)) == subject_number(i,1)
                subject_number(i,j+1) = 1;
                continue;
            end
        end
        
        subs = dir([check_path folders(j).name '/T1Img/']); subs(1:2) = [];
        for k = 1:length(subs)
            if str2double(subs(k).name(1:6)) == subject_number(i,1)
                subject_number(i,j+1) = 1;
                continue;
            end
        end
        
    end
end