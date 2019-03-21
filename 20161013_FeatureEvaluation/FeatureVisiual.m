clear;close all;clc;
load 'Los526.mat';
load 'NLos526.mat';
cate = {'tauMean','RMS','kurt','skew','RicianK','histTauMean','histRMS','histKurt','histSkew'};
X1 = LOS;
X2 = NLOS;
y2 = ones(size(X2,1),1);
X = [X1;X2];
y1 = zeros(size(X1,1),1);
y =[y1;y2];
X_norm = bsxfun(@minus, X, min(X));
X_norm = bsxfun(@rdivide, X_norm, max(X)-min(X));
m = size(X1,1);
n = size(X2,1);
figure,
hold on
for i = 1:9
    plot3(repmat(i,m,1),X_norm(1:m,i),1:m,'k+');
    plot3(repmat(i,n,1),X_norm(m+1:end,i),m+1:m+n,'yo');
end
hold off
xlabel('Feature No.(1,...9)');
ylabel('Feature Normalization');
zlabel('Sample No.');