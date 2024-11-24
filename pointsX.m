function output=pointsX(any_file)
[sizerow sizecolumn]=size(any_file);
for i=1:1:sizerow
    d2=any_file(i,:);
    d2=d2';

    [pks,lks]=findpeaks(d2);
    [npks,nlks]=findpeaks(-d2);
    allpeaks=union(lks,nlks);

    pks2d=[pks lks];
    nks2d= [-npks nlks];
    
    un=union(pks2d,nks2d,'rows');
    sortrows(un,1);
    abcde=sortrows(un,2);
    abcde=(abcde(:,1));
    abcde=abcde';
    [szr szc]=size(abcde);

    for j=1:1:szc
        output(i,j)=abcde(szr,j);
    end
end
