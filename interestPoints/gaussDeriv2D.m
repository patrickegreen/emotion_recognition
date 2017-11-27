function [Gx, Gy] = gaussDeriv2D(sigma)
    % Compute 2D Gaussian Derivative Masks of size 3sigma
    bound = ceil(3*sigma);
    mask_size = bound*2 + 1;    % Dimensions of Gx, Gy
    range = linspace(-bound, bound, mask_size); % Sampled values of x, y
    Gx = zeros(mask_size, mask_size);   % Empty matrix, populated in loop
    for r = 1:mask_size
        y = range(r);   % rows correspond to y values (symmetric though)
        for c = 1:mask_size
            x = range(c);   % columns correspond to x values (symmetric though)
            % Partial derivative of 2D Gaussian in x; x0 = y0 = 0
            Gx(r,c) = -x/(2*pi*sigma^4)*exp(-(x^2+y^2)/(2*sigma^2));
        end
    end
    Gy = Gx';   % only need to compute one
end
