%%myQuantization Function

function [qSignal, scaleFactor] = myQuantization(Signal, K)

samples_count = (size(Signal));
scaleFactor = max (Signal);
Signal=Signal/scaleFactor;
bits = K;
levels = 2^bits;
step_size = (2*scaleFactor)/levels;
Fs=8192;
if (samples_count(1) > 2*Fs )
    No_Samples = (2*Fs);
else
    No_Samples = samples_count(1);
end

No_Samples = samples_count(1);
time = [1:No_Samples];

for k = 1:No_Samples
    samp_in(k) = Signal(k);
    qSignal(k) = (samp_in(k)/step_size)*step_size;
  error1(k) = (samp_in(k) - qSignal(k));
end

% Calculating
for k = 1:No_Samples,
    reconstructed(k) = qSignal(k)+step_size/2;
end
end

%Main Function
