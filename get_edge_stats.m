function [ mu, sigma, max_degree ] = get_edge_stats( adj )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

degree_vector = sum(adj,2);
mu = mean(degree_vector);
sigma = std(degree_vector);
max_degree = max(degree_vector);


end

