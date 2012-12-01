im = imread('test2.png');

figure (1)
imagesc ( im )
colormap ( gray )
axis square

x=im(:,:,1);
y=im(:,:,2);


%im = double ( im );
%imax = max ( max ( im ));
%imin = min ( min ( im ));
%im = ( im - imin )/( imax - imin );

intensity=get_intensities(im);

%hold on
%plot (intensity(:,: ,1) ,intensity(:,:,2) , 'r@');
[position,energies]=produce_energies(intensity)
contour = get_contour(position,energies);

hold on
plot (intensity(:,: ,1) ,intensity(:,:,2) , 'r+');
plot(contour(:,1),contour(:,2),'r+-');
