function [] = areaMatTool(histograms,D,N) 
    areaMat = crossCompare(histograms,D);
    
    if N
        for m = 1:360
            areaMat(:,m) = areaMat(:,m) ./ sum(areaMat(:,m));
        end
    end
    
    figure();
    skaala = -180 : 360/size(histograms{1}.data,2) : 179.999999;
    
    area(skaala, areaMat');
end