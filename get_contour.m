function[contour] = get_contour(position,energies)

sz=size(energies);
contour=zeros(sz(2)-1,2);
lce=energies(:,sz(2));
lowest_row = find(lce==min(lce));

contour(1,1)=position(lowest_row,sz(2),1);
contour(1,2)=position(lowest_row,sz(2),2);

goto=position(lowest_row,sz(2),3);
counter=2;
for i=1:1:sz(2)-1
    contour(counter,1)=position(ceil(goto),sz(2)-i,1);
    contour(counter,2)=position(ceil(goto),sz(2)-i,2);
    goto=position(goto,sz(2)-i,3);
    counter = counter+1;
end
end