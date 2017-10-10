function [distance] = bhattacharyya(P,Q)
    % BHATTACHARYYA Bhattacharyya distance.
    %
    % bhattacharyya(P,Q) is the Bhattacharyya distance between two discrete
    % probability distributions P and Q.
    
    bhattacharyya_coefficient = sum(sqrt(P.*Q));
    
    distance = -log(bhattacharyya_coefficient);
end