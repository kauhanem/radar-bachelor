function [distances] = compareTool(P,Q,D)
    % COMPARE Compare and visualize RCS histograms.
    %
    % compareAndVisualize(P,Q) calculates the statistical distance using
    % total variation distance between two discrete probability
    % distribution matrices P and Q, and visualizes their differences.
    %
    % compareAndVisualize(P,Q,distance) calculates the statistical distance
    % using the statistical distance specified in character string D
    % between two discrete probability distribution matrices P and Q, and
    % visualizes their differences.
    
    % Default value for distance, throw errors for too few parameters.
    switch nargin
        case 1
            error('Error: too few parameters.');
        case 2
            if isempty(D)
                D = 'totalVariationDistance';
            else
                error('Error: too few parameters.');
            end
    end
    
    % Select used distance
    switch D
        case {'t','T','total','tvd','totalVariationDistance'}
            fun = @totalVariationDistance;
            
        case {'b','B','bhat','bhattacharyya'}
            fun = @bhattacharyya;
            
        case {'h','H','hell','hellinger'}
            fun = @hellinger;
            
        otherwise
            error('Error: Distance parameter not known.');
    end
    
    % Calculate the distances
    distances = zeros(1, size(P,2));

    for i = 1:size(P,2)
        distances(i) = fun(P(:,i), Q(:,i));
    end
end