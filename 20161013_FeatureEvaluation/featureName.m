function asc = featureName(cate,n)
%%% each feature size Name
% Input:
%   cate: 1*N cell, feature name
%   n: int, feature set size
% Output:
%   asc: 1*CnN cell, feature combinations whose set size is n
% Coded by HUANG D.J.
% Last modified 2016/10/15

asc = {};
N = size(cate,2);
v = 1:N;
C = nchoosek(v,n);
for i = 1:size(C,1)
    tmp = char(cate{C(i,1)});
    for j = 2:length(C(i,:))
        tmp = strcat(tmp,',',cate{C(i,j)});
    end
    asc{end+1} = tmp;
end
end