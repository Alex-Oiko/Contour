im = imread ('tongue.png');

im = double ( im );
imax = max ( max ( im ));
imin = min ( min ( im ));
im = ( im - imin )/( imax - imin );

figure (1)
imagesc (im)
colormap ( gray )
axis square

bot=load('init1.ctr');
top=load('init2.ctr');

points = search_space(im,bot,top);

sz=size(points);
for i=1:1:sz(1)
	for j=1:1:sz(2)
		points(i,j,3)=1-points(i,j,3);
	end
end

[position,energies] = produce_energies(points);
%energies
%position
contour = get_contour(position,energies);
hold on
%plot(points(:,:,1),points(:,:,2),'r+')
plot(contour(:,1),contour(:,2),'r+');
plot(bot(:,1),bot(:,2),'g+-');
plot(top(:,1),top(:,2),'g+-');
