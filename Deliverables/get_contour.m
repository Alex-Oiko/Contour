function[contour] = get_contour(position,energies,intensity)

sz=size(energies);
contour=zeros(sz(2)-1,2);
lcv=energies(:,sz(2)-1,:);%get all the column vectors of the second column
[lcev rowIV]=min(lcv);%gets the minimum values of each vector and the indexes of these values
[lce TDI]=min(min(lcv));%gets the lowest value of all the minimums and its depth
index=find(lcev==lce);%gets the index of the minimum of the vector
rowI=rowIV(index);%finds the row of the minimum value through the index above
%%up until now the minimum energy value and its indexes are found

%initialise the first entry of the contour points with the corresponding
%constitutes  of the intensity matrix
contour(1,1)=intensity(rowI(1),sz(2)-1,1);
contour(1,2)=intensity(rowI(1),sz(2)-1,2);

goto=position(rowI(1),sz(2)-2,TDI);
%go to the position dictated by the above calculation

counter=2;

for i=2:1:sz(2)-1
    %continue jumping to the position matrix according to the value
    %extracted from the vector of the 3rd dimension and its index in the
    %matrix
    contour(i,1)=intensity(goto(1),sz(2)-i,1);
    contour(i,2)=intensity(goto(1),sz(2)-i,2);
    
    tmpgt=goto;
    goto = position(goto(1),sz(2)-i,rowI);
    rowI=tmpgt;
end
end
