clc
clear all
load laughter
% K = 3;
% N = 4;
K=input('Enter the quantization level => K : ');
N=input('Enter the Prediction order => N : ');
[r,e] = openLoopDPCMdemo(y,K,N);
plot(y);
hold on;
plot(r,'--');
%sound(r)
legend('original signal', 'decoded signal')
figure
plot(e);title('transmitted signal','fontweight','normal')
num=sum(y.^2);
%de=sum((e).^2);
df=sum((y-r).^2);
%snr_e=10*log10(num./de)
snr_r=10*log10(num./df)
