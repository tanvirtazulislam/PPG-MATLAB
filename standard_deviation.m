% function Stds = standard_deviation(file)
% anyFile = file;

anyFile = Xals;

[sizerow sizecolumn]=size(anyFile);

Stds = []; % to store standard variations of every signal/sample (in this case, 88 samples)

for i=1:1:sizerow
    r1=anyFile(i,:);

    [amp, time] = findpeaks(r1); % finding +ve peaks and time of it of one signal/sample
    
    calculatedDeviation = std(amp); % calculating standard deviation of each signal
    
    Stds = [Stds; calculatedDeviation];
end