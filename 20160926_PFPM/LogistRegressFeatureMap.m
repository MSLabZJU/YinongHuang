%% Initialization
clear ;  clc;
close all;
%% load Data
load('dataLos.mat');
load('dataNLos.mat');
load('cate.mat');
load('R.mat');
load('RL.mat');
load('RN.mat');
X1 = dataLos;
y1 = zeros(size(X1,1),1);
X2 = dataNLos;
y2 = ones(size(X2,1),1);
X = [X1;X2];
y =[y1;y2];
m = size(X,1);
N = 100;
precise = zeros(N,1);
I = 1:4;
In = nchoosek(I,2);
for i = 1:N
Indices = crossvalind('Kfold',m,10);
train = (Indices<=8);
test = ~train;
fprintf('\nTraining LR ...\n')
%% Training
for j = 6:6
    feature = In(j,:);
    Xtmp = X(:,feature);
%     plotData(X,y);
%     title(cate(feature,:));
% Initialize fitting parameters
Xtmp = mapFeature(Xtmp(:,1),Xtmp(:,2));
Xtrain = Xtmp(train,:);
ytrain = y(train,:);
Xtest = Xtmp(test,:);
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

precise(i) = mean(double(p == ytest)) * 100;
fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
% plotDecisionBoundary(theta, X, y)
% title(cate(feature,:));
end

end