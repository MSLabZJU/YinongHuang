clc;
clear;
close all;

%   load the sample data
load fisheriris
%   Use only the first two features as predictor variables. Define a binary classification problem by using only the measurements that correspond to the species versicolor and virginica.
pred = meas(51:end,1:2);
%   Define the binary response variable.
resp = (1:100)'>50;  % Versicolor = 0, virginica = 1
%   Fit a logistic regression model.
mdl = fitglm(pred,resp,'Distribution','binomial','Link','logit');
%   Compute the ROC curve. Use the probability estimates from the logistic regression model as scores.
scores = mdl.Fitted.Probability;
[X,Y,T,AUC] = perfcurve(species(51:end,:),scores,'virginica');
plot(X,Y)
xlabel('False positive rate')
ylabel('True positive rate')
title('ROC for Classification by Logistic Regression')