%load 'X.mat';
nth=2; %the n-th data you want to plot;

X_30 = X(1:88,1:900); % Data of 30 seconds (30s x 30fps = 900frames), 88 samples
X_20 = X(1:88,1:600); % Data of 20 seconds (20s x 30fps = 600frames), 88 samples
X_40 = X(1:88,1:1200); % Data of 40 seconds (40s x 30fps = 1200frames), 88 samples
X_50 = X(1:88,1:1500); % Data of 50 seconds (50s x 30fps = 1500frames), 88 samples

Xall=X_20;% Raw
Xals=alsX(Xall);% Raw + ALS
XFilter=gaussianX(Xals);% Raw + ALS + Gaussian
XDeriv1=deriv1X(XFilter);% Raw + ALS + Gaussian + 1st Derivative
XDeriv2=deriv2x(XFilter);% Raw + ALS + Gaussian + 2nd Derivative
% XDeriv2=deriv1X(XDeriv1);% Raw + ALS + Gaussian + 2nd Derivative
XDelt = deltX(XFilter);% Raw + ALS + Gaussian + DelT
XDeriv1CharPoints = pointsX(XDeriv1);% Raw + ALS + Gaussian + 1st Derivative + Characteristic Points
XDeriv2CharPoints = pointsX(XDeriv2);% Raw + ALS + Gaussian + 2nd Derivative + Characteristic Points

component_SEP = [];% storing no. of components vs SEP for PLS
component_SEP_PCR = [];% storing no. of components vs SEP for PCR

%Applying PLS
for n=2:1:11
    [SEP,Y_p,Y_r,PLSPctVar] = PLS_1(XDeriv2CharPoints,Y,n);
    temp = [n, SEP];
    component_SEP = [component_SEP; temp];
end
component_SEP = [component_SEP; 9999 min(component_SEP(:,2))]; % finding the min. SEP  of PLS

% Plotting variance for PLS
% variance_PLS = cumsum(100*PLSPctVar(2,1:25));
% figure
% plot(1:25,variance_PLS,'-bo');
% xlabel('Number of PLS components - m');
% ylabel('Percent Variance Explained in Y');


%Applying PCR
for nn=2:1:11
    [SEP_PCR,Y_PCR,PCAVar] = PCR_1(Y,XDeriv2CharPoints,'SVD',nn);
    temp_PCR = [nn, SEP_PCR];
    component_SEP_PCR = [component_SEP_PCR; temp_PCR];
end
component_SEP_PCR = [component_SEP_PCR; 9999 min(component_SEP_PCR(:,2))]; % finding the min. SEP of PCR

% Plotting variance for PCR
% variance_PCR = 100*cumsum(PCAVar(1:11))/sum(PCAVar(1:11));
% figure
% plot(1:11,variance_PCR,'r-^');
% xlabel('Number of PCR components - SEP 17.33, PC 11');
% ylabel('Percent Variance Explained in Y');

