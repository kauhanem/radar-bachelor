function [distance] = totalVariationDistance(P,Q)
    distance = sum(abs(P-Q))/2;
end