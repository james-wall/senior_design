function [ e, m ] = getEpoch( data, l, parameter, epochNum)
%input: data (column vector); l is the desired epoch length (in seconds);
%parameter is a string that determines how epochs are selected - 'random'
%'consecutive'; numEpochs is the number of epochs selected
%output: e is matrix with the chosen epochs, m is a matrix with all epochs (each column representing an epoch, number of
%columns is equal to total number of epochs)

epochLength = l*250; %data was sampled at 250 Hz
numSamples = length(data);
[x numChannels] = size(data);

m = vec2mat(data,epochLength);
m=m';
[y, totEpochs] = size(m);

switch parameter
    case 'random'
        randIndex = randi([1 totEpochs],1,epochNum);
        e = m(:,randIndex);
    case 'consecutive'
        randIndex = randi([1 (totEpochs-epochNum)]);
        e = m(:,randIndex:(randIndex+epochNum-1));
    otherwise
        warning('Unexpected epoch selection. No epochs created.')
end

end

