%% SVM ∑÷¿‡∆˜
% include
%   svmtrain.m
%   svmpredict.m
% Last modified 2016.08.03
% Coded by HUANG D.J.

%% Initialization

clear ; clc; 
%% load Data
[XLOS,XNLOS,XLOS2,XNLOS2,cate] = LoadData();
X1 = XLOS;
y1 = zeros(size(X1,1),1);
X2 = XNLOS;
y2 = ones(size(X2,1),1);
X = [X1;X2];
y =[y1;y2];
features = [3 4];
% plotData(X(:,features),y)
m = size(X,1);
N = 1;
precise = zeros(N,1);
for i = 1:N
    
 Indices = crossvalind('Kfold',m,10);
 train = (Indices<=5);
 test = (Indices ==6); 
 Xtrain = X(train,features);
 ytrain = y(train,:);
Xtest = X(test,features);
ytest = y(test,:);
% SVM Parameters
C = 1;
model = svmTrain(Xtrain, ytrain, C, @linearKernel);
% C = 1; sigma = 10;
% We set the tolerance and max_passes lower here so that the code will run
% faster. However, in practice, you will want to run the training to
% convergence.
% model= svmTrain(Xtrain, ytrain, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
p = svmPredict(model, Xtest);

precise(i) = mean(double(p == ytest)) * 100;
fprintf('Test Accuracy: %f\n', mean(double(p == y(test,:))) * 100);
visualizeBoundaryLinear(X(:,features), y, model);
% visualizeBoundary(X(:,features), y, model);
end