function [LOS,NLOS,LOSOrig,NLOSOrig,LOSTrain,NLOSTrain,cate] = LoadData()
% function [LOS,NLOS,LOSOrig,NLOSOrig,cate] = LoadData()
% Load Data 0805
% Last modified 2016.08.05
% Coded by HUANG D.J.

load ('data0805Los.mat');
load ('data0805NLos.mat');
load ('data0805OrigLos.mat');
load ('data0805OrigNLos.mat');
load ('dataCumNewLos.mat');
load ('dataCumNewNLos.mat');
load ('cate.mat');
LOSTrain = dataCumNewLos;
NLOSTrain = dataCumNewNLos;
LOS = data0805Los;
NLOS = data0805NLos;
LOSOrig = data0805OrigLos;
NLOSOrig = data0805OrigNLos;
cate = cate;

end

