%% Logist Regression
% Include
%   LoadData.m
%   costFunctionReg.m
%   sigmod.m
%   predict.m
% Last modified 2016.09.27
% Coded by HUANG D.J.

%% Initialization
clear ; close all; clc
%% load Data
[XLOS,XNLOS,cate] = LoadData();
X1 = XLOS;
% In = crossvalind('Kfold',size(XLOS,1),10);
% testLOS = (In>3);
% X1 = [XLOSTrain;XLOS(In<=3,:)];
% y1 = zeros(size(X1,1),1);
% In = crossvalind('Kfold',size(XNLOS,1),10);
% testNLOS = (In>3);
% X2 = [XNLOSTrain;XNLOS(In<=3,:)];
X2 = XNLOS;
y2 = ones(size(X2,1),1);
X = [X1;X2];
y1 = zeros(size(X1,1),1);
y =[y1;y2];
X = [ones(size(X,1),1),X];
m = size(X,1);
% Xtest = [XLOS(testLOS,:);XNLOS(testNLOS,:)];
% Xtest =[ ones(size(Xtest,1),1),Xtest];
% ytest = [zeros(sum(testLOS),1);ones(sum(testNLOS),1)];]
% Xtest1 =XLOS501;
% Xtest2 = XNLOS501;
% Xtest = [Xtest1;Xtest2];
% Xtest =[ ones(size(Xtest,1),1),Xtest];
% ytest = [zeros(size(Xtest1,1),1);ones(size(Xtest2,1),1)];

load featureCum.mat;
P = {};
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
Xtrain = X(train,feature);
ytrain = y(train,:);
Xtest = X(test,feature);
ytest = y(test,:);
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
