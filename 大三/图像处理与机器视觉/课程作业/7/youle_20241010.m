% I=imread('lena.jpg');
% subplot(241);imshow(I);
% se1=strel('disk',1);
% se2=strel('disk',2);
% se3=strel('disk',3);
% I2=imerode(I,se1);
% I3=imerode(I,se2);
% I4=imerode(I,se3);
% I5=imdilate(I,se1);
% I6=imdilate(I,se2);
% I7=imdilate(I,se3);
% subplot(242);imshow(I2);
% subplot(243);imshow(I3);
% subplot(244);imshow(I4);
% subplot(245);imshow(I5);
% subplot(246);imshow(I6);
% subplot(247);imshow(I7);

% Image=imread('A.png');
% figure;imshow(Image);
% BW=im2bw(Image);
% SE=strel('square',3);
% result1=imclose(imopen(BW,SE),SE);
% result2=imopen(imclose(BW,SE),SE);
% subplot(221);imshow(Image);
% subplot(222);imshow(result1);
% subplot(223);imshow(result2);



% A = [0 0 0 0 0 0;
% 0 0 1 0 0 0;
% 0 1 1 1 0 0;
% 0 1 1 1 1 0;
% 0 1 1 0 0 0;
% 0 0 0 0 0 0];
% B1 = [0 0 0 0 0 0;
% 0 0 1 0 0 0;
% 0 0 0 0 0 0;
% 0 0 1 0 0 0;
% 0 0 0 0 0 0;
% 0 0 0 0 0 0];
% 
% B2 = logical(B1);
% se = strel('arbitrary', B2);
% 
% dilatedImage = imdilate(A, se);
% erodedImage = imerode(A, se);
% 
% figure;
% subplot(1,3,1);
% imshow(A);
% title('A');
% subplot(1,3,2);
% imshow(dilatedImage);
% title('膨胀');
% subplot(1,3,3);
% imshow(erodedImage);
% title('腐蚀');



% I = imread('Head.png');
% I = rgb2gray(I); 
% 
% Gx = [1 0; 0 -1];
% Gy = [0 1; -1 0]; 
% 
% Ix = filter2(Gx, I);
% Iy = filter2(Gy, I);
% Igrad = sqrt(Ix.^2 + Iy.^2);
% 
% figure;
% subplot(1,2,1);
% imshow(I);
% title('原始');
% subplot(1,2,2);
% imshow(mat2gray(Igrad));
% title('Roberts');



I = imread('Head.png');
I = rgb2gray(I);

Gx = [-1 0 1; -2 0 2; -1 0 1];
Gy = [-1 -2 -1; 0 0 0; 1 2 1];

Ix = filter2(Gx, I);
Iy = filter2(Gy, I);

Igrad = sqrt(Ix.^2 + Iy.^2);

figure;
subplot(1,2,1);
imshow(I);
title('原始');
subplot(1,2,2);
imshow(mat2gray(Igrad));
title('Sobel');