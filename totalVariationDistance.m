function [distance] = totalVariationDistance(P,Q)
    % TOTALVARIATIONDISTANCE Total variation distance.
    %
    % totalVariationDistance(P,Q) is the total variation distance between
    % two discrete probability distributions P and Q.
    
    distance = sum(abs(P-Q))/2;
end