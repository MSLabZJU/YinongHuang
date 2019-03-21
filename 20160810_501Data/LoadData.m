function [LOS501,NLOS501,LOSPa,NLOSPa,cate] = LoadData()
% function [LOS501,NLOS501,LOSPa,NLOSPa,cate] = LoadData()
% Load Data 0805
% Last modified 2016.08.10
% Coded by HUANG D.J.

load ('data501CumLos.mat');
load ('data501CumNLos.mat');
load ('dataPassageCumLos.mat');
load ('dataPassageCumNLos.mat');

load ('cate.mat');
LOS501 = data501CumLos;
NLOS501 = data501CumNLos;
LOSPa = dataPassageCumLos;
NLOSPa = dataPassageCumNLos;
cate = cate;

end

