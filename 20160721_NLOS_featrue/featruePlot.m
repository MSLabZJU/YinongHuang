load('tauMean.mat')
load('RMS.mat')
% plot RMS
figure,
hold on
for i = 1:6
    if i == 1 |i == 3
        plot(RMS(:,i))
    else
        plot(RMS(:,i),'r')
    end
end
title('RMS')
% plot taumean
figure,
hold on
for i = 1:6
    if i == 1 |i == 3
        plot(tauMean(:,i))
    else
        plot(tauMean(:,i),'r')
    end
end
title('tauMean')

        
        