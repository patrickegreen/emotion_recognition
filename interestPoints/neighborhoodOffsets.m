function [ offsets ] = neighborhoodOffsets(M, N)
    % Get a offset matrix to produce the neighborhood in M
    %   M: matrix from which to select neighborhood
    %   N: size of the neighborhood (must be odd)
    % USE: Given a linear index I, neighborhood = M(I + offsets)
    %      Fails if offset hits areas outside the image.
    % REF: https://www.mathworks.com/matlabcentral/answers/86900-how-to-find-all-neighbours-of-an-element-in-n-dimensional-matrix
    sizeM = size(M);
    dimM = length(sizeM);   % number of dimensions
    [index_grid{1:dimM}] = ndgrid(1:N);   % indices in each dimension
    dim_grid(1:dimM) = {ceil(N/2)}; % index of center in each dimension
    offsets = sub2ind(sizeM,index_grid{:}) - sub2ind(sizeM,dim_grid{:});
end

