function[contour] = get_contour(position,energies,intensity)

sz=size(energies);
contour=zeros(sz(2)-1,2);
lcv=energies(:,sz(2)-1,:);%get all the column vectors of the second column
[lcev rowIV]=min(lcv);%gets the minimum values of each vector and the indexes of these values
[lce TDI]=min(min(lcv));%gets the lowest value of all the minimums and its depth
index=find(lcev==lce);%gets the index of the minimum of the vector
rowI=rowIV(index);%finds the row of the minimum value through the index above


contour(1,1)=intensity(rowI(1),sz(2)-1,1);
contour(1,2)=intensity(rowI(1),sz(2)-1,2);

goto=position(rowI(1),sz(2)-2,TDI);



counter=2;

for i=2:1:sz(2)-1
    contour(i,1)=intensity(goto,sz(2)-i,1);
    contour(i,2)=intensity(goto,sz(2)-i,2);
    
    tmpgt=goto;
    goto = position(goto,sz(2)-i,rowI);
    rowI=tmpgt;
end
end