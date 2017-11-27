function [ rasterizedBlankFaces, rasterizedFrownFaces, rasterizedSmileFaces, rasterizedSurpriseFaces, rasterizedTongueFaces ] = rasterizeSet( blankFaces, frownFaces, smileFaces, surpriseFaces, tongueFaces )
    % rasterize each face set
    for i=1:22
        rasterizedBlankFaces(:,i) = reshape(blankFaces(:,:,i), 1, []);
    end

    for i=1:22
        rasterizedFrownFaces(:,i) = reshape(frownFaces(:,:,i), 1, []);
    end

    for i=1:22
        rasterizedSmileFaces(:,i) = reshape(smileFaces(:,:,i), 1, []);
    end

    for i=1:22
        rasterizedSurpriseFaces(:,i) = reshape(surpriseFaces(:,:,i), 1, []);
    end

    for i=1:22
        rasterizedTongueFaces(:,i) = reshape(tongueFaces(:,:,i), 1, []);
    end
end

