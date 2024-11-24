% function output = lowpeak_deriv1_time(file)
% anyFile = file;

anyFile = X;

[sizerow sizecolumn] = size(anyFile);

derivative_1 = deriv1X(anyFile);

output = []; % stores the time of second highest amplitude of 1st derivative of all samples

for i=1:1:sizerow % loop for visiting all the rows/samples/signals
    out = [];
    
    each_sample = derivative_1(i,:); % taking one sample at a time

    [amp, time] = findpeaks(each_sample); % finding +ve peaks and time of it of one signal/sample
    
    sorted_amp = sort(amp, 'descend'); % sorting the array of 'amp' in descending order
    
    second_highest_amp = sorted_amp(2); % taking the second highest value of amplitude
    
    [row column] = size(amp);
    
    for j=1:1:column
        if amp(1,j) == second_highest_amp % searching the col. number of second_highest_amp from 'amp' to get corresponding 'time'
            out = [out, time(1,j)]; % storing time of second highest amplitude in a single row
        end
    end
    output = [output; out]; % storing time 
end