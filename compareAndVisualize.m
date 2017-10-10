function [] = compareAndVisualize(P,Q,D)
    % COMPAREANDVISUALIZE Compare and visualize RCS histograms.
    %
    % compareAndVisualize(P,Q) calculates the statistical distance using
    % total variation distance between two discrete probability
    % distributions P and Q, and visualizes their differences.
    %
    % compareAndVisualize(P,Q,distance) calculates the statistical distance
    % using the statistical distance specified in character string D
    % between two discrete probability distributions P and Q, and
    % visualizes their differences.
    
    % Default value for distance, throw errors for too few parameters.
    switch nargin
        case 1
            % ERROR
        case 2
            if isempty(D)
                D = 'totalVariationDistance';
            else
                % ERROR
            end
    end
    
    % Select used distance
    switch D
        case {'t','T','total','tvd','totalVariationDistance'}
            fun = @totalVariationDistance;
            titleText = 'Total variation distance';
            
        case {'b','B','bhat','bhattacharyya'}
            fun = @bhattacharyya;
            titleText = 'Bhattacharyya distance';
            
        case {'h','H','hell','hellinger'}
            fun = @hellinger;
            titleText = 'Hellinger distance';
    end
    
    figure();
    
    % Plot histogram matrix P
    subplot(3,1,1);
    
    imagesc(P);
    colormap('jet');
    set(gca,'YDir','normal');
    
    title('P');
    
    % Plot histogram matrix Q
    subplot(3,1,2);
    
    imagesc(Q);
    colormap('jet');
    set(gca,'YDir','normal');
    
    title('Q');
    
    % Calculate the distances
    distances = zeros(1, size(P,2));

    for i = 1:size(P,2)
        distances(i) = fun(P(:,i), Q(:,i));
    end
    
    % Plot the distances
    subplot(3,1,3);
    
    stairs(-180 : 360/size(P,2) : 179.999999, distances);
    hold on;
    plot([-180 180], [mean(distances) mean(distances)]); % Plots mean value
    
    title(titleText);
    ylabel('Distance');
    xlabel('Azimuth ({\circ})');
    
    % Scale axis
    if max(distances) >= 0.8
        maxY = 1.25 * max(distances);
    else
        maxY = 1;
    end
    
    axis([-180 180 0 maxY]);
end