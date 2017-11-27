function [D] = chiDistance(h1, h2)
% Chi-squared distance between two histograms
    sq_diff = (h1 - h2) .^2;
    total = h1 + h2;
    D = sum(sq_diff ./ total);
end

