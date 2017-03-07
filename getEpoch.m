function [e1, e2] = getEpoch( data1, data2, l, parameter, epochNum)
%input: data (column vector); l is the desired epoch length (in seconds);
%parameter is a string that determines how epochs are selected - 'random'
%'consecutive'; numEpochs is the number of epochs selected
%output: e is matrix with the chosen epochs, m is a matrix with all epochs (each column representing an epoch, number of
%columns is equal to total number of epochs)

epochLength = l*250; %data was sampled at 250 Hz

m1 = vec2mat(data1,epochLength);
m1=m1';
[y1, totEpochs1] = size(m1);
m2 = vec2mat(data2,epochLength);
m2=m2';
[y2, totEpochs2] = size(m2);

switch parameter
    case 'random'
        randIndex = randi([1 totEpochs1],1,epochNum);
        e1 = m1(:,randIndex);
        e2 = m2(:,randIndex);
    case 'consecutive'
        randIndex = randi([1 (totEpochs1-epochNum)]);
        e1 = m1(:,randIndex:(randIndex+epochNum-1));
        e2 = m2(:,randIndex:(randIndex+epochNum-1));
    otherwise
        warning('Unexpected epoch selection. No epochs created.')
end

end

