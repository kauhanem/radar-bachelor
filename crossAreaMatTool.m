function [a,b] = crossAreaMatTool(histograms,D,N)
    a = zeros(length(histograms)-1,size(histograms{1}.data,2));
    b = cell(1,length(histograms)-1);
    
    skaala = -180 : 360/size(histograms{1}.data,2) : 179.999999;
    
    for i = 1:length(histograms)
        laskin = 0;
        for j = 1:length(histograms)
            if i ~= j
                laskin = laskin + 1;
                
                a(laskin,:) = compareTool(histograms{i}.data,...
                                          histograms{j}.data,D);
                
                b{laskin} = strcat(histograms{i}.name,'&',...
                                   histograms{j}.name);                               
            end
        end
        
        if N
            for m = 1:size(histograms{1}.data,2)
                a(:,m) = a(:,m) ./ sum(a(:,m));
            end
        end

        figure();
        
        area(skaala, a');
        xlabel('Atsimuutti (\circ)');
        legend(b);

        xlim([-180 179]);

        if N
            ylim([0 1]);
            yticks(inf);
        end
    end
end