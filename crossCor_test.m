%Testing:
%Find Cross-correlation of channel 1 and 2 of Patient 1 
%using 5 second epochs, compare first 20 epochs of each channel

%obtain data and process it to remove channels 5 and 15 and filter noise
load('Ceeg1P.mat')
preData = EEGDataP;
data = processData(preData);

%obtain channels 1 and 2 from processed patient data
c1 = data(:,1);
c2 = data(:,2);

%For each channel: separate into 5 second epochs, and
%select first 20 epochs
c1Test = getEpoch(c1,5);
c1Test = c1Test(:,1:20);
c2Test = getEpoch(c2,5);
c2Test = c2Test(:,1:20);

%returns a vector of length corresponding to number of epochs chosen
correlation = crossCorr(c1Test, c2Test);


