load('FrSaveData1.mat')
load('FrSaveData1u.mat')
load('FrSaveData5.mat')
load('FrSaveData3u.mat')
tmpMean= zeros(size(FrSaveData5,1),1);
for i = 1:size(FrSaveData5,1)
    tmpMean(i) = mean(Normalization(findpeaks(FrSaveData5(i,:))));
end