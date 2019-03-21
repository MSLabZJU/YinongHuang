function [LOS,NLOS,cate] = LoadData()
% function [LOS,NLOS,cate] = LoadData()
% Load Data 0805
% Last modified 2016.09.26
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
load ('cate.mat');
LOS = [tauMeanCumLos,RMSCumLos,histKurtCumLos,RicianKCumLos,kurtCumLos,];
NLOS = [tauMeanCumNLos,RMSCumNLos,histKurtCumNLos,RicianKCumNLos,kurtCumNLos];
cate = cate;

end

