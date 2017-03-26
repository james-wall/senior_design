path = 'Coma Data/';
front = 'Ceeg';
back = 'P.mat';
edge_sum2 = zeros(16);

El = 20;
En = 10;
T = 0.6;

%%figure
for i=1:10
    data_str = strcat(path,front,num2str(i),back);
    load(data_str)
    data = EEGDataP;
    [corr, total] = xcorr_v1(data,El,En,'percent');
    [G, adj] = thresh_graph(corr,T);
    edge_sum2 = edge_sum2 + adj;
%     subplot(5,2,i)
%     plot(G)
%     title(['Patient ',num2str(i)])
end
figure
final_adj = edge_sum2>=8;
Gavg = graph(final_adj);
plot(Gavg)
title({'Average Graph for Control Patients';['E_{l} = ' num2str(El) ', E_{n} = ' num2str(En) ', T = ' num2str(T)]})
[avgD, std_dev, maxD] = get_edge_stats(final_adj);