%图像相加
% I=imread('rice.png');
% J=imread('cameraman.tif');
% I2=imresize(I,50);
% J2=imresize(J,50);
% K=imadd(I2,J2);
% subplot(2,2,1);imshow(I2);
% subplot(2,2,2);imshow(J2);
% subplot(2,2,3);imshow(K);


%图像相减
% I=imread('rice.png');
% background=imopen(I,strel('disk',15));
% J=imsubtract(I,background);
% subplot(1,2,1);
% imshow(I);
% subplot(1,2,2);
% imshow(J);

%图像相乘
% I=imread('moon.tif');
% J=immultiply(I,1.2);
% K=immultiply(I,0.6);
% subplot(1,3,1);imshow(I);
% subplot(1,3,2);imshow(J);
% subplot(1,3,3);imshow(K);

%比例缩放
% Image=im2double(imread('Head.png'));
% NewImage1=imresize(Image,1.5,'nearest');
% NewImage2=imresize(Image,[630,630],'bilinear');
% subplot(1,2,1);imshow(NewImage1);
% subplot(1,2,2);imshow(NewImage2);
% imwrite(NewImage1,'scale1.jpg');
% imwrite(NewImage2,'scale2.jpg');

%图像翻转
% Image2=imread("Head.png");
% A=flipdim(Image2,2);
% B=flipdim(Image2,1);
% C=flipdim(A,1);
% subplot(2,2,1);imshow(Image2);
% subplot(2,2,2);imshow(A);
% subplot(2,2,3);imshow(B);
% subplot(2,2,4);imshow(C);

Back=imread('bird.jpg');
Templet=imread('birdtemplet.bmp');
result1=bitcmp(Back);
result2=bitand(Templet,Back);
result3=bitor(Templet,Back);
result4=bitxor(Templet,Back);
imwrite(result1,'QiuFan.jpg');
imwrite(result2,'XiangYu.jpg');
imwrite(result3,'XiangHuo.jpg');
imwrite(result4,'YiHuo.jpg');
subplot(221);
imshow(result1);
title('求反');
subplot(222);
imshow(result2);
title('相与');
subplot(223);
imshow(result3);
title('相或');
subplot(224);
imshow(result4);
title('异或');
