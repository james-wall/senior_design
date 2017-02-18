function [ corr, comb ] = crossCorrNetwork( data, channels, epoch, epochNum )
%input: data - entire patient's unprocessed data; epoch - time in seconds;
%epochNum - number of epochs to analyze, from the first epoch
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
        
        %select consecutive epochs determined by epochNum
        c1Test = getEpoch(c1data,epoch);
        c1Test1 = c1Test(:,1:epochNum);
        c2Test = getEpoch(c2data,epoch);
        c2Test1 = c2Test(:,1:epochNum);
        [x numEpoch] = size(c1Test);
        
        corr(:,i) = crossCorr(c1Test1, c2Test1);
        
    end
end
end
