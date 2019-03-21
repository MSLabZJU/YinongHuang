%%% Accuracy ·ÖÎö
% Coded by HUANG D.J.
% Last modified 2016/10/15

clc;
clear;

cate = {'tauMean','RMS','kurt','skew','RicianK','histTauMean','histRMS','histKurt','histSkew'};%ÌØÕ÷ÅÅÐò
Classifier = {'LR','SVM','SVM_G','SVM_Poly'};
for j = 1:size(Classifier,2)
    class = Classifier{j};
    Performance = {};
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
    s = struct('minErrorFeatures',asc{indError},...
                'alphaError',alphaError,...
                'betaError',betaError,...
                'minError',minError,...
                'IndexMinError',indError,...
                'bestF1Features',asc{indF1},...
                'precision',precision,...
                'recall',recall,...
                'bestF1',maxF1,...
                'IndexBestF1',indF1);
    Performance{end+1} = s;
end
save(strcat('Performance_',class,'.mat'),'Performance');
end
clear
