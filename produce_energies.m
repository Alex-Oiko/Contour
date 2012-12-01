function[position,energies] = produce_energies(intensity)
    sz=size(intensity);
	energies=zeros(sz(1),sz(2));
	sums=double(zeros(sz(1),sz(2)));
	distance_=0;
	position=zeros(sz(1),sz(2),3);
	E=0;
	lambda=0.01;
	temp_sum=0;
	minimumS=0;
	minimumE=0;
	pos=0;
	sums_to_min=zeros();
	energies_to_min=zeros();
	for i=1:1:sz(1)
        sums(i,1)=0;
        energies(i,1)=intensity(i,1,3);
        position(i,1,3)=0;
    end
    
    for j=1:1:sz(1)
        for f=2:1:sz(2)
            for k=1:1:sz(1)
                distance_= sqrt((intensity(j,f,1)-intensity(k,f-1,1))^2 + (intensity(j,f,2)-intensity(k,f-1,2))^2);
                E=lambda*distance_+(1-lambda)*intensity(j,f,3);
                temp_sum=sums(j,f-1)+E;
                energies_to_min(k)=E;
                sums_to_min(k)=temp_sum;
            end
            position(j,f,1)=intensity(j,f,1);
            position(j,f,2)=intensity(j,f,2);
            %energies_to_min
            %sums_to_min
            minimumE=min(energies_to_min);
            minimumS=min(sums_to_min);
            energies(j,f)=minimumE;
            sums(j,f)=minimumS;
            position(j,f,3)=find(sums_to_min==min(sums_to_min));
            sums_to_min=zeros();
            energies_to_min=zeros();
        end
    end

end