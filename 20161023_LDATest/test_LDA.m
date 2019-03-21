
%   Include:
%     LDA.m
%   Coded by HUANG D.J.
%   Last modified 2016/10/21

clear;close all;clc;
% load 'Los511New.mat';
% load 'NLos511New.mat';
% cate = {'tauMean','RMS','kurt','skew','RicianK','histTauMean','histRMS','histKurt','histSkew'};
% X1 = LOS;
% X2 = NLOS;
% y2 = ones(size(X2,1),1);
% X = [X1;X2];
% y1 = zeros(size(X1,1),1);
% y =[y1;y2];
% Coeff1 = corrcoef(X1);
% Coeff2 = corrcoef(X2);
% Coeff = corrcoef(X);
% CoeffObv = corrcoef(X');
% % [Y, W, lambda] = LDA(X, y);
X1 = [4,1;2,4;2,3;3,6;4,4]';
X2 = [9,10;6,8;9,5;8,7;10,8]';
u1 = mean(X1,2);
u2 = mean(X2,2);
SB = (u1-u2)*(u1-u2)';
S1 = 0.8*cov(X1');
S2 = 0.8*cov(X2');
