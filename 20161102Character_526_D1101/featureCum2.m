function f = featureCum2(N,min,max)
%%% Coded by HUANG D.J
% 2016.10.13

f = {};
n = N;
v = 1:n;
for j = min: max
    C = nchoosek(v,j);
    for i = 1:size(C,1)
        f{end+1} = C(i,:);
    end
end