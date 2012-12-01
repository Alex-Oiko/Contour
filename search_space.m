function[points]= search_space(image,bot,top)
	M=50;
    sz = size(bot);
	points=zeros(sz(1),sz(2),3);
	for i=1:sz(1)
		xjump=(bot(i,1)-top(i,1))/M;%distance between 2 points
		yjump=(bot(i,2)-top(i,2))/M;
		for j=1:M
			tempx=top(i,1)+xjump*j;
			tempy=top(i,2)+yjump*j;
			points(j,i,1)=tempx;
			points(j,i,2)=tempy;
            points(i,j,3)=image(ceil(tempy),ceil(tempx));
        end
    end
end
	
