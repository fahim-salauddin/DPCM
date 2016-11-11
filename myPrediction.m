%%%%%%%%%%%%%%%%%%%%%%%myPrediction Function%%%%%%%%%%%%%%%%%%%%%%%%

function [indx, quanterr] = myPrediction(sig,predictor)
codebook = [-1:.1:1];
len_predictor = length(predictor) - 1;
predictor = predictor(2:len_predictor+1);
predictor = predictor(:)';
len_sig = length(sig);
partition = [-1:.1:.9];

x = zeros(len_predictor, 1);
for i = 1 : len_sig;
    out = predictor * x;
    e = sig(i) - out;
    % index
    indx(i) = sum(partition < e);
    % quantized value
    quanterr(i) = codebook(indx(i) + 1);
    inp = quanterr(i) + out;
    % renew the estimated output
    x = [inp; x(1:len_predictor-1)];
end;
end

