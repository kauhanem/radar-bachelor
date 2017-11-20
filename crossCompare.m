function [crossCompare] = crossCompare(histograms,D)                          
    crossCompare = cell(1,nchoosek(size(histograms,2),2));
    
    laskin = 0;
    
    newCompare = struct('name1','','name2','','data',0);
    
    for i = 1:length(histograms)
        for j = i+1:length(histograms)
            laskin = laskin + 1;
            
            newCompare.name1 = histograms{i}.name;
            newCompare.name2 = histograms{j}.name;
            
            newCompare.data = compareTool(histograms{i}.data,...
                                          histograms{j}.data,D);
                                             
            crossCompare{laskin} = newCompare;
        end
    end
end