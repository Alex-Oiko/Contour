function[intensity]=get_intensities(matrix)
	counter=1;
	intensity =[zeros() zeros() zeros();zeros() zeros() zeros()];
	for x=25:50:175
		for y=25:50:125
			%x,y are a bit wierd
			intensity(counter,1)=x;
			intensity(counter,2)=y;
			intensity(counter,3)=matrix(y,x);
			counter=counter + 1;
		endfor
	endfor	
endfunction