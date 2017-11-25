function [distance] = bhattacharyya(P,Q)
    % BHATTACHARYYA Bhattacharyya distance.
    %
    % bhattacharyya(P,Q) is the Bhattacharyya distance between two discrete
    % probability distributions P and Q.
    %
    % Mikko Kauhanen
    % mikko.kauhanen@student.tut.fi
    
    bhattacharyya_coefficient = sum(sqrt(P.*Q));
    
    distance = -log(bhattacharyya_coefficient);
end