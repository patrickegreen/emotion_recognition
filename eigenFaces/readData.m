function [ blankFaces, frownFaces, smileFaces, surpriseFaces, tongueFaces ] = readData()
    % Load Blank Faces
    for i=1:9
        filename = sprintf('raw/blank_%02d.jpg', i); % if starts with 000
        blankFaces(:,:,i) = rgb2gray(double(imread(filename))/255);
    end
    for i=10:18
        filename = sprintf('raw/blank_%01d.jpg', i); % if starts with 000
        blankFaces(:,:,i) = rgb2gray(double(imread(filename))/255);
    end

    for i=1:9
        filename = sprintf('raw/surprise_%02d.jpg', i); % if starts with 000
        surpriseFaces(:,:,i) = rgb2gray(double(imread(filename))/255);
    end
    for i=10:18
        filename = sprintf('raw/surprise_%01d.jpg', i); % if starts with 000
        surpriseFaces(:,:,i) = rgb2gray(double(imread(filename))/255);
    end

    for i=1:9
        filename = sprintf('raw/frown_%02d.jpg', i); % if starts with 000
        frownFaces(:,:,i) = rgb2gray(double(imread(filename))/255);
    end
    for i=10:18
        filename = sprintf('raw/frown_%01d.jpg', i); % if starts with 000
        frownFaces(:,:,i) = rgb2gray(double(imread(filename))/255);
    end

    for i=1:9
        filename = sprintf('raw/smile_%02d.jpg', i); % if starts with 000
        smileFaces(:,:,i) = rgb2gray(double(imread(filename))/255);
    end
    for i=10:18
        filename = sprintf('raw/smile_%01d.jpg', i); % if starts with 000
        smileFaces(:,:,i) = rgb2gray(double(imread(filename))/255);
    end

    for i=1:9
        filename = sprintf('raw/tongue_%02d.jpg', i); % if starts with 000
        tongueFaces(:,:,i) = rgb2gray(double(imread(filename))/255);
    end
    for i=10:18
        filename = sprintf('raw/tongue_%01d.jpg', i); % if starts with 000
        tongueFaces(:,:,i) = rgb2gray(double(imread(filename))/255);
    end



end

