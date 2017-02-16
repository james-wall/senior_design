function [ p ] = processData( data )
%input: patient's data matrix, consisting of 18 channels across entire time
%duration
%output: patient's data matrix with channels 5 and 15 removed,
%filtered all samples for noise (tested with cutOffFreq of 50, can change later)

actualData = [data(:,1:4) data(:,6:14) data(:,16:end)]; 

sampleRate = 250; % Hz
cutOffFreq = 50; % Hz, check with Sina for correct cut-off frequency
filterOrder = 2; % Filter order (e.g., 2 for a second-order Butterworth filter)
[b, a] = butter(filterOrder, cutOffFreq/(sampleRate/2)); % Generate filter coefficients
filteredData = filtfilt(b, a, actualData); % Apply filter to data using zero-phase filtering

p = filteredData; 

end

