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
%bot1=bot;
%top1=top;
%sb=size(bot);
%st=size(top);
%for i=1:sb(1)
%        bot1(i,1)=bot(i,1)+20;
%        bot1(i,2)=bot(i,2)+20;
%        top1(i,1)=top(i,1)-20;
%        top1(i,2)=top(i,2)-20;
%end

l=0.9;
top1
bot1
[position,energies,points] = produce_energies(im,bot1,top1,l);

contour = get_contour(position,energies,points);
hold on
%plot(points(:,:,1),points(:,:,2),'r+')
plot(contour(:,1),contour(:,2),'r+');
%plot(bot(:,1),bot(:,2),'g+-');
%plot(top(:,1),top(:,2),'g+-');

plot(bot(:,1),bot(:,2),'g+-');
plot(top(:,1),top(:,2),'g+-');