% function output = mean_start_max(file)
% anyFile = file;

anyFile = X;

[sizerow sizecolumn] = size(anyFile);

output = []; % stores mean amplitude of all samples

for i=1:1:sizerow
    each_sample = anyFile(i,:);

    [amp, time] = findpeaks(each_sample); % finding +ve peaks and time of it of one signal/sample
    
    target = amp(1);
    j = 1;
    start_to_peak = [];
    while each_sample(j) ~= target
        start_to_peak = [start_to_peak each_sample(j)];
        j=j+1;
    end
    start_to_peak = [start_to_peak target]; % including peak value 
    
    output = [output; mean(start_to_peak)];
end