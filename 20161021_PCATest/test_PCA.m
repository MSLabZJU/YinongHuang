%   Include:
%       pca.m
%   Coded by HUANG D.J.
%   Last modified 2016/10/21

clear;close all;clc;
load 'Los511New.mat';
load 'NLos511New.mat';
cate = {'tauMean','RMS','kurt','skew','RicianK','histTauMean','histRMS','histKurt','histSkew'};
X1 = LOS;
X2 = NLOS;
y2 = ones(size(X2,1),1);
X = [X1;X2];
y1 = zeros(size(X1,1),1);
y =[y1;y2];
% X = [ones(size(X,1),1),X];
% [X_norm, mu, sigma] = featureNormalize(X);
[U,S,V] = pcaM(X);
Z = projectData(X, U, 9);

[C,S1,L] = pca(X);
% [Signal1,PC1,V1] = pca1(X');
[Signal2,PC2,V2] = pca2(X);
% Xzs = zscore(X);
% [U,S] = pcaM(X);
% Ureduce = U(:,1:9);
% Z = X*Ureduce;
ZMatlab = X*C;
