%% 特征散点显示

%% Initiation
clc;
clear;
close all;

%% 装载数据
load('dataLos.mat');
load('dataNLos.mat');
load('cate.mat');
I = 1:4;
Indices= nchoosek(I,2);
for i = 1:1
    LOS = dataLos(:,Indices(i,:));
    NLOS = dataNLos(:,Indices(i,:));
    figure,    
    plot(NLOS(:,1),NLOS(:,2),'k+','LineWidth', 2, ...
'MarkerSize', 7);
    hold on
    plot(LOS(:,1),LOS(:,2),'yo', 'MarkerFaceColor', 'y', ...
'MarkerSize', 7);
    hold off

    legend('NLOS','LOS');
    xlabel(cate(Indices(i,1),:));
    ylabel(cate(Indices(i,2),:));
    title(cate(Indices(i,:),:));
end