%% Varied Parameters
dataRoot = 'data/close_crop_gray';

%dataSource = 'data_smileVfrown.txt';
%classNames = ["Frown", "Smile"];
%f = fopen('interestPoints/output_smVf.txt', 'w');

dataSource = 'data.txt';
classNames = ["Frown", "Smile", "Surprise", "Tongue"];
f = fopen('interestPoints/output_all.txt', 'w');

hsig_smooth = 1.0;
hsig_deriv = 0.7;
hsig_alpha = 0.05;
boundIndents = [0.3, 0.5];      % cut corners at (%X, %Y)
% Variables
binCounts = [6, 12, 24, 36];
Ts = [50, 100, 250, 500];
neighSizes = [3, 5, 9, 15, 21];
% Run Classifier
fprintf(f, 'binCount,T,neighSize,trial1, trial2, trial3\n');
for binCount = binCounts
    for T = Ts
        for neighSize = neighSizes
            % Three trials each
            a1 = classifier(dataSource, dataRoot, classNames, binCount, T, neighSize, hsig_smooth, hsig_deriv, hsig_alpha, boundIndents);
            a2 = classifier(dataSource, dataRoot, classNames, binCount, T, neighSize, hsig_smooth, hsig_deriv, hsig_alpha, boundIndents);
            a3 = classifier(dataSource, dataRoot, classNames, binCount, T, neighSize, hsig_smooth, hsig_deriv, hsig_alpha, boundIndents);
            fprintf(f, '%d,%d,%d,%6.4f,%6.4f,%6.4f\n', binCount,T,neighSize,a1,a2,a3);
        end
    end
end
fclose(f);