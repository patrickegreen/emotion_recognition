%%% Main function %%%
% (1) Prepare data for training & test
f = fopen('data.txt', 'r');     % (filename, label)
data = textscan(f, '%s%d');
names = string(vertcat(data{:, 1}));
labels = vertcat(data{:, 2});
raw_count = size(labels, 1);
remove_idxs = [];
% Determine samples that are filtered from data (class label == 0)
for i = 1:raw_count
    if ~labels(i)
        remove_idxs(end+1) = i;
    end
end
% Remove invalid samples (start from last index)
remove_idxs = sort(remove_idxs, 'descend');
for ridx = remove_idxs
    names(ridx) = [];
    labels(ridx) = [];
end
sample_count = size(labels, 1);    % count of valid samples
% Split into training and test (70, 0, 30)
[train, validate, test] = dividerand(sample_count, 0.85, 0.0, 0.15);
train_count = size(train,2);
test_count = size(test,2);

% (2) Build histogram templates for each class in training set
root = 'data/close_crop_gray';
classes = ["Frown", "Smile", "Surprise", "Tongue"];
cN = size(classes,2);     % class count
bin_count = 12;
T = 50;
hist = zeros(cN, bin_count);    % row per class (frown, smile, surprise, tongue)
class_counts = zeros(1,cN);  % counts of each class for normalization
for idx = train
    name = names(idx);
    label = labels(idx);
    filename = sprintf('%s/%s', root, name);
    img = double(imread(filename));
    % Get histogram and update appropriate class template / count
    [h, interests] = gradientHistogram(img, bin_count, T);
    hist(label, :) = hist(label, :) + h;    
    class_counts(label) = class_counts(label) + 1;
end
% Normalize each class histogram by count
for i = 1:cN
    hist(i, :) = hist(i, :) ./ class_counts(i);
    bar(hist(i, :));
    title(sprintf('Class %s', classes(i)));
    pause;
end

% (3) Classify Test Data
% Chi-squared distance (sum of square of difference divided by sum of magnitudes)
total_correct = 0;
for idx = test
    name = names(idx);
    label = labels(idx);
    filename = sprintf('%s/%s', root, name);
    img = double(imread(filename));
    % Get histogram and find best matching template
    [h, interests] = gradientHistogram(img, bin_count, T);
    D = zeros(1, cN);
    for i = 1:cN
        template = hist(i, :);
        dist = chiDistance(h, template);
        D(i) = dist;
    end
    [dist, guess] = min(D);
    correct = guess == label;
    if correct
        total_correct = total_correct + 1;
    end
    % Display test image with results
    title = sprintf('Guess=%s, Actual=%s', classes(guess), classes(label));
    plotImage(img, interests, title, false, true);
    accuracy = total_correct / test_count;
end

