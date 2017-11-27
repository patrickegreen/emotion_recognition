%% read in images in black and white 
[blankFaces, frownFaces, smileFaces, surpriseFaces, tongueFaces] = readData();

%% rasterize images
[rasterizedBlankFaces, rasterizedFrownFaces, rasterizedSmileFaces, rasterizedSurpriseFaces, rasterizedTongueFaces] = rasterizeSet(blankFaces, frownFaces, smileFaces, surpriseFaces, tongueFaces);

%% compute all 5 means

blankMean = mean(rasterizedBlankFaces, 2);
frownMean = mean(rasterizedFrownFaces, 2);
smileMean = mean(rasterizedSmileFaces, 2);
surpriseMean = mean(rasterizedSurpriseFaces, 2);
tongueMean = mean(rasterizedTongueFaces, 2);

concatTotal = [blankMean, frownMean, smileMean, surpriseMean, tongueMean];


totalMean = mean(concatTotal, 2);



%% calculate subtracted means (phi)

phiTotal = concatTotal(:,:) - totalMean(:,1);

%% Compute Eigenvectors and Eigenvalues
[eigvectors, score, eigvalues] = pca(concatTotal');

% 
% %% Keep top 5 vectors since there are 5 different types of faces
 numOfEigenFaces = 4;
 evectors = eigvectors(:, 1:numOfEigenFaces);
% 
 %% Calculate feature vectors for each image in data
features = evectors' * phiTotal;
% 
% 
% 
% %% Load test image and calculate a score for it
 testImage = rgb2gray(double(imread('tongue_21.jpg'))/255);
 [r, c] = size(phiTotal);
 featureVector = evectors' * (testImage(:) - totalMean);
 scores = arrayfun(@(n) 1 / (1 + norm(features(:,n) - featureVector)), 1:c);
% 
% %% Get top 5 scores
 [val, idcs] = sort(scores, 'descend');
 val(1:5)
 idcs(1:5)
 scores(idcs(1:5))
% 
% %% Show test image and top 5 matches
 figure
 imshow(testImage);
% 
figure;
for i = 1:5
    subplot(1, 5, i);
    if idcs(i) == 1
        fprintf("blank ");
        imshow(reshape(phiTotal(:, idcs(i)), 1350, 950)); % put back into 0-255 range
    
    elseif idcs(i) == 2
        fprintf("frown ");
        imshow(reshape(phiTotal(:, idcs(i)), 1350, 950)); % put back into 0-255 range


    elseif idcs(i) == 3
        fprintf("smile ");
        imshow(reshape(phiTotal(:, idcs(i)), 1350, 950)); % put back into 0-255 range

    elseif idcs(i) == 4
        fprintf("surprise ");
        imshow(reshape(phiTotal(:, idcs(i)), 1350, 950)); % put back into 0-255 range

    elseif idcs(i) == 5
        fprintf("tongue ");
        imshow(reshape(phiTotal(:, idcs(i)), 1350, 950)); % put back into 0-255 range

    end
end

%% Show eigenfaces
figure;
for n = 1:numOfEigenFaces
    subplot(2, ceil(numOfEigenFaces/2), n);
    evector = reshape(evectors(:,n), [1350, 950]);
    imshow(evector*255); % put back into 0-255 range
end

%% Shows cummulative eigenvalues for first 30 PC's
normalised_evalues = eigvalues / sum(eigvalues);
figure, plot(cumsum(normalised_evalues));
xlabel('No. of eigenvectors'), ylabel('Variance accounted for');
xlim([1 30]), ylim([0 1]), grid on;