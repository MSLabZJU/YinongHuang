% ROC Plot
% Coded by HUANG D.J.
% Last modified 2016.10.14

% Initiation
clc;
clear;
close all;

cate = {'tauMean','RMS','kurt','skew','RicianK','histTauMean','histRMS','histKurt','histSkew'};%特征排序
liArray={':','--','-','-.'};

for k = 1 :9
    % Load data
    load (strcat('ROC_LR_',num2str(k),'.mat'));
    asc = featureName(cate,k);
figure,
hold on
for i = 1:size(ROC_Accu,2)
    roc = ROC_Accu{i};
    liPos=randi([1,length(liArray)],1,1);%随机选取线条
    plot(roc(:,1),roc(:,2),'LineStyle',liArray{liPos},'LineWidth',3,'Color',[rand(),rand(),rand()]);    
end
hold off
legend(asc);
grid on 
xlabel('False Positive Rate');
ylabel('Ture Positive Rate');
title(strcat('ROC-LR-',num2str(k)));
savefig(strcat('figROC_LR_',num2str(k),'.fig'));
end
