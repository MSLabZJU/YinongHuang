function [ signals,PC,V ] = pca2( X )
% PCA2: Perform PCA using SVD.
% X - MxN matrix of input data
% (M dimensions, N trials)
% signals - MxN matrix of projected data
% PC - each column is a PC
% V - Mx1 matrix of variances
[M,N] = size(X);
% subtract off the mean for each dimension
mn = mean(X,1);
X = X - repmat(mn,M,1);
% construct the matrix Y
Y = X / sqrt(M-1);
% SVD does it all
[u,S,PC] = svd(Y);
% calculate the variances
S = diag(S);
V = S .* S;
% project the original X
signals =  X*PC;

end

