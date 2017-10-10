function [distance] = hellinger(P,Q)
    % HELLINGER Hellinger distance.
    %
    % hellinger(P,Q) is the Hellinger distance between two discrete
    % probability distributions P and Q.
    
    distance = sqrt(sum((sqrt(P) - sqrt(Q)).^2)) / sqrt(2);
end