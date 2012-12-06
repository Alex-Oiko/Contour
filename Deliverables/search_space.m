function[points]= search_space(image,bot,top)
	M=100;
    sz = size(bot);
	points=zeros(M,sz(1),3);
	for i=1:sz(1)
		xjump=(bot(i,1)-top(i,1))/M;% overall distance between 2 points
		yjump=(bot(i,2)-top(i,2))/M;
		for j=1:M
			tempx=top(i,1)+xjump*j;%select the jump for each point
			tempy=top(i,2)+yjump*j;
			points(j,i,1)=tempx;%add x value to the matrix
			points(j,i,2)=tempy;%add y value to the matrix
            points(j,i,3)=image(ceil(tempy),ceil(tempx));%add the point intensity to the matrix
        end
    end 
    points=negate_intensities(points);   
end
	
