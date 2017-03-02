path = 'Coma_Data/';
front = 'Ceeg';
back = 'P.mat';
edge_sum2 = zeros(16);

for i=1:10
    data_str = strcat(path,front,num2str(i),back);
    load(data_str)
    data = EEGDataP;
    [corr, total] = xcorr_v1(EEGDataP,60,10,'percent');
    [G, adj] = thresh_graph(corr,0.6);
    edge_sum2 = edge_sum2 + adj;
end