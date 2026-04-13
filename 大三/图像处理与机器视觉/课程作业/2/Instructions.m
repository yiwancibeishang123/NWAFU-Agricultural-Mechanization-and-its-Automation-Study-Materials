rgbimage = imread("第二次作业\Head.png");

info = imfinfo('第二次作业\Head.png');

greyimage = rgb2gray(rgbimage);

bwimage = im2bw(greyimage, 0.5);

%subplot(1, 3, 1);
%imshow(rgbimage);
%title('HZW Original Image');

imwrite(bwimage,'任务2.png');

subimage(1,1,2);