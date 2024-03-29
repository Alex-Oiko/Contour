function[position,energies,intensity] = produce_energies(im,bot,top,l)
    intensity = search_space(im,bot,top);

    sz=size(intensity);
	energies=double(zeros(sz(1),sz(2),sz(1)));	
	position=zeros(sz(1),sz(2),sz(1));
  
	E=0;
	nume=0;
	denom=0;
	lambda=l;
	temp_sum=0;
	minimumS=0;
    	
	sums_to_min=zeros();
    
	for i=1:1:sz(1);%initialise the first column of the energy and position matrix
        		energies(i,1,i)=0;
                position(i,1,3)=0;
    	end
    
   for j=2:1:sz(2)%for each column
   	for k=1:1:sz(1)%for each point
		curposx=intensity(k,j,1);
		curposy=intensity(k,j,2);
   		for f=1:1:sz(1)%loop for the column after the current
            
                if j==sz(2)
                    afterposx=0;
                    afterposy=0;
                else
                    afterposx=intensity(f,j+1,1);
                    afterposy=intensity(f,j+1,2);
                end
                
        			for t=1:1:sz(1)%loop for the column before the current
        
                            nume=(afterposx-2*curposx+intensity(t,j-1,1))^2+(afterposy-2*curposy+intensity(t,j-1,2))^2;
                            denom=(afterposx+intensity(t,j-1,1))^2+(afterposy+intensity(t,j-1,2))^2;
                            
                            ft=nume/denom;
        					E=lambda*ft+(1-lambda)*intensity(k,j,3);%energy calculation
        					temp_sum=energies(t,j-1,k)+E;%sum calculation
        					sums_to_min(t)=temp_sum;%add the minimum value to a temp vector
        		end
        		[minimumS minimumI]=min(sums_to_min);%find the minimum value and index
        		energies(k,j,f)=minimumS;%add the minimum value to the enery matrix
        		position(k,j,f)=minimumI;%add the minimum index to the position matrix
        		sums_to_min=zeros();
            end
       end	
end

