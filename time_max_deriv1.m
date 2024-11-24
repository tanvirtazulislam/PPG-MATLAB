% function output = time_max_deriv1(file)
% anyFile = file;

anyFile = X;

[sizerow sizecolumn] = size(anyFile);

derivative_1 = deriv1X(anyFile);

output = []; % stores the time of max amplitude of 1st derivative of all samples

for i=1:1:sizerow % loop for visiting all the rows/samples/signals
    out = [];
    
    each_sample = derivative_1(i,:);

    [amp, time] = findpeaks(each_sample); % finding +ve peaks and time of it of one signal/sample
    
    max_amp = max(amp);
    
    [row column] = size(amp);
    
    for j=1:1:column
        if amp(1,j) == max_amp % searching the col. number of max_amp from 'amp' to get corresponding 'time'
            out = [out, time(1,j)]; % storing time of max amplitude in a single row
        end
    end
    output = [output; out]; % storing time
end