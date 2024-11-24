function d2=deriv2X(input);
[sizerow sizecolumn]=size(input);
sz=size(input);
d2=zeros(sz);
for i=1:1:sizerow
    d2(i,1)=d2(i,2);
    d2(i,sizecolumn)=d2(i,sizecolumn-1);
    for j = 2:sizecolumn-1;
        d2(i,j)=input(i,j+1) - 2.*input(i,j) + input(i,j-1);
    end
end
