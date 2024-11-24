function d=deriv1X(input);
[sizerow sizecolumn]=size(input);
sz=size(input);
d=zeros(sz);
for i=1:1:sizerow
    d(1,1)=input(1,2)-input(1,1);
    d(1,sizecolumn)=input(1,sizecolumn)-input(1,sizecolumn-1);
    for j = 2:sizecolumn-1;
        d(i,j)=(input(i,j+1)-input(i,j-1)) ./ 2;
    end
end