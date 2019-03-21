clc;
clear;
close all;

% Coded by HUANG D.J.
% Last modified 2016/11/03
load('tauMeanLos.mat');
load('tauMeanNLos.mat');
load('RMSLos.mat');
load('RMSNLos.mat');
load('kurtLos.mat');
load('kurtNLos.mat');
load('skewLos.mat');
load('skewNLos.mat');
load('RicianKLos.mat');
load('RicianKNLos.mat');
load('histTauMeanLos.mat');
load('histTauMeanNLos.mat');
load('histRMSLos.mat');
load('histRMSNLos.mat');
load('histKurtLos.mat');
load('histKurtNLos.mat');
load('histSkewLos.mat');
load('histSkewNLos.mat');
cate = {'tauMean','RMS','kurt','skew','RicianK','histTauMean','histRMS','histKurt','histSkew'};
LOS = [tauMeanCumLos,RMSCumLos,kurtCumLos,skewCumLos,RicianKCumLos,histTauMeanCumLos,histRMSCumLos,histKurtCumLos,histSkewCumLos];
NLOS = [tauMeanCumNLos,RMSCumNLos,kurtCumNLos,skewCumNLos,RicianKCumNLos,histTauMeanCumNLos,histRMSCumNLos,histKurtCumNLos,histSkewCumNLos];

save ('TestLOS.mat','LOS');
save('TestNLOS.mat','NLOS');


