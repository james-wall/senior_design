function [final_corr, complete_corr] = xcorr_v1(data, epochTime, numEpochs, descriptor)
%% Inputs
%   data - unprocessed user data
%   epochTime - length of epoch (aka window) in seconds
%   numEpochs - currently only use this number of epochs for the
%       correlation calculations. It is the first x number of epochs in the
%       data.
%   threshold - If the absolute value of the correlation of two channels exceeds this
%       threshold, then there is a connection between the two channels.

%% Process Data
x = processData(data);
[unused, numChannels] = size(x);
%Final correlations/corresponding lags will be stored in these
correlations = zeros(numChannels,numChannels, numEpochs);

%% Cross Correlation Calculations
for i = 1:numChannels
    for j = 1:numChannels
        %Avoid autocorrelation and redundancies
        if i == j
            correlations(i,j,1:numEpochs) = 0;
        else
            c1 = x(:,i);
            c2 = x(:,j);
            
            cw1 = getEpoch(c1, epochTime);
            cw2 = getEpoch(c2, epochTime);
            windows1 = cw1(:,1:numEpochs);
            windows2 = cw2(:,1:numEpochs);
            
            cur_corr = crossCorr(windows1, windows2);
            
            correlations(i,j,1:numEpochs) = cur_corr;
        end
    end
end
complete_corr = correlations;

%% Calculate final correlations based on descriptor
switch descriptor
    case 'avg'
        final_corr = mean(correlations,3);
    case 'percent'
        final_corr = prctile(correlations,75,3);
    case 'max'
        final_corr = max(correlations, 3);
end
end