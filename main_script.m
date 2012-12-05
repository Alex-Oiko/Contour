im = imread('test2.png');

figure (1)
imagesc ( im )
colormap ( gray )
axis square

intensity=get_intensities(im);

%hold on
%plot (intensity(:,: ,1) ,intensity(:,:,2) , 'r@');
[position,energies]=produce_energies(intensity)
contour = get_contour(position,energies,intensity)

hold on
plot (position(:,: ,1) ,position(:,:,2) , 'r+');
plot(contour(:,1),contour(:,2),'r+-');
