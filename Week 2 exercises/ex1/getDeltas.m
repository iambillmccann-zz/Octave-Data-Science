function deltas = getDeltas(X, y, theta)
%GETDELTAS return the vector of deltas for all features in the data
%   deltas = GETDELTAS(X, y, theta)

    items = length(theta);
    for j = 1:items
        deltas(j) = computeDelta(X, y, theta, j);
    end

    deltas = deltas';
    
end
