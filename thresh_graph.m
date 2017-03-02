function [G, adjacency] = thresh_graph(correlation_matrix, threshold)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
adjacency = abs(correlation_matrix)>threshold;
G = graph(adjacency~=0);

end

