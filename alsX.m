function alscorrectedraw=alsX(input);
[sizerow sizecolumn]=size(input);
for i=1:1:sizerow
a1 = input(i,:);
d=mdadata(a1);
sarray = copy(d);
g = prep();
g.add('alsbasecorr', 100, 0.01);
g.apply(sarray);
alscorrectedraw(i,:) = sarray.values(1,:);
end
