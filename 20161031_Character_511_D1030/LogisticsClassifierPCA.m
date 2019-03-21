%% Logist Regression in Matlab PCA
% Include
%   LoadData.m
% 
% Last modified 2016/11/02
% Coded by HUANG D.J.

%% Initialization
clear ; close all; clc
%% load Data
[XLOS,XNLOS,cate] =LoadData();
X = [XLOS;XNLOS];
yt1 = zeros(size(XLOS,1),1);
yt2 = ones(size(XNLOS,1),1);
y = [yt1;yt2];
m = size(X,1);    
Performance = [];
for t = 1:9

%     f = featureCum2(size(cate,2),t,t);
    N = 10;
    precise = zeros(N,8);
for i = 1:N
Indices = crossvalind('Kfold',m,10);
train = (Indices<=7);
test = ~train;
fprintf('\nTraining LR ...\n')
%% Training
% feature = [1 2 3 4 5 6];
% Initialize fitting parameters
% Xtrain = X(train,:);
ytrain = y(train,:);
[Coeff,score,latent] = pca(X(train,:)); 
meanX = mean(X(train,:),1);
stdX  = std(X(train,:),1);
Xtrain = X(train,:)*Coeff(:,1:t);
Xt = X(test,:);
Xtest = Xt*Coeff(:,1:t);
ytest = y(test,:);
%% Logistics Regression
% mdl = fitglm(Xtrain,ytrain,'Distribution','binomial','Link','logit');
% p = predict(mdl, Xtest);
% p = p>0.5;
%%  SVM Classifier
SVMModel = fitcsvm(Xtrain,ytrain,'KernelFunction','polynomial');
p = predict(SVMModel, Xtest);

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
Performance(end+1,:) = mean(precise,1);
% save(strcat('Accuracy_LR_PCA_',num2str(t),'.mat'),'Accuracy');
end
save(strcat('Performance_SVM_PCA.mat'),'Performance');