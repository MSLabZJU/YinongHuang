function [LOS,NLOS,LOSOrig,NLOSOrig,LOSTrain,NLOSTrain,cate] = LoadData()
% function [LOS,NLOS,LOSOrig,NLOSOrig,cate] = LoadData()
% Load Data 0805
% Last modified 2016.08.06
% Coded by HUANG D.J.

load ('data0806Los.mat');
load ('data0806NLos.mat');
load ('data0806OrigLos.mat');
load ('data0806OrigNLos.mat');
load ('dataCumNewLos.mat');
load ('dataCumNewNLos.mat');
load ('cate.mat');
LOSTrain = dataCumNewLos;
NLOSTrain = dataCumNewNLos;
LOS = data0806Los;
NLOS = data0806NLos;
LOSOrig = data0806OrigLos;
NLOSOrig = data0806OrigNLos;
cate = cate;

end

