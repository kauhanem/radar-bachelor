function [] = compareAndVisualize(P,Q)
    % COMPAREANDVISUALIZE Compare and visualize RCS histograms.
    % compareAndVisualize(P,Q) calculates the statistical distance between
    % two discrete probability distributions P and Q, and visualizes their
    % differences.
    
    figure();
    
    subplot(3,1,1);
    imagesc(P);
    colormap('jet');
    set(gca,'YDir','normal');
    title('P');
    
    subplot(3,1,2);
    imagesc(Q);
    colormap('jet');
    set(gca,'YDir','normal');
    title('Q');
    
    B = zeros(1, length(P));

    for i = 1:length(P)
        B(i) = bhattacharyya(P(:,i), Q(:,i));
    end
    
    subplot(3,1,3);
    stairs(-180 : 360/length(P) : 179.999999, B);
    hold on;
    plot([-180 180], [mean(B) mean(B)]);
    title('Bhattacharyya distance');
    ylabel('Distance');
    xlabel('Azimuth ({\circ})');
    
    axis([-180 180 0 1.25*max(B)]);
end