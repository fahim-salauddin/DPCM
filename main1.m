clear all;
close all;
clc;

load laughter;
Signal=y;
K=input('Enter the quantization level => K : ');
t=1:length(Signal);
%sound(Signal);

figure,plot(t/Fs*1000,Signal(t),'color',rand(1,3)); 
title('Original Signal','FontWeight','Normal');
xlabel('Time (ms)');
ylabel('m(t)');
grid on;

[qSignal, scaleFactor] = myQuantization(Signal, K);

figure,plot(t/Fs*1000,qSignal(t),'r','color',rand(1,3));
title('Quantized Signal','FontWeight','Normal');
xlabel('Time(ms)');
ylabel('Levels');
grid on;
%sound(qSignal)

[dqSignal] = myDeQuantization(qSignal, K, scaleFactor);

figure,plot(t/Fs*1000,dqSignal(t),'color',rand(1,3));
title('Reconstructed signal after Dequantization','FontWeight','Normal');
xlabel('Time(ms)');
ylabel('r(t)');
grid on;

N=[0 0.1 0.2];

[errSignal, predCoeff] = myPrediction(qSignal, N);
%sound(errSignal)
[reconstructsignal] = myPredictionReconstruction(errSignal, N);
sound(reconstructsignal)
figure,plot(t/Fs*1000,reconstructsignal(t),'color',rand(1,3));
title('Reconstructed signal by DPCM','FontWeight','Normal');
xlabel('Time(ms)');
ylabel('r(t)');
grid on;
num=sum(y.^2);
de=sum((y-dqSignal').^2);
de1=sum((y-reconstructsignal').^2);

snr=10*log10(num./de)
snr1=10*log10(num./de1)


