% load 'X.mat';
% load 'Y.mat';

%preprocessing and filtering
anyFile = X;
raw_als = alsX(anyFile);
raw_als_gaussian = gaussianX(raw_als);

raw_als_normalized = normalize(raw_als, 'range', [0 1]);
raw_normalized = normalize(anyFile, 'range', [-1 1]);


% taking one sample
sample_no = 11;
% good = 11
% average = 21, 45 used
% poor = 13, 50 used
sample = raw_als(sample_no,101:900);

% taking peaks
distance = 15;
[sample_amp, sample_time] = findpeaks(sample);

% % plotting
% plot(sample,'Color',[0 0 0 0.7])
plotting_one_createfigure(sample);
% hold on
% % grid on
% plot(sample_time, sample(sample_time), 'or')
