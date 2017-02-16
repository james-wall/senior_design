load('Coma_Data/Ceeg1P.mat')
x = EEGDataP;
numChannels = size(x,2);
correlations = zeros(numChannels, 1);
lags = zeros(numChannels, 1);
lag_bound = 0;

figure
for i = 1:(numChannels - 1)
    
    c1 = x(:,i);
    c2 = x(:,18);
    
    max_val = -100;
    max_lag = -1;

    val = xcorr(c1, c2, lag, 'coeff');

    correlations(i) = val;
    
%     subplot (18, 1, i);
%     plot(c1)
end

correlations