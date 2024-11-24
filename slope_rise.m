% function output_rise = slope_rise(file)
% anyFile = file;

anyFile = X;
Xals=alsX(anyFile);
filtered_signal = gaussianX(Xals);
[sizerow sizecolumn] = size(filtered_signal);

derivative_1 = deriv1X(filtered_signal);

output_rise = []; % stores output
min_points = 2000;

for i=1:1:sizerow
    each_sample = derivative_1(i,:);

    [amp, time] = findpeaks(each_sample); 
    
    temp_size = size(amp);
    
    if(temp_size(2) < min_points)
        min_points = temp_size(2);
    end
end

for i=1:1:sizerow
    each_sample = derivative_1(i,:);

    [amp, time] = findpeaks(each_sample); 

    output_rise = [output_rise; amp(1,1:min_points)];
end