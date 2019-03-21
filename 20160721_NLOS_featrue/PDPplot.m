load('FrSaveData2u.mat')
load('FrSaveData3u.mat')
figure,
plot(Normalization(FrSaveData2u(1,:)));
hold on
plot(Normalization(FrSaveData3u(1,:)),'r');
hold off
legend('LOS','NLOS')