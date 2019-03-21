function [LOS,NLOS,cate] = LoadData()
% function [LOS,NLOS,cate] = LoadData()
% Load Data 0805
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
LOS = [tauMeanCumLos,RMSCumLos,kurtCumLos,RicianKCumLos,histTauMeanCumLos,histRMSCumLos,histKurtCumLos];
NLOS = [tauMeanCumNLos,RMSCumNLos,kurtCumNLos,RicianKCumNLos,histTauMeanCumNLos,histRMSCumNLos,histKurtCumNLos];
cate = {'tauMean','RMS','kurt','RicianK','histTauMean','histRMS','histKurt'};

end

