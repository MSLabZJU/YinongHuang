clc
clear

load P_KNN_2.mat;
% xlswrite('precise.xls',P)
% load cate.mat;
% f = {};
% n = size(cate,2);
% v = 1:n;
% for j = 1: n
%     C = nchoosek(v,j);
%     for i = 1:size(C,1)
%         f{end+1,1} = C(i,:);
%     end
% end
Precise = zeros(size(P,2),4);
for k = 1: size(P,2)
    tmp = P{k};
    miss = mean(tmp(:,1));
    false = mean(tmp(:,2));
    Precise(k,1) = miss;
    Precise(k,2) = false;
    Precise(k,3) = 2*miss*false./(miss+false);
    Precise(k,4) = (miss+false)./2; 
end