%% SVM in Matlab
% Include
%   featureCum2.m
%   LoadData.m
% Last modified 2016.10.31
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
for t = 1:9
    Accuracy = [];
    f = featureCum2(size(cate,2),t,t);
for k = 1: size(f,2)
    feature = f{k};
    N = 1;
    precise = zeros(N,8);
for i = 1:N
Indices = crossvalind('Kfold',m,10);
train = (Indices<=7);
test = ~train;
fprintf('\nTraining SVM ...\n')
%% Training
% feature = [1 2 3 4 5 6];
% Initialize fitting parameters
Xtrain = X(train,feature);
ytrain = y(train,:);
Xtest = X(test,feature);
ytest = y(test,:);
SVMModel = fitcsvm(Xtrain,ytrain,'KernelFunction','polynomial');

%% Prediction

% You will have Xtest, ytest in your environment

% Compute accuracy on our training set
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
Accuracy(end+1,:) = mean(precise,1);
end
save(strcat('Accuracy_SVM_Poly_',num2str(t),'.mat'),'Accuracy');
end