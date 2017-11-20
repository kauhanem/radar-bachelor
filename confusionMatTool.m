function [confusionMat] = confusionMatTool(histograms,d1,d2)
    grams = length(histograms);
    confusionMat = zeros(grams,grams);
    
    for i = 1:length(histograms)     
        for j = i+1:grams
            confusionMat(i,j) = mean(compareTool(histograms{i}.data,...
                                                 histograms{j}.data,d1));
            confusionMat(j,i) = mean(compareTool(histograms{i}.data,...
                                                 histograms{j}.data,d2));
        end
    end

    labels = cell(1,grams);
    
    for i = 1:grams
        labels{i} = histograms{i}.name;
    end
    
    figure();
    h = heatmap(labels,labels,confusionMat);
    
    %h.Title = 'Confusion matrix';
    
    %h.YLabel = 'Hellinger';
end