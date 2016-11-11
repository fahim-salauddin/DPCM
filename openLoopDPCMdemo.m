function [r,e] = openLoopDPCMdemo(x,K,N)
%usage: [r,e] = openLoopDPCMdemo(x,K,N)
%input: x -- signal
% K -- predictor order
% N -- number of bits for quantization
%output: r -- reconstrcted/decoded signal
% e -- transmitted signal
%
%purpose: a demonstration of close-loop DPCM
%example:
%define x here
% K = 3;
% N = 4;
% [r,e] = openLoopDPCMdemo(x,K,N);
% plot(x);
% hold on;
% plot(r,'--');
% legend('original signal', 'decoded signal')
% figure
% plot(e);title('transmitted signal')
%author: D.Deng, d.deng@latrobe.edu.au
%last update: 03/03/2015
%for illustration purpose, I use for-loop
x = x(:); %make x a column vector
M = length(x);
predCoeff = lpc(x,K);
predCoeff = -predCoeff(2:end)';
%memory allocation
x = [zeros(K,1);x]; %append N zeros to x
e = zeros(size(x));
r = e;
%parameters for uniform quantization
D = max(x) - min(x);
S = D/2^(N-1); %step size, 1-bit used as sign bit
%run through the whole signal, encoder part
for n = K+1 : M+K
p = sum(predCoeff.*x(n-1:-1:n-K));%make prediction
err = x(n) - p; %prediction error
signErr = sign(err);%sign info
e(n) = floor(abs(err)/S);%quantized error
end
%decoder part
for n = K+1 : M+K
de = signErr*(e(n)+0.5)*S; %dequantization
p = sum(predCoeff.*r(n-1:-1:n-K));%make prediction
r(n) = de + p ; %reconstruction
end
r = r(K+1:length(x));
e = e(K+1:length(x));
end