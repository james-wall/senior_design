path = 'Coma Data/';
front = 'eeg';
back = 'P.mat';
i=1;
data_str = strcat(path,front,num2str(i),back);
load(data_str)
data = EEGDataP;
%% 20s Epoch Length
[corr, total] = xcorr_v1(data,20,30,'percent');

figure
[G, adj] = thresh_graph(corr,0.4);
plot(G)
title('E_{l} = 20 sec, E_{n} = 30, T = 0.4')

figure
[G, adj] = thresh_graph(corr,0.6);
plot(G)
title('E_{l} = 20 sec, E_{n} = 30, T = 0.6')

figure
[G, adj] = thresh_graph(corr,0.8);
plot(G)
title('E_{l} = 20 sec, E_{n} = 30, T = 0.8')
%% 60s Epoch Length
[corr, total] = xcorr_v1(data,60,10,'percent');

figure
[G, adj] = thresh_graph(corr,0.4);
plot(G)
title('E_{l} = 60 sec, E_{n} = 30, T = 0.4')

figure
[G, adj] = thresh_graph(corr,0.6);
plot(G)
title('E_{l} = 60 sec, E_{n} = 30, T = 0.6')

figure
[G, adj] = thresh_graph(corr,0.8);
plot(G)
title('E_{l} = 60 sec, E_{n} = 30, T = 0.8')