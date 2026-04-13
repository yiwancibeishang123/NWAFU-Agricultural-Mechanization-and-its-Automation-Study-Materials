image = imread('selfie.jpg'); 
greyimage = rgb2gray(image);
bwimage = im2bw(greyimage,0.5);

bwimage1 = imresize(bwimage, 0.25); 

bwimage2 = imresize(bwimage, 0.0625); 

figure;
subplot(2, 2, 1);
imshow(image);
title('HZW-YuanShi');

subplot(2, 2, 2);
imshow(bwimage);
title('HZW-ErZhi');

subplot(2, 2, 3);
imshow(bwimage1);
title('HZW-4');

subplot(2, 2, 4);
imshow(bwimage2);
title('HZW-16');