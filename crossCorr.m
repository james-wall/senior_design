function [ corr ] = crossCorr( v1, v2 )
%input: v1 and v2 are data from two different channels
%output: a vector containing max correlation values from computing the cross-correlation
%between each corresponding column of v1 and v2 
%(assume each v1 and b2 are matrices of epochs, each column is an epoch)
if sum(size(v1) == size(v2)) ~= 2
    return;
end

[numSamples numIntervals] = size(v1);
corr = zeros(numIntervals,1);

for i = 1:numIntervals
corrVec = xcorr(v1(:,i),v2(:,i), 'coeff');
[a b] = max(abs(corrVec));
corr(i) = corrVec(b); 
end

end

