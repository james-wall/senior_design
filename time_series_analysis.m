function [ h thresholds ] = time_series_analysis( t1, threshold_value )
%input: t1 is a time series name
%       threshold_value is the threshold_value each value in the array is
%       being tested against
%output: thresholds: a vector containing a simple 0-1 bit pattern
%        h:         a histogram object        

sizeInput  = size(t1);
thresholds = zeros(sizeInput,1);
t1 = preProcess_time_series(t1);  %takes the name returns an array
countOnes = 0;

for i = 1:sizeInput
    if(t1(i) > threshold_value)
        thresholds(i) = 1;
        countOnes = countOnes + 1;
    end
end
h = histogram(thresholds);

end