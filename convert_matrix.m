% soln = xcorr_v1(EEGDataP,5,20,0.9, 'avg');
% test = abs(soln)>0.7;
% G = graph(test~=0);
% plot(G)

hist_start = [];
for i=1:16
    for j = 1:16
        if i < j
            hist_start = [hist_start;edge_sum2(i,j)];
        end
    end
end
figure
hist(abs(hist_start),10)
