function [interests, Ix, Iy] = harrisDetector(img, sigma_smooth, sigma_derivative, alpha, T, display)
    %%% Harris Detector %%%
    % Apply Gaussian derivative filters using sigma = 0.7
    [Gx,Gy] = gaussDeriv2D(sigma_derivative);
    Ix = imfilter(img, Gx, 'replicate');
    Iy = imfilter(img, Gy, 'replicate');
    % Calculate the product combinations of derivatives
    Ix2 = Ix .* Ix;
    Iy2 = Iy .* Iy;
    Ixy = Ix .* Iy;
    % Apply Gaussian window filters using sigma = 1 to each product
    G = fspecial('gaussian', 2*ceil(3*sigma_smooth)+1, sigma_smooth);  % 2D
    gIx2 = imfilter(Ix2, G, 'replicate');
    gIy2 = imfilter(Iy2, G, 'replicate');
    gIxy = imfilter(Ixy, G, 'replicate');
    % Calculate smoothness: from components
    %   R = det(M) - alpha * trace(M)
    detM = gIx2.*gIy2 - gIxy.^2;
    traceM = (gIx2 + gIy2).^2;
    R = detM - alpha .* traceM;
    % Threshold values
    R(R<T) = 0; 

    % Non-Maximal Suppression
    potentials = find(R)';   % non-zero elements, linear indices
    interests = [];
    n_offset = neighborhoodOffsets(R);
    min_offset = min(n_offset(:));
    max_offset = max(n_offset(:));
    numelR = numel(R);
    for iLinear = potentials
        if iLinear + min_offset < 1 || iLinear + max_offset > numelR
            % Ensure that offsets don't reach outside the image
            %   (not needed for this particular image)
            continue
        end
        % Build a neighborhood around the element
        neighbors = R(iLinear + n_offset);       % 3x3
        % Keep potentials that are maximal AND unique in neighborhood
        nmax = max(neighbors(:));
        if nmax == neighbors(5) &&  length(neighbors(neighbors==nmax)) == 1
            % NOTE: Element 5 is center in 3x3
            interests(end+1) = iLinear;
        end
    end
    % Display Corners on original image
    if display
        plotImage(img, interests, 'Harris Detection', false, true);
    end
end