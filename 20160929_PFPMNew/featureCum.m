function f = featureCum(N)
%%% Coded by HUANG D.J
% 2016.09.29

f = {};
n = N+1;
v = 2:n;
for j = 1: 2
    C = nchoosek(v,j);
    for i = 1:size(C,1)
        f{end+1} = [1,C(i,:)];
    end
end