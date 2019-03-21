%% KNNSearch MATLAB Classifier
% Include
% 
% Last modified 2016.10.13
% Coded by HUANG D.J.

%% Initialization
clear ; close all; clc
%% load Data
load 'Los511New.mat';
load 'NLos511New.mat';
cate = {'tauMean','RMS','kurt','skew','RicianK','histTauMean','histRMS','histKurt','histSkew'};
% [XLOS1,XNLOS1,XLOS2,XNLOS2,cate] = LoadData2();
X1 = LOS;
X2 = NLOS;
y2 = ones(size(X2,1),1);
X = [X1;X2];
y1 = zeros(size(X1,1),1);
y =[y1;y2];
[X_norm, mu, sigma] = featureNormalize(X);
% X_norm = [ones(size(X,1),1),X_norm];


load 'Los526.mat';
load 'NLos526.mat';
% m = size(X,1);
Xt1 = LOS;
Xt2 = NLOS;
yt2 = ones(size(Xt2,1),1);
Xt = [Xt1;Xt2];
m = size(Xt,1);
yt1 = zeros(size(Xt1,1),1);
yt =[yt1;yt2];
Xt_norm = (Xt-repmat(mu,m,1))./(repmat(sigma,m,1));
% Xt_norm = [ones(size(Xt,1),1),Xt_norm];

f = {};
% n = 9;
% v = 1:n;
% for j = 1: max
%     C = nchoosek(v,j);
%     for i = 1:size(C,1)
%         f{end+1} = C(i,:);
%     end
% end

for t =1 :9
%     f = featureCum(size(cate,2),t,t);    
    Accuracy = []; 
    K = [1,2,3,4,5]; 
    f = {};
    n=9;
    v = 1:9;
    C = nchoosek(v,t);
    for i = 1:size(C,1)
        f{end+1} = C(i,:);
    end
% for kc = 2:size(K,2) 
    A = [];
for k = 1: size(f,2)
    feature = f{k};
    precise = zeros(1,6);
fprintf('\nTraining KNN Search ...\n')
%% Training

Xtrain = X_norm(:,feature);
ytrain = y(:,:);
Xtest = Xt_norm(:,feature);
ytest = yt(:,:);

iDX = knnsearch(Xtrain,Xtest,'K',3);

%% Prediction
fprintf('\nPredict KNN Search ...\n')
% You will have Xtest, ytest in your environment

% Compute accuracy on our training set
p = predictKNN(ytrain, iDX);
% precise(i) = mean(double(p == ytest)) * 100;
betaError= sum(double((p==0) & (ytest==1)))./(sum(double(ytest ==1)));
alphaError = sum(double((p==1) & (ytest==0)))./(sum(double(ytest==0)));
Precision = sum(double((p==1) & (ytest==1)))./(sum(double(p ==1)));
Recall = sum(double((p==1) & (ytest==1)))./(sum(double(ytest ==1)));
precise(1) = alphaError;
precise(2) = betaError;
precise(3) = alphaError+betaError;
precise(4) = Precision;
precise(5) = Recall;
precise(6) = 2*Precision*Recall/(Precision+Recall);
% fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
% plotDecisionBoundary(theta, X(:,feature), y);
fprintf('...Done!\n')
Accuracy(end+1,:) = precise;
end
save(strcat('Accuracy_KNN_',num2str(t),'.mat'),'Accuracy');
end