function [ m ] = getEpoch( data, l)
%input: data (column vector); l is the desired epoch length (in seconds)
%output: m is a matrix with each row representing an epoch, number of rows
%is equal to number of epochs

epochLength = l*250; %data was sampled at 250 Hz
numSamples = length(data);
[x numChannels] = size(data);

m = vec2mat(data,epochLength);
m=m';

end

