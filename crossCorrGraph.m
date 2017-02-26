function [ G ] = crossCorrGraph( data, channels, epochLength, parameter, epochNum, edgeType, threshold )
%input: same as crossCorrNetwork
%edgeType - string that specifies measure to determine an edge 
%threshold - threshold value for determining an edge (between 0 and 1)
%G - graph using generated edges and nodes

[ corr, comb ] = crossCorrNetwork( data, channels, epochLength, parameter, epochNum );

switch edgeType
    case 'average'
        corr = abs(corr);
        edgeVals = mean(corr,2); 
        index = find(edgeVals>threshold);
        edgeVals = edgeVals(index);
        nodes = comb(index,:);
        G = graph(nodes(:,1), nodes(:,2), edgeVals);
    otherwise 
        warning('invalid edge threshold entered')
end
        

end

