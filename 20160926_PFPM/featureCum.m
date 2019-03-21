f = {};
for i = 1:5
    f{end+1} = [1,i+1];
end
p = 5;
v = 2:6;
C = nchoosek(v,2);
for i = 1:size(C,1)
    f{end+1} = [1,C(i,:)];
end
C = nchoosek(v,3);
for i = 1:size(C,1)
    f{end+1} = [1,C(i,:)];
end
C = nchoosek(v,4);
for i = 1:size(C,1)
    f{end+1} = [1,C(i,:)];
end
C = nchoosek(v,5);
for i = 1:size(C,1)
    f{end+1} = [1,C(i,:)];
end