function [LOS1,NLOS1,LOS2,NLOS2,cate] = LoadData2()
% function [LOS,NLOS,cate] = LoadData2()
% Last modified 2016.09.29
% Coded by HUANG D.J.

addpath('E:\Workspace_MATLAB\20160929_PFPMNew\511New');
load ('histKurtCumLos0728New.mat');
load ('histKurtCumNLos0728New.mat');
load ('kurtCumLos0728New.mat');
load ('kurtCumNLos0728New.mat');
load ('RicianKCumLos0728New.mat');
load ('RicianKCumNLos0728New.mat');
load ('RicianKCumLos0728New.mat');
load ('RMSCumLos0728New.mat');
load ('RMSCumNLos0728New.mat');
load ('tauMeanCumLos0728New.mat');
load ('tauMeanCumNLos0728New.mat');
load ('histTauMeanCumLos0728New.mat');
load ('histTauMeanCumNLos0728New.mat');
load ('histRMSCumLos0728New.mat');
load ('histRMSCumNLos0728New.mat');
LOS1 = [tauMeanCumLos,RMSCumLos,kurtCumLos,RicianKCumLos,histTauMeanCumLos,histRMSCumLos,histKurtCumLos];
NLOS1 = [tauMeanCumNLos,RMSCumNLos,kurtCumNLos,RicianKCumNLos,histTauMeanCumNLos,histRMSCumNLos,histKurtCumNLos];


load ('histKurtCumLos0729New.mat');
load ('histKurtCumNLos0729New.mat');
load ('kurtCumLos0729New.mat');
load ('kurtCumNLos0729New.mat');
load ('RicianKCumLos0729New.mat');
load ('RicianKCumNLos0729New.mat');
load ('RicianKCumLos0729New.mat');
load ('RMSCumLos0729New.mat');
load ('RMSCumNLos0729New.mat');
load ('tauMeanCumLos0729New.mat');
load ('tauMeanCumNLos0729New.mat');
load ('histTauMeanCumLos0729New.mat');
load ('histTauMeanCumNLos0729New.mat');
load ('histRMSCumLos0729New.mat');
load ('histRMSCumNLos0729New.mat');
LOS2 = [tauMeanCumLos,RMSCumLos,kurtCumLos,RicianKCumLos,histTauMeanCumLos,histRMSCumLos,histKurtCumLos];
NLOS2 = [tauMeanCumNLos,RMSCumNLos,kurtCumNLos,RicianKCumNLos,histTauMeanCumNLos,histRMSCumNLos,histKurtCumNLos];
cate = {'tauMean','RMS','kurt','RicianK','histTauMean','histRMS','histKurt'};

end