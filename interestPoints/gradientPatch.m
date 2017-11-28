function [gradient] = gradientPatch(sigma)
% UNDER DEVELOPMENT - NOT IN USE
    [Gx,Gy] = gaussDeriv2D(sigma);
    Ix = imfilter(img, Gx, 'replicate');
    Iy = imfilter(img, Gy, 'replicate');


end

