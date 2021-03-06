%% SVM Roc
%!!!!!!!δ���

% Last modified 2016.10.15
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
X = [ones(size(X,1),1),X];


load 'Los526.mat';
load 'NLos526.mat';
% m = size(X,1);
Xt1 = LOS;
Xt2 = NLOS;
yt2 = ones(size(Xt2,1),1);
Xt = [Xt1;Xt2];
yt1 = zeros(size(Xt1,1),1);
yt =[yt1;yt2];
Xt = [ones(size(Xt,1),1),Xt];
m = size(Xt,1);
for t = 1:9
    ROC_Accu = {};
    f = featureCum(size(cate,2),t,t);
for k = 1: size(f,2)
    feature = f{k};
    N = 1;
    Thres = 0:0.01:1;
%     precise = zeros(size(Thres,2),2,N);
    k
for i = 1:N
    i
% Indices = crossvalind('Kfold',m,10);
% train = (Indices<=7);
% test = ~train;
% fprintf('\nTraining LR ...\n')
%% Training
% feature = [1 2 3 4 5 6];
% Initialize fitting parameters
Xtrain = X(:,feature);
ytrain = y(:,:);
Xtest = Xt(:,feature);
ytest = yt(:,:);
SVMModel = fitcsvm(Xtrain,ytrain);

%% Prediction

% You will have Xtest, ytest in your environment

% Compute accuracy on our training set
p = predict(SVMModel, Xtest);

% Set regularization parameter lambda to 1 (you should vary this)

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, Xtrain, ytrain, lambda)), initial_theta, options);
%% Prediction
precise = zeros(size(Thres,2),2);
% You will have Xtest, ytest in your environment
for j = 1:size(Thres,2)
% Compute accuracy on our training set
p = predictThresholdSelect(theta, Xtest,Thres(1,j));
% precise(i) = mean(double(p == ytest)) * 100;
TPR = sum(double((p==1) & (ytest==1)))./(sum(double(ytest ==1)));
FPR = sum(double((p==1) & (ytest==0)))./(sum(double(ytest ==0)));

%%% !!!!!!  i =1 Special!!!!!!!!!
precise(j,1) = FPR;
precise(j,2) = TPR;
%%% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

% fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
% plotDecisionBoundary(theta, X(:,feature), y);
end
end
ROC_Accu{end+1} = precise;
end
save(strcat('ROC_LR_',num2str(t),'.mat'),'ROC_Accu');
end