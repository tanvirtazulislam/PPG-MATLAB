% load 'X.mat';
% load 'Y.mat';

%preprocessing and filtering
anyFile = X;
% anyFile = anyFile.*2;
als = alsX(anyFile);
als_gauss = gaussianX(als);
als_gauss_deriv1 = deriv1X(als_gauss(15,633:673));

% x_als_gauss = als_gauss(15, 535:574);
% x_als_gauss = [x_als_gauss x_als_gauss];

als_gauss_deriv2 = deriv2x(als_gauss(15,633:673));

% taking one sample
sample = 15;
raw = anyFile(sample,331:371); 
raw_als_gauss = als_gauss(sample,633:673);
raw_als_gauss_deriv1 = als_gauss_deriv1;%(sample,320:380);
raw_als_gauss_deriv2 = als_gauss_deriv2;%(sample,320:380);

% taking peaks
distance = 15;
[raw_amp, raw_time] = findpeaks(raw);
[raw_amp_neg, raw_time_neg] = findpeaks(-raw);

[raw_als_gauss_amp, raw_als_gauss_time] = findpeaks(raw_als_gauss); %, 'MinPeakDistance', distance);
[raw_als_gauss_amp_neg, raw_als_gauss_time_neg] = findpeaks(-raw_als_gauss); %, 'MinPeakDistance', distance);

[raw_als_gauss_deriv1_amp, raw_als_gauss_deriv1_time] = findpeaks(raw_als_gauss_deriv1); %, 'MinPeakDistance', distance);
[raw_als_gauss_deriv1_amp_neg, raw_als_gauss_deriv1_time_neg] = findpeaks(-raw_als_gauss_deriv1);

[raw_als_gauss_deriv2_amp, raw_als_gauss_deriv2_time] = findpeaks(raw_als_gauss_deriv2); %, 'MinPeakDistance', distance);
[raw_als_gauss_deriv2_amp_neg, raw_als_gauss_deriv2_time_neg] = findpeaks(-raw_als_gauss_deriv2); %, 'MinPeakDistance', distance);

% % plotting
subplot 311
plot(raw_als_gauss,'Color',[0 0 0 0.7])
axis tight
hold on
% % grid on
plot(raw_als_gauss_time, raw_als_gauss(raw_als_gauss_time), 'or')
% plot(raw_time_neg, raw(raw_time_neg), 'or');
% % title("Raw Signal")

subplot 312
plot(raw_als_gauss_deriv1,'Color',[0 0 0 0.7])
axis tight
hold on
% % grid on
plot(raw_als_gauss_deriv1_time, raw_als_gauss_deriv1(raw_als_gauss_deriv1_time), 'or')
plot(raw_als_gauss_deriv1_time_neg, raw_als_gauss_deriv1(raw_als_gauss_deriv1_time_neg), 'or')
% % title("ALS + Gauss + 1st Derivative")

subplot 313
plot(raw_als_gauss_deriv2,'Color',[0 0 0 0.7])
axis tight
hold on
% % grid on
plot(raw_als_gauss_deriv2_time, raw_als_gauss_deriv2(raw_als_gauss_deriv2_time), 'or')
plot(raw_als_gauss_deriv2_time_neg, raw_als_gauss_deriv2(raw_als_gauss_deriv2_time_neg), 'or')
% % title("ALS + Gauss + 2nd Derivative")

% subplot 414
% plot(raw_als_gauss_deriv1_points,'Color',[0 0 0 0.7])
% hold on
% grid on
% plot(raw_als_gauss_deriv1_points_time, raw_als_gauss_deriv1_points(raw_als_gauss_deriv1_points_time), 'or')
% title("ALS + Gauss + 1st Derivative Points")
