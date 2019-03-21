clc;
% close all;
clear;
[XLOS,XNLOS,XLOS2,XNLOS2,cate] = LoadData();
RL = corrcoef(XLOS);
RN = corrcoef(XNLOS);
R = corrcoef([XLOS;XNLOS]);
