function[intensity]=get_intensities(matrix)
	counter=1;
	intensity =zeros(3,4,3);
	xcounter=1;
	ycounter=1;
	for y=25:50:175
		for x=25:50:125
			intensity(xcounter,ycounter,1)=y;
			intensity(xcounter,ycounter,2)=x;
			intensity(xcounter,ycounter,3)=matrix(x,y);
			xcounter=xcounter+1;
		endfor
		ycounter=ycounter+1;
		xcounter=1;
	endfor
endfunction