%% Data Parameters
dataSource = 'data_smileVfrown.txt';
dataRoot = 'data/close_crop_gray';
classNames = ["Frown", "Smile"];
% classNames = ["Frown", "Smile", "Surprise", "Tongue"];
binCount = 12;
%% Harris Detector Paramters
T = 100;
neighSize = 5;
hsig_smooth = 1.0;
hsig_deriv = 0.7;
hsig_alpha = 0.05;
%% Run Classifier
accuracy = classifier(dataSource, dataRoot, classNames, binCount, T, neighSize, hsig_smooth, hsig_deriv, hsig_alpha);