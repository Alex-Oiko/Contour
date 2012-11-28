function[points]= search_space(bot,top)
	vector_distance=1;
	M=50;
	counter =1;
	points=zeros(rows(bot),columns(bot),2);
	for i=1:rows(bot)
		xjump=(bot(i,1)-top(i,1))/M;
		yjump=(bot(i,2)-top(i,2))/M;
		for j=1:M
			tempx=top(i,1)+xjump*j;
			tempy=top(i,2)+yjump*j;
			points(i,j,1)=tempx;
			points(i,j,2)=tempy;
		endfor
	endfor	
endfunction
	
