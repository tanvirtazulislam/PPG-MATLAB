% function output = highest_peak_value(file)
% anyFile = file;

anyFile = X;

[sizerow sizecolumn] = size(anyFile);

output = []; % stores max amplitude of all samples

for i=1:1:sizerow
    each_sample = anyFile(i,:);

    [amp, time] = findpeaks(each_sample); % finding +ve peaks and time of it of one signal/sample
    
    max(amp)
    
    output = [output; max(amp)];
end