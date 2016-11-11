%%%%%%%%%%%%%%%%%%%%%%%%%%myPredictionReconstruction
%%%%%%%%%%%%%%%%%%%%%%%%%%Function%%%%%%%%%%%%%%%%%%%%%%%%

function [reconstructSignal] = myPredictionReconstruction(indx, predictor)
len_predictor = length(predictor) - 1;
predictor = predictor(2:len_predictor+1);
predictor = predictor(:)';
len_sig = length(indx);
codebook = [-1:.1:1];

quanterr = indx;
quanterr = codebook(indx+1);

x = zeros(len_predictor, 1);
for i = 1 : len_sig;
    out = predictor * x;
    reconstructSignal(i) = quanterr(i) + out;
    % renew the estimated output
    x = [reconstructSignal(i); x(1:len_predictor-1)];
end;
end
% eof
