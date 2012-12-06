im = imread ('tongue.png');

im = double ( im );
imax = max ( max ( im ));
imin = min ( min ( im ));
im = ( im - imin )/( imax - imin );

figure (1)
imagesc (im)
colormap ( gray )
axis square

%szim=size(im)

%bot=zeros(100,2);
%top=zeros(100,2);

%sb=size(bot);
%xstep=szim(2)/sb(1);


%for i=1:1:sb(1)
%	bot(i,1)=xstep*i;
%	bot(i,2)=170 -0.1*i;
%	top(i,1)=xstep*i;
%	top(i,2)=30-0.1*i;
%end

bot=load('init1.ctr');
top=load('init2.ctr');

l=0.5;
bot1=bot;	
top1=top;
sb=size(bot);
st=size(top);
for i=1:sb(1)
    bot1(i,1)=bot(i,1)+50;
    bot1(i,2)=bot(i,2);
    top1(i,1)=top(i,1)+50;
    top1(i,2)=top(i,2);
end

[position,energies,points] = produce_energies(im,bot,top,l);

a=2
contour = get_contour(position,energies,points);
hold on
%plot(points(:,:,1),points(:,:,2),'r+')
plot(contour(:,1),contour(:,2),'r+');
%plot(bot(:,1),bot(:,2),'g+-');
%plot(top(:,1),top(:,2),'g+-');


plot(bot(:,1),bot(:,2),'g+-');
plot(top(:,1),top(:,2),'g+-');
