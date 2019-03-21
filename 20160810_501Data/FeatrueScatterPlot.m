%% Initiation
clc;
clear;
close all;

%% Ãÿ’˜…¢µ„œ‘ æ
[XLOS,XNLOS,XLOS2,XNLOS2,X1,X2,cate]= LoadData();
X = [XLOS;XNLOS];
group = cell(size(X,1),1);
for i = 1:size(XLOS,1)
group{i,1} = 'LOS';
end
for i = size(XLOS,1)+1:size(X,1)
group{i,1} = 'NLOS';
end
asc = cate;
figure,
gplotmatrix(X,[],group,'yk','o+',[],'on','variable',asc)
% figure,
% plotmatrix(XLOS,'o');
% hold on
% plotmatrix(XNLOS,'ro')
% hold off