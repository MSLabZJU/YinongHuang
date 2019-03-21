function [LOS1,NLOS1,LOS2,NLOS2,cate] = LoadData2()
% function [LOS,NLOS,cate] = LoadData2()
% Last modified 2016.09.28
% Coded by HUANG D.J.

addpath('E:\Workspace_MATLAB\20160926_PFPM\0725_511');
% load ('histKurtCumLos0725.mat');
% load ('histKurtCumNLos0725.mat');
% load ('kurtCumLos0725.mat');
% load ('kurtCumNLos0725.mat');
% load ('RicianKCumLos0725.mat');
% load ('RicianKCumNLos0725.mat');
% load ('RicianKCumLos0725.mat');
% load ('RMSCumLos0725.mat');
% load ('RMSCumNLos0725.mat');
% load ('tauMeanCumLos0725.mat');
% load ('tauMeanCumNLos0725.mat');
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

LOS1 = [tauMeanCumLos,RMSCumLos,histKurtCumLos,RicianKCumLos,kurtCumLos];
NLOS1 = [tauMeanCumNLos,RMSCumNLos,histKurtCumNLos,RicianKCumNLos,kurtCumNLos];
% addpath('E:\Workspace_MATLAB\20160926_PFPM\0729_526');
load ('histKurtCumLos0729_526.mat');
load ('histKurtCumNLos0729_526.mat');
load ('kurtCumLos0729_526.mat');
load ('kurtCumNLos0729_526.mat');
load ('RicianKCumLos0729_526.mat');
load ('RicianKCumNLos0729_526.mat');
load ('RicianKCumLos0729_526.mat');
load ('RMSCumLos0729_526.mat');
load ('RMSCumNLos0729_526.mat');
load ('tauMeanCumLos0729_526.mat');
load ('tauMeanCumNLos0729_526.mat');

load ('cate.mat');
LOS2 = [tauMeanCumLos,RMSCumLos,histKurtCumLos,RicianKCumLos,kurtCumLos];
NLOS2 = [tauMeanCumNLos,RMSCumNLos,histKurtCumNLos,RicianKCumNLos,kurtCumNLos];
cate = cate;

end