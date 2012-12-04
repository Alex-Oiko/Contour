function[position,energies] = produce_energies(intensity)
    sz=size(intensity);
	energies=double(zeros(sz(1),sz(2),sz(1)));	
	position=zeros(sz(1),sz(2),sz(1));

	E=0;
	nume=0;
	denom=0;
	lambda=0.00001;
	temp_sum=0;
	minimumS=0;
    	
	sums_to_min=zeros();
    
	for i=1:1:sz(1);
        		energies(i,1,i)=0;
                position(i,1,3)=0;
    	end
    
   for j=2:1:sz(2)
   	for k=1:1:sz(1)
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
                
        			for t=1:1:sz(1)%loop for the column before the curret
                            preposx=intensity(t,j-1,1);
                            preposy=intensity(t,j-1,2);
        
                            nume=(afterposx-2*curposx+preposx)^2+(afterposy-2*curposy+preposy)^2;
                            denom=(afterposx+preposx)^2+(afterposy+preposy)^2;
                            ft=nume/denom;
        					E=lambda*ft+(1-lambda)*intensity(k,j,3);
        					temp_sum=energies(k,j-1,f)+E;
        					sums_to_min(t)=temp_sum;
        		end
        		[minimumS minimumI]=min(sums_to_min);
        		energies(k,j,f)=minimumS;
        		position(k,j,f)=minimumI;
        		sums_to_min=zeros();
            end
       end	
end

