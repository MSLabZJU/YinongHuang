%% Logist Regression with PCA
% Include
%   LoadData.m
%   costFunctionReg.m
%   sigmod.m
%   predict.m
% Last modified 2016.10.25
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
% X = [ones(size(X,1),1),X];


load 'Los526.mat';
load 'NLos526.mat';
% m = size(X,1);
Xt1 = LOS;
Xt2 = NLOS;
yt2 = ones(size(Xt2,1),1);
Xt = [Xt1;Xt2];
yt1 = zeros(size(Xt1,1),1);
yt =[yt1;yt2];
% Xt = [ones(size(Xt,1),1),Xt];
m = size(Xt,1);
[Coeff,score,latent] = pca(X); 
meanX = mean(X,1);
stdX  = std(X,1);
Accuracy = [];   
for t = 1:9
    N = 1;
    precise = zeros(N,6);
for i = 1:N
%% Training
% feature = [1 2 3 4 5 6];
% Initialize fitting parameters
% Xtrain = [ones(size(X,1),1),score(:,1:t)];
Xtrain = X*Coeff(:,1:t);
ytrain = y(:,:);
% XtNew = (Xt - repmat(meanX,m,1));
% Xtest = [ones(size(Xt,1),1),XtNew*Coeff(:,1:t)];
Xtest = Xt*Coeff(:,1:t);
ytest = yt(:,:);
mdl = fitglm(Xtrain,ytrain,'Distribution','binomial','Link','logit');
% initial_theta = zeros(size(Xtrain, 2), 1);
% 
% % Set regularization parameter lambda to 1 (you should vary this)
% lambda = 0;
% 
% % Set Options
% options = optimset('GradObj', 'on', 'MaxIter', 400);
% 
% % Optimize
% [theta, J, exit_flag] = ...
% 	fminunc(@(t)(costFunctionReg(t, Xtrain, ytrain, lambda)), initial_theta, options);
% %% Prediction
% 
% % You will have Xtest, ytest in your environment
% 
% % Compute accuracy on our training set
% B = mnrfit(Xtrain,ytrain);
% pihat = mnrval(B,Xtest);
p = predict(mdl, Xtest);
p = p>0.5;
% precise(i) = mean(double(p == ytest)) * 100;
betaError= sum(double((p==0) & (ytest==1)))./(sum(double(ytest ==1)));
alphaError = sum(double((p==1) & (ytest==0)))./(sum(double(ytest==0)));
Precision = sum(double((p==1) & (ytest==1)))./(sum(double(p ==1)));
Recall = sum(double((p==1) & (ytest==1)))./(sum(double(ytest ==1)));
precise(i,1) = alphaError;
precise(i,2) = betaError;
precise(i,3) = alphaError+betaError;
precise(i,4) = Precision;
precise(i,5) = Recall;
precise(i,6) = 2*Precision*Recall/(Precision+Recall);
% fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
% plotDecisionBoundary(theta, X(:,feature), y);
end
Accuracy(end+1,:) = precise;
end
% save(strcat('Accuracy_LR_',num2str(t),'.mat'),'Accuracy');
