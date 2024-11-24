% function output = lowpeak_deriv1(file)
% anyFile = file;

anyFile = X;

[sizerow sizecolumn] = size(anyFile);

derivative_1 = deriv1X(anyFile);

output = []; % stores second highest amplitude of 1st derivative of all samples

for i=1:1:sizerow
    each_sample = derivative_1(i,:);

    [amp, time] = findpeaks(each_sample); % finding +ve peaks and time of it of one signal/sample
    
%     [sizerow_amp sizecolumn_amp] = size(amp);
    
    sorted_amp = sort(amp, 'descend'); % sorting amplitude in descending order
    
    output = [output; sorted_amp(2)]; 
end