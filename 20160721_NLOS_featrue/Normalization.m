function [ XNorm ] = Normalization(X)
% น้าปปฏ
[m n] = size(X);
XNorm = zeros(m,n);
for i = 1:m
    max_x = max(X(i,:));
    min_x = min(X(i,:));
    tmp = (X(i,:)-min_x)./(max_x-min_x);
    XNorm(i,:) = tmp;
end

end

