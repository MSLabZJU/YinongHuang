function f = featureCum(N,min,max)
%%% Coded by HUANG D.J
% 2016.10.13

f = {};
n = N+1;
v = 2:n;
for j = min: max
    C = nchoosek(v,j);
    for i = 1:size(C,1)
        f{end+1} = [1,C(i,:)];
    end
end