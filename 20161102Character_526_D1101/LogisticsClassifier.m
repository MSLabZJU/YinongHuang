%% Logist Regression in Matlab
% Train data set: 511_D1031
% Test data set: 526_D1102
% Include
%   featureCum2.m
% Last modified 2016/11/03
% Coded by HUANG D.J.

%% Initialization
clear ; close all; clc
%% load Data
cate = {'tauMean','RMS','kurt','skew','RicianK','histTauMean','histRMS','histKurt','histSkew'};
load('TrainLOS.mat');
load('TrainNLOS.mat');
X = [LOS;NLOS];
y = [zeros(size(LOS,1),1);ones(size(NLOS,1),1)];
load('TestLOS.mat');
load('TestNLOS.mat');
Xt = [LOS;NLOS];
yt = [zeros(size(LOS,1),1);ones(size(NLOS,1),1)];
m = size(X,1);
Classifier = {'LR','SVM','SVM_G'};
for j = 2:size(Classifier,2)
    class = Classifier{j};
for t = 1:9
    Accuracy = [];
    f = featureCum2(size(cate,2),t,t);
for k = 1: size(f,2)
    feature = f{k};
    N = 1;
    precise = zeros(N,8);
for i = 1:N

Xtrain = X(:,feature);
ytrain = y(:,:);
Xtest = Xt(:,feature);
ytest = yt(:,:);
if strcmp(class,'LR')
%% Logistics Regression
fprintf('\nTraining LR ...\n')
mdl = fitglm(Xtrain,ytrain,'Distribution','binomial','Link','logit');
p = predict(mdl, Xtest);
p = p>0.5;
elseif strcmp(class,'SVM')
%%  SVM Classifier
fprintf('\nTraining SVM linear ...\n')
SVMModel = fitcsvm(Xtrain,ytrain,'KernelFunction','linear');
p = predict(SVMModel, Xtest);
elseif strcmp(class,'SVM_G')
%%  SVM Classifier with Gaussian Kernel function
fprintf('\nTraining SVM gaussian ...\n')
SVMModel = fitcsvm(Xtrain,ytrain,'KernelFunction','guanssian');
p = predict(SVMModel, Xtest);      
end
betaError= sum(double((p==0) & (ytest==1)))./(sum(double(ytest ==1)));
alphaError = sum(double((p==1) & (ytest==0)))./(sum(double(ytest==0)));
Precision = sum(double((p==1) & (ytest==1)))./(sum(double(p ==1)));
Recall = sum(double((p==1) & (ytest==1)))./(sum(double(ytest ==1)));
Specificity = sum(double((p==0) & (ytest==0)))./(sum(double(ytest ==0)));
Accu = mean(double(p == ytest));
precise(i,1) = alphaError;
precise(i,2) = betaError;
precise(i,3) = alphaError+betaError;
precise(i,4) = Precision;
precise(i,5) = Recall;
precise(i,6) = Specificity;
precise(i,7) = Accu;
precise(i,8) = 2*Precision*Recall/(Precision+Recall);
end
Accuracy(end+1,:) = mean(precise,1);
end
save(strcat('Accuracy_',class,'_',num2str(k),'.mat'),'Accuracy');
end
end