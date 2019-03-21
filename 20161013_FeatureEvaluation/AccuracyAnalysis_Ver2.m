%%% Accuracy 分析 version2
% 输出为cell，并写excel
% Coded by HUANG D.J.
% Last modified 2016/10/15

clc;
clear;

cate = {'tauMean','RMS','kurt','skew','RicianK','histTauMean','histRMS','histKurt','histSkew'};%特征排序
Classifier = {'KNN','LR','LR_MATLAB2','SVM','SVM_G','SVM_Poly'};
for j = 1:size(Classifier,2)
    class = Classifier{j};
    Performance = cell(10,10);
    Performance{1,1} = 'minErrorFeatures';
Performance{1,2} = 'alphaError';
Performance{1,3} = 'betaError';
Performance{1,4} = 'minError';
Performance{1,5} = 'averageError';
Performance{1,6} ='IndexMinError';
Performance{1,7} = 'bestF1Features';
Performance{1,8} = 'precision';
Performance{1,9} = 'recall';
Performance{1,10} = 'bestF1';
Performance{1,11} = 'averageF1';
Performance{1,12} = 'indF1';
for k = 1:9
    % Load data
    load (strcat('Accuracy_',class,'_',num2str(k),'.mat'));
    asc = featureName(cate,k);    
    minError = min(Accuracy(:,3));
    indError = find(Accuracy(:,3)==minError);
    alphaError = Accuracy(indError,1);
    betaError = Accuracy(indError,2);
    maxF1 = max(Accuracy(:,6));
    indF1 = find(Accuracy(:,6)==maxF1);
    precision = Accuracy(indF1,4);
    recall = Accuracy(indF1,5);
Performance{k+1,1} = asc{indError};
Performance{k+1,2} = alphaError;
Performance{k+1,3} = betaError;
Performance{k+1,4} = minError;
Performance{k+1,5} = mean(Accuracy(:,3));
Performance{k+1,6} =indError;
Performance{k+1,7} = asc{indF1};
Performance{k+1,8} = precision;
Performance{k+1,9} = recall;
Performance{k+1,10} = maxF1;
Performance{k+1,11} = mean(Accuracy(:,6));
Performance{k+1,12} = indF1;
end
% save(strcat('Performance_',class,'.mat'),'Performance');
xlswrite(strcat('Performance_',class,'.xls'),Performance,'sheet1');
end
clear