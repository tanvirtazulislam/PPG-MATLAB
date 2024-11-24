
function gaussiancorrectdraw = gaussianX(input)

[sizerow sizecolumn]=size(input);
c = 0.0702
w = 0.0405
k=0:sizecolumn-1;

for i=1:1:sizerow
    a1 = input(i,:);

x = a1;

[m,n] = size(x);

N=n;

a1=a1';

ty = fft(a1);% FFT works along the coloumns
%the first value of the ty is so large. We took the mean value for ty(1)
ty(1) = mean(ty);


filter1 = cgauss(k/N,w,c);% design of gauss filter
% plot(filter1);

filter =repmat(filter1,m,1);

filtered_sig = filter.*ty';%point by point multiplication of signal and filter

filtered_sig_inv = ifft(filtered_sig');%original number of points retained

filtered_sig_inv = real(filtered_sig_inv');%taking magnitude of complex result

ppg_filtered = filtered_sig_inv';

gaussiancorrectdraw(i,:) = ppg_filtered;

end

 
