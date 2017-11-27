function [ rasterizedBlankFaces, rasterizedFrownFaces, rasterizedSmileFaces, rasterizedSurpriseFaces, rasterizedTongueFaces ] = rasterizeSet( blankFaces, frownFaces, smileFaces, surpriseFaces, tongueFaces )
    % rasterize each face set
    for i=1:18
        rasterizedBlankFaces(:,i) = reshape(blankFaces(:,:,i), 1, []);
    end

    for i=1:18
        rasterizedFrownFaces(:,i) = reshape(frownFaces(:,:,i), 1, []);
    end

    for i=1:18
        rasterizedSmileFaces(:,i) = reshape(smileFaces(:,:,i), 1, []);
    end

    for i=1:18
        rasterizedSurpriseFaces(:,i) = reshape(surpriseFaces(:,:,i), 1, []);
    end

    for i=1:18
        rasterizedTongueFaces(:,i) = reshape(tongueFaces(:,:,i), 1, []);
    end
end

