path = 'Coma Data/';
front = 'Ceeg';
back = 'P.mat';
edge_sum2 = zeros(16);

figure
for i=1:10
    data_str = strcat(path,front,num2str(i),back);
    load(data_str)
    data = EEGDataP;
    [corr, total] = xcorr_v1(data,60,10,'percent');
    [G, adj] = thresh_graph(corr,0.6);
    edge_sum2 = edge_sum2 + adj;
    subplot(5,2,i)
    plot(G)
    title(['Graph for patient ',num2str(i)])
end
figure
Gavg = graph(edge_sum2>=8);
plot(Gavg)