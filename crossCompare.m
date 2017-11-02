function [crossCompare] = crossCompare(histograms,D)
    crossCompare = zeros(nchoosek(size(histograms,2),2),...
                                  size(histograms{1}.data,2));
    
    laskin = 0;
    
    for i = 1:length(histograms)
        for j = i+1:length(histograms)
            laskin = laskin + 1;
            crossCompare(laskin,:) = compareTool(histograms{i}.data,...
                                                 histograms{j}.data,D);
        end
    end
end