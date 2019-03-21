%% 特征散点显示
% last modified 2016.08.05
% Coded by HUANG D.J.
%% Initiation
clc;
clear;
close all;

%% 装载数据
[XLOS,XNLOS,XLOSOrig,XNLOSOrig,LOSTrain,NLOSTrain,cate]=LoadData();
I = 1:4;
Indices= nchoosek(I,3);
for i = 1:size(Indices,1)
    LOS = XLOSOrig(:,Indices(i,:));
    NLOS = XNLOSOrig(:,Indices(i,:));
    figure,   
    plot3(NLOS(:,1),NLOS(:,2),NLOS(:,3),'k+','LineWidth', 2, ...
'MarkerSize', 7);
    hold on
    plot3(LOS(:,1),LOS(:,2),LOS(:,3),'yo', 'MarkerFaceColor', 'y', ...
'MarkerSize', 7);
    hold off
    legend('NLOS','LOS');
    xlabel(cate(Indices(i,1),:));
    ylabel(cate(Indices(i,2),:));
    zlabel(cate(Indices(i,3),:));
    title(cate(Indices(i,:),:));
end
