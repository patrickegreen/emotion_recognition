%% Simple Run
dataRoot = 'data/close_crop_gray';

%dataSource = 'data_smileVfrown.txt';
%classNames = ["Frown", "Smile"];

dataSource = 'data.txt';
classNames = ["Frown", "Smile", "Surprise", "Tongue"];

binCount = 12;
T = 100;
neighSize = 9;
hsig_smooth = 1.0;
hsig_deriv = 0.7;
hsig_alpha = 0.05;
boundIndents = [0.3, 0.5];      % cut corners at (%X, %Y)

% Run Classifier
a1 = classifier(dataSource, dataRoot, classNames, binCount, T, neighSize, hsig_smooth, hsig_deriv, hsig_alpha, boundIndents);
%a2 = classifier(dataSource, dataRoot, classNames, binCount, T, neighSize, hsig_smooth, hsig_deriv, hsig_alpha, boundIndents);
%a3 = classifier(dataSource, dataRoot, classNames, binCount, T, neighSize, hsig_smooth, hsig_deriv, hsig_alpha, boundIndents);
%aMean = mean([a1,a2,a3]);