%%%%%%%%%%%%%%%%%%%%myDequantization Function%%%%%%%%%%%%%%%%%%%%%%%
function [dqSignal] = myDeQuantization(Signal, K, scaleFactor)
samples_count = (size(Signal));
Signal=Signal*scaleFactor;
bits = K;
levels = 2^bits;
step_size = (2*scaleFactor)/levels;
Fs=8192;
if (samples_count(2) > 2*Fs )
    No_Samples = (2*Fs);
else
    No_Samples = samples_count(2);
end
No_Samples = samples_count(2);
time = [1:No_Samples];

% Calculating
for k = 1:No_Samples
    dqSignal(k) = Signal(k)+step_size/2;
end
end 
