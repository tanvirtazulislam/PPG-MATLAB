% load 'X.mat';
% load 'Y.mat';

%preprocessing and filtering
anyFile = X;
% anyFile = anyFile.*2;
als = alsX(anyFile);
als_gauss = gaussianX(als);
% als_gauss = als_gauss./max(als_gauss); % normalized
als_gauss_deriv1 = deriv1X(als_gauss);
% als_gauss_deriv1_points = pointsX(als_gauss_deriv1(:,701:900)); %100 - 300

% taking one sample
sample = 12; %rows = 18, 12, 15 of X/X_old (88x1500)
raw = anyFile(sample,1:1500); 
raw_als = als(sample, 1:1500);
raw_als_gauss = als_gauss(sample,1:1500);
raw_als_gauss_deriv1 = als_gauss_deriv1(sample,1:1500);
% raw_als_gauss_deriv1_points = als_gauss_deriv1_points(sample,:);


plotting_create_3figures(raw,raw_als,raw_als_gauss);

% taking peaks
% distance = 15;
% [raw_amp, raw_time] = findpeaks(raw);
% [raw_als_gauss_amp, raw_als_gauss_time] = findpeaks(raw_als_gauss);%,"minPeakHeight", -0.004); %, 'MinPeakDistance', distance);
% [raw_als_gauss_deriv1_amp, raw_als_gauss_deriv1_time] = findpeaks(raw_als_gauss_deriv1); %, 'MinPeakDistance', distance);
% [raw_als_gauss_deriv1_points_amp, raw_als_gauss_deriv1_points_time] = findpeaks(raw_als_gauss_deriv1_points); %, 'MinPeakDistance', distance);

% % plotting
% subplot 311
% plot(raw,'Color',[0 0 0 0.7])
% hold on

% % grid on
% % plot(raw_time, raw(raw_time), 'or')
% % title("Raw Signal")


% subplot 312
% plot(raw_als_gauss,'Color',[0 0 0 0.7])
% hold on

% % grid on
% % plot(raw_als_gauss_time, raw_als_gauss(raw_als_gauss_time), 'or')
% % title("Als + Gauss")

% subplot 313
% plot(raw_als_gauss_deriv1,'Color',[0 0 0 0.7])
% hold on

% % grid on
% plot(raw_als_gauss_deriv1_time, raw_als_gauss_deriv1(raw_als_gauss_deriv1_time), 'or')
% % title("ALS + Gauss + 1st Derivative")


% plotting_create_3figures(raw, raw_als_gauss, raw_als_gauss_deriv1); %run


% % subplot 414
% plot(raw_als_gauss_deriv1_points,'Color',[0 0 0 0.7])
% hold on
% grid on
% plot(raw_als_gauss_deriv1_points_time, raw_als_gauss_deriv1_points(raw_als_gauss_deriv1_points_time), 'or')
% title("ALS + Gauss + 1st Derivative Points")


% plotting_one_createfigure(raw_als_gauss_deriv1_points); %run
% axis tight



