%% read in images in black and white 
% [ blankFaces, frownFaces, smileFaces, surpriseFaces, tongueFaces ] = readData();

%% rasterize images
% [rasterizedBlankFaces, rasterizedFrownFaces, rasterizedSmileFaces, rasterizedSurpriseFaces, rasterizedTongueFaces] = rasterizeSet(blankFaces, frownFaces, smileFaces, surpriseFaces, tongueFaces);

%% compute all 5 means
blankMean = mean(rasterizedBlankFaces, 2);
frownMean = mean(rasterizedFrownFaces, 2);
smileMean = mean(rasterizedSmileFaces, 2);
surpriseMean = mean(rasterizedSurpriseFaces, 2);
tongueMean = mean(rasterizedTongueFaces, 2);

%% calculate subtracted means (phi)
phiBlank = rasterizedBlankFaces(:,:) - blankMean(:,1);
phiFrown = rasterizedFrownFaces(:,:) - frownMean(:,1);
phiSmile = rasterizedSmileFaces(:,:) - smileMean(:,1);
phiSurprise = rasterizedSurpriseFaces(:,:) - surpriseMean(:,1);
phiTongue = rasterizedTongueFaces(:,:) - tongueMean(:,1);

%% matrix A

blankA = [phiBlank];
frownA = [phiFrown];
smileA = [phiSmile];
surpriseA = [phiSurprise];
tongueA = [phiTongue];

covBlankA = cov(blankA);
