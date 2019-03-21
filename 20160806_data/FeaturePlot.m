%% 特征一维分析
%% Initiation
clc;
close all;
clear;
%% 装载数据
load('dataLos.mat');
load('dataNLos.mat');
load('cate.mat');
load('R.mat');
load('RL.mat');
load('RN.mat');
%% Plot
for i = 1:4
    figure,
    plot(dataLos(:,i),'bo');
    hold on
    plot(dataNLos(:,i),'ro');
    legend('LOS','NLOS');
    title(cate(i,:));
end
% 
% %% Plot
% for i = 1:4
%     figure,
%     subplot(1,2,1);
%     hist(dataLos(:,i))
%     title(strcat(cate(i,:),' LOS'));
%     subplot(1,2,2);
%     hist(dataNLos(:,i))
%     title(strcat(cate(i,:),' NLOS'));
% end