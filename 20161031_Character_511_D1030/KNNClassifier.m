%% KNNSearch MATLAB Classifier
% Include
%   featureNormalize.m
%   precidtKNN.m
% Last modified 2016/11/01
% Coded by HUANG D.J.

%% Initialization
clear ; close all;
%% load Data
[XLOS,XNLOS,cate] =LoadData();
X = [XLOS;XNLOS];
yt1 = zeros(size(XLOS,1),1);
yt2 = ones(size(XNLOS,1),1);
y = [yt1;yt2];
m = size(X,1);
kt = [1 2 4 5 6];
for kc = 1:5
for t =1 :9
    f = featureCum2(size(cate,2),t,t);    
    Accuracy = []; 
for k = 1: size(f,2)
    feature = f{k};
    N=10;
    precise = zeros(N,6);
for i = 1:N
    Indices = crossvalind('Kfold',m,10);
train = (Indices<=7);
test = ~train;
fprintf('\nTraining KNN Search ...\n')
%% Training

[X_norm, mu, sigma] = featureNormalize(X(train,feature));
Xtrain = X_norm;
ytrain = y(train,:);
Xt = X(test,feature);
Xtest = (Xt-repmat(mu,sum(test),1))./(repmat(sigma,sum(test),1));
ytest = y(test,:);

iDX = knnsearch(Xtrain,Xtest,'K',kt(kc));

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
% fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
% plotDecisionBoundary(theta, X(:,feature), y);
fprintf('...Done!\n')
end
Accuracy(end+1,:) = mean(precise,1);
end
save(strcat('Accuracy_KNN',num2str(kt(kc)),'_',num2str(t),'.mat'),'Accuracy');
end
end