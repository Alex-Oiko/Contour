function[position,energies] = produce_energies(intensity)
    sz=size(intensity);
	energies=double(zeros(sz(1),sz(2),sz(1)));	
	position=zeros(sz(1),sz(2),3);

	E=0;
	nume=0;
	denom=0;
	lambda=0.00001;
	temp_sum=0;
	minimumS=0;
	
    	final_sum=0;
    	final_sum_I=0;
    	
	indexes=zeros();
	sums_to_min=zeros();
	minimum_indexes=zeros();
	for i=1:1:sz(1);
        		energies(i,1,i)=0;
        		position(i,1,1)=intensity(i,1,1);
        		position(i,1,2)=intensity(i,1,2);
       		position(i,1,3)=0;
    	end
    
   for j=2:1:sz(2)
   	for k=1:1:sz(1)
   		for f=1:1:sz(1)%loop for the column after the current
        			for t=1:1:sz(1)%loop for the column before the curret
        				if j==sz(2)
        					nume=(-2*intensity(k,j,1)+intensity(t,j-1,1))^2+(-2*intensity(k,j,2)+intensity(t,j-1,1))^2;
					denom=intensity(t,j-1,1)^2+intensity(t,j-1,2)^2;
	        				ft=nume/denom;
	        				E=lambda*ft+(1-lambda)*intensity(k,j,3);
        					temp_sum=final_sum+E;
        					sums_to_min(t)=temp_sum;
	        			else
					nume=(intensity(f,j+1,1)-2*intensity(k,j,1)+intensity(t,j-1,1))^2+(intensity(f,j+1,2)-2*intensity(k,j,2)+intensity(t,j-1,2))^2
					denom=(intensity(f,j+1,1)+intensity(t,j-1,1))^2+(intensity(f,j+1,2)+intensity(t,j-1,2))^2
        					ft=nume/denom;
        					E=lambda*ft+(1-lambda)*intensity(k,j,3);
        					temp_sum=final_sum+E;
        					sums_to_min(t)=temp_sum;
        				end
        		end
        		[minimumS minimumI]=min(sums_to_min);
        		energies(k,j,f)=minimumS;
        		minimum_indexes(f)=minimumI;
        		sums_to_min=zeros();
        	end
        	[final_sum final_sum_I]=min(energies(k,j,:));
        	position(k,j,1)=intensity(k,j,1);
       	position(k,j,2)=intensity(k,j,2);
        	position(k,j,3)=minimum_indexes(final_sum_I);
        	end	
end
