function[position,energies] = produce_energies(intensity)
    sz=size(intensity);
	energies=double(zeros(sz(1),sz(2)));
	
	distance_=0;
	position=zeros(sz(1),sz(2),3);
	E=0;
	lambda=0.05;
	temp_sum=0;
	minimumS=0;
	minimumE=0;
	pos=0;
	indexes=zeros();
	sums_to_min=zeros();
	for i=1:1:sz(1);
        		energies(i,1)=0;
        		position(i,1,1)=intensity(i,1,1);
        		position(i,1,2)=intensity(i,1,2);
       		position(i,1,3)=0;
    	end
    
   for j=2:1:sz(2)
   	for k=1:1:sz(1)
   		for f=1:1:sz(1)
        		distance_=sqrt((intensity(k,j,1)-intensity(f,j-1,1))^2+(intensity(k,j,2)-intensity(f,j-1,2))^2);
        		E=lambda*distance_+(1-lambda)*intensity(k,j,3);
        		temp_sum=energies(f,j-1)+E;
        		
        		sums_to_min(f)=temp_sum;
        		indexes(f)=f;
        		end
        		
        		position(k,j,1)=intensity(k,j,1);
        		position(k,j,2)=intensity(k,j,2);
        		
        		[minimumS minimumI]=min(sums_to_min);
            	energies(k,j)=minimumS;
            	position(k,j,3)=minimumI;
                %sums_to_min
                %minimumI
            		      		
        		sums_to_min=zeros();
        		indexes=zeros();
    	end
end
