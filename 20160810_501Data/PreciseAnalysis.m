%% Plot Precise CDF
% Last modified 2016.08.03
% Coded by HUANG D.J.
figure,
hold on,

for i = 1: 3
    switch i 
        case 1
            load ('precise_all.mat');
            p = sort(precise);
            subplot(1,3,1)
            hist(p)
            title('Logist Regression')
        case 2
            load ('precise_LS_SVM.mat');
            subplot(1,3,2);
            hist(precise);
            title('LS SVM');
        case 3
            load('precise_G_SVM.mat');
            subplot(1,3,3);
            hist(precise);
            title('Gaussian Kernel SVM');
    end
end
hold off