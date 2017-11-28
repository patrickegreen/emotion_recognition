function [filteredInterests] = filterInterest(interests, imgSize, imgBounds)
% Filter interests points to those inside the bounds, cuts corners
% @param interests - array of linear indices, potential interest points
% @param imgSize - [Y, X] size of image
% @param imgBounds - [iX, iY] indent percentages in X and Y
%
% NOTE: boundaries are crude, exact to pixel not important
    %% Determine the linear constraints in the four corners
    bounds = zeros(4, 3);   % 4 constraints (slope, intercept, boolGT)
    filteredInterests = [];
    Y = imgSize(1);     % pixel dimensions
    X = imgSize(2);
    iX = imgBounds(1);   % indent percentages
    iY = imgBounds(2);
    indentX = round(X * iX);
    indentY = round(Y * iY);
    [yCenter,xCenter] = ind2sub(imgSize, floor(X*Y/2)+1);
    % Slopes
    mPos = indentY / indentX;   % UL, LR
    mNeg = -mPos;   % UR, LL
    % Intercepts
    a1 = [1 - 
    
    
end

