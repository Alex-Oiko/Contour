function produce_energies(intensity)
	energies=zeros(rows(intensity),columns(intensity));
	double(sums=zeros(3,4));
	distance_vector=0;
	position=zeros(rows(intensity),columns(intensity));
	E=0;
	lambda=0.01;
	temp_sum=0;
	minimum=0;
	minimumE=0;
	pos=0;
	sums_to_min=zeros();
	energies_to_min=zeros();
	for i=1:1:rows(intensity)%initialise energies for first column
		sums(i,1)=intensity(i,1,3);
		energies(i,1)=intensity(i,1,3);
	endfor
	for j=1:1:rows(intensity)
		for k=2:1:columns(intensity)
			for t=1:1:rows(intensity)
				distance_vector=sqrt((intensity(j,k,1)-intensity(t,k-1,1))^2+(intensity(j,k,2)-intensity(t,k-1,2))^2);%find distance between the middles of each point
				E=lambda*distance_vector+(1-lambda)*intensity(j,k,3);
				energies_to_min(t)=E;%to minimize energy
				temp_sum=sums(t,k-1)+E;
				sums_to_min(t)=temp_sum;%to minimize the sums
			endfor
			minimumE=min(energies_to_min);
			position(j,k)=find(sums_to_min==min(sums_to_min));
			sums_to_min=zeros();
			energies_to_min=zeros();
			sums(j,k)=minimum;
			energies(j,k)=minimumE;
		endfor
	endfor
	sums
	intensity
	energies
	position
endfunction