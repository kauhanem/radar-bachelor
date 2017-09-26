function [distance] = bhattacharyya(P,Q)
    % BHATTACHARYYA Bhattacharyya distance.
    % bhattacharyya(P,Q) is the Bhattacharyya distance between two discrete
    % probability distributions P and Q.
    
    bc = sum(sqrt(P.*Q));
    distance = -log(bc);
end