function [SEP,YY,Var] = PCR_1(y,x,method,nn)

%load('Xagd1Peak.mat')
%load('Y.mat')

%x =Xagd1Peak;
%y = Y;

%mean subtraction of X

%x = x - repmat(mean(x),r,1);
%y = y - repmat(mean(y),r,1);


x_train = x(1:65,:);
x_test = x(66:88,:);
y_train= y(1:65,1);
y_test = y(66:88,1);

x_mean = mean(x_train);
y_mean = mean(y_train);

[r,c] = size(x_train);
[rt,ct] = size(x_test);


x_train = x_train - repmat(mean(x_train),r,1);
y_train = y_train - repmat(mean(y_train),r,1);

switch method

    case 'SVD'
        [T,P,Var] = PCA_SVD(x_train);
    case 'NIPALS'
        [T,P,Var] = PCA_NIPALS(x_train);
    case 'princomp'
        [P,T,Var] = princomp(x_train);
        
end

%first two principle component.

T = T(1:end,1:nn);
P = P(1:end,1:nn);

mean(Var);
% Calibration

C = regress(y_train(:,1),T);
%D = regress(y_train(:,2),T);
%E = regress(y_train(:,3),T);

V=(100*Var)/sum(Var);

%C=[C D E];
% prediction
%Y = x_test*P*C;
YY = repmat(y_mean,rt,1)+((x_test - repmat(x_mean,rt,1))*P*C);
%formula of SEP=sqrt(summation(y-yi)^2/n) also known as root mean square deviation (RMSD) or root mean square error (RMSE)

SEP = (YY-y_test).^2;
SEP = mean(SEP);
SEP = sqrt(SEP);

YY
