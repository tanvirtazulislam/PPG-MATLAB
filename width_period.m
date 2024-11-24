% function output_period = width_period(file)
% anyFile = file;

anyFile = X;
Xals = alsX(anyFile); 
Xals_gauss = gaussianX(Xals);

[sizerow sizecolumn]=size(Xals_gauss);

for i=1:1:sizerow
    r1=Xals_gauss(i,:);
    r1=r1';  
    [amp,time] = findpeaks(r1, 'MinPeakDistance', 15);
    [q1, q2]=size(time);
    delt=[];
    for j= 1 :2: q1-1
        timediff=time(j+1)-time(j);
        delt=[delt timediff];
    end
    [sr, sc]=size(delt);
    for k=1:1:sc
        output_period(i,k)= delt(1,k);
    end 
end

plot(r1)
hold on
grid on
plot(time, r1(time), 'or')
title("Als+Gauss Applied")