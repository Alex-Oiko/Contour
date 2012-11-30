im = imread('test2.png');

%figure (1)
%imagesc ( im )
%colormap ( gray )
%axis square

%im = double ( im );
%imax = max ( max ( im ));
%imin = min ( min ( im ));
%im = ( im - imin )/( imax - imin );

intensity=get_intensities(im)

%hold on
%plot (intensity(:,: ,1) ,intensity(:,:,2) , 'r@');
produce_energies(intensity);
