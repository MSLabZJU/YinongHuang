%% Logist Regression
% Include
%   LoadData.m
%   costFunctionReg.m
%   sigmod.m
%   predict.m
% Last modified 2016.09.29
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
P = {};
f = featureCum(size(cate,2));
for k = 1: size(f,2)
    feature = f{k};
    N = 100;
    precise = zeros(N,2);
for i = 1:N
    i
Indices = crossvalind('Kfold',m,10);
train = (Indices<=7);
test = ~train;
fprintf('\nTraining LR ...\n')
%% Training
% feature = [1 2 3 4 5 6];
% Initialize fitting parameters
Xtrain = X(:,feature);
ytrain = y(:,:);
Xtest = Xt(train,feature);
ytest = yt(train,:);
initial_theta = zeros(size(Xtrain, 2), 1);

% Set regularization parameter lambda to 1 (you should vary this)
lambda = 0;

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, Xtrain, ytrain, lambda)), initial_theta, options);
%% Prediction

% You will have Xtest, ytest in your environment

% Compute accuracy on our training set
p = predict(theta, Xtest);
% precise(i) = mean(double(p == ytest)) * 100;
miss = sum(double((p==0) & (ytest==1)))./(sum(double(ytest ==1)));
false = sum(double((p==1) & (ytest==0)))./(sum(double(p ==1)));
precise(i,1) = miss;
precise(i,2) = false;
% fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
% plotDecisionBoundary(theta, X(:,feature), y);
end
P{end+1} = precise;
end