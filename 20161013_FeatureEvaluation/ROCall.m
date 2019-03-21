% ROC Plot
% Coded by HUANG D.J.
% Last modified 2016.10.15

% Initiation
clc;
clear;
close all;

cate = {'tauMean','RMS','kurt','skew','RicianK','histTauMean','histRMS','histKurt','histSkew'};%特征排序
liArray={':','--','-','-.'};
asc = {};
load Performance_LR.mat;
figure,
hold on
for k = 1 :9
    % Load data
    load (strcat('ROC_LR_',num2str(k),'.mat'));
    s = Performance{k};   
    asc{end+1} = s.minErrorFeatures;
    i = s.IndexMinError;
% for i = 1:size(ROC_Accu,2)
    roc = ROC_Accu{i};
    liPos=randi([1,length(liArray)],1,1);%随机选取线条
    plot(roc(:,1),roc(:,2),'LineStyle',liArray{liPos},'LineWidth',3,'Color',[rand(),rand(),rand()]);    
% end

end
legend(asc);
grid on 
xlabel('False Positive Rate');
ylabel('Ture Positive Rate');
title('ROC-LR-All');
% savefig(strcat('figROC_LR_',num2str(k),'.fig'));
hold off