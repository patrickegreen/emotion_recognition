function [gradient] = gradientPatch(sigma)
%GRADIENTPATCH Find the mean gradient direction in patch
%   gaussian weighting from interest point
    [Gx,Gy] = gaussDeriv2D(sigma);
    Ix = imfilter(img, Gx, 'replicate');
    Iy = imfilter(img, Gy, 'replicate');


end

