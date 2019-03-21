%   Include:
%
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
% Coeff1 = corrcoef(X1);
% Coeff2 = corrcoef(X2);
% Coeff = corrcoef(X);
% CoeffObv = corrcoef(X');
