function output=deltX(Xall)
% Xall = X;
[sizerow sizecolumn]=size(Xall);

for i=1:1:sizerow
    r1=Xall(i,:);
    r1=r1';
%   plot(r1);   
    [amp,time]=findpeaks(r1);
    [q1, q2]=size(time);
    delt=[];
    for j= 1 :2: q1-1
        timediff=time(j+1)-time(j);
        delt=[delt timediff];
    end
    [sr, sc]=size(delt);
    for k=1:1:sc
        output(i,k)= delt(1,k);
    end 
end