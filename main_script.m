im = imread('test2.png');
figure (1)
imagesc ( im )
colormap ( gray )
axis square

intensity=get_intensities(im);
hold on
plot (intensity(: ,1) ,intensity(: ,2) , 'r@');
