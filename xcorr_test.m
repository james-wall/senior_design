%% Load Data
load('Coma_Data/Ceeg1P.mat')
x = EEGDataP;
numChannels = size(x,2);    %Set number of channels

%Final correlations/corresponding lags will be stored in these
correlations = zeros(numChannels, numChannels);
lags = zeros(numChannels, numChannels);

lag = 100;

%% Calculate cross correlations for all channels
for i = 1:numChannels
    for j = 1:numChannels
        %Avoid autocorrelation and redundancies
        if i == j || i < j
            correlations(i,j) = 0;
            lags(i,j) = 0;
        else
            c1 = x(:,i);
            c2 = x(:,j);

            %val will be an array of values from different lags
            val = xcorr(c1, c2, lag, 'coeff');
            [val_hi, lag_hi] = max(val); 
            [val_lo, lag_lo] = min(val);
            %find if 'max' is negative or positive
            if val_hi > -val_lo
                final_val = val_hi;
                final_lag = lag_hi;
            else
                final_val = val_lo;
                final_lag = lag_lo;
            end
            %set max value and corresponding lag
            correlations(i,j) = final_val;
            lags(i,j) = final_lag;
        end
    end
end