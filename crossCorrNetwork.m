function [ corr, comb ] = crossCorrNetwork( data, channels, epochLength, parameter, epochNum )
%input: data - entire patient's unprocessed data; epochLength - time in seconds;
%epochNum - number of epochs to analyze, from the first epoch, 
%parameter - type of epoch selection, 'random' or 'consecutive'
%channels - vector of chosen channels to compare
comb = combnk(channels,2);
numComb = size(comb,1);
corr = zeros(epochNum, numComb);

for i=1:numComb
    channelPair = comb(i,:);
    c1 = channelPair(1);
    c2 = channelPair(2);
    if c1==c2
        corr(i) = 10; %autocorrelation default value
    else
        %obtain channels 1 and 2 from processed patient data
        c1data = data(:,c1);
        c2data = data(:,c2);
        
        %For each channel: separate into epochs
        switch parameter
            case 'random'
                [ e1, m1 ] = getEpoch( c1data, epochLength, 'random', epochNum);
                [ e2, m2 ] = getEpoch( c2data, epochLength, 'random', epochNum);
            case 'consecutive'
                [ e1, m1 ] = getEpoch( c1data, epochLength, 'random', epochNum);
                [ e2, m2 ] = getEpoch( c2data, epochLength, 'random', epochNum);
            otherwise
                warning('invalid parameter entries')
        end
        
        corr(:,i) = crossCorr(e1, e2);
        
    end
end
end
