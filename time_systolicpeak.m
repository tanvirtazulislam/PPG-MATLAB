% function output = time_systolicpeak(file)
% anyFile = file;

anyFile = X;
Xals = alsX(anyFile);
Xals_gauss = gaussianX(Xals);

[sizerow sizecolumn] = size(Xals_gauss);

output = []; % stores systolic peaks of all samples
min_points = 2000;

for i=1:1:sizerow
    each_sample = Xals_gauss(i,:);

    [amp, time] = findpeaks(each_sample, 'MinPeakDistance', 15);
    
    temp_size = size(time);
    
    if(temp_size(2) < min_points)
        min_points = temp_size(2);
    end
end

for i=1:1:sizerow
    each_sample = Xals_gauss(i,:);

    [amp, time] = findpeaks(each_sample, 'MinPeakDistance', 15);
    
    output = [output; time(1,1:min_points)];
end