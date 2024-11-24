function [SEP,Y_p,Y_r,PLSPctVar] = PLS_1(x,y,n)
%load('Xals.mat')
%load('Y.mat')
%x = Xals;
%y = Y;

%n=2;

x_train = x(1:65,:);
x_test = x(66:88,:);
y_train= y(1:65,1);
y_test = y(66:88,1);
Y_r = y_test;
x_mean = mean(x_train);
y_mean = mean(y_train);

[r,c] = size(x_train);
[rt,ct] = size(x_test);

x_train = x_train - repmat(mean(x_train),r,1);
y_train = y_train - repmat(mean(y_train),r,1);

[Xl,Yl,Xs,Ys,beta,PLSPctVar] = plsregress(x_train,y_train(:,1),n);

%%prediction
Y_p = repmat(y_mean,rt,1)+[ones(rt,1) (x_test - repmat(x_mean,rt,1))]*beta;%module

SEP = (y_test(:,1)-Y_p(:,1)).^2;
SEP = mean(SEP);
SEP = sqrt(SEP);
