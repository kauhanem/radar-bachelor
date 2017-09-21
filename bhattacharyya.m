function [distance] = bhattacharyya(p,q)
    BC = sum(sqrt(p.*q));
    distance = -log(BC);
end