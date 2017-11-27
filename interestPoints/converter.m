%%% Convery RGB images to Grayscale %%%
f = fopen('data.txt', 'r');     % (filename, label)
data = textscan(f, '%s%d');
names = string(vertcat(data{:, 1}));
labels = vertcat(data{:, 2});
raw_count = size(labels, 1);
remove_idxs = [];
sample_count = size(labels, 1);    % count of valid samples
root = 'data/close_crop';
for i = 1:raw_count
    sample_name = names(i);
    filename = sprintf('%s/%s', root, sample_name);
    face = double(imread(filename));
    face = face ./ double(max(face(:)));
    face = rgb2gray(face);
    imwrite(face, sprintf('data/close_crop_gray/%s', sample_name));
end

