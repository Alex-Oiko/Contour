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

points = search_space(bot,top);
hold on
plot(points(:,:,1),points(:,:,2),'r@')
plot(bot(:,1),bot(:,2),'g+-')
plot(top(:,1),top(:,2),'g+-')
