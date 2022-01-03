clc, clear, close all

oldpath = path;
path(oldpath, 'C:\Users\admin\OneDrive\바탕 화면\code\dataset');
fname = 'C:\Users\admin\OneDrive\바탕 화면\code\dataset\image\sample_cw';
data = readmatrix('sample2_LOS.csv');

for i = 1:1
    signal = data(i, 700:1000);
    signal_db = pow2db(signal+0.01);
    signal_db = signal_db - max(signal_db);
    for j =1:301
        if signal_db(j) < -35
            signal_db(j) = -35;
        end
    end
    wt = cwt(signal_db, 'amor');
    imagesc(abs(wt))
    caxis([0,7])
    s1 = 'LOS_';
    s2 = string(i);
    s3 = '.jpg';
    s = strcat(s1,s2,s3);
    axis off
    saveas(gcf,fullfile(fname,s))
end

