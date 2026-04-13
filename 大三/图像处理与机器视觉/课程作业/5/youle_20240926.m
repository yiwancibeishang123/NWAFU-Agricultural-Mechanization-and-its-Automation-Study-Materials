% A=imread('Head.png');
% imshow(A);
% figure,imhist(A);
% J1=imadjust(A,[0.3,0.7],[]);
% figure,imshow(J1);
% figure,imhist(J1);

% A=imread('lena.jpg');
% imshow(A);
% B=A(1:30:end,1:30:end);
% imshow(B);

% A=imread('lena.jpg');
% figure;
% subplot(221);imshow(A);
% title('ORG');
% B=A(1:30:end,1:30:end);
% subplot(222);imshow(B);
% title('CaiYang');
% C=A+100;
% subplot(223);imshow(C);
% title('JiaFa');
% D=A*0.3;
% subplot(224);imshow(D);
% title('ChengFa');

% A=imread('lena.jpg');
% figure;
% subplot(231);imshow(A);
% title('ORG');
% B=imadjust(A,[0.3;0.6],[0.1;0.9]);
% subplot(232);imshow(B);
% title('XX');
% C=double(A);
% C1=C/255;
% D=2;
% K=D*log(1+C1);
% subplot(233);imshow(K);
% title('FXX');
% M=255-A;
% subplot(234);imshow(M);
% title('DZ');
% N1=im2bw(M,0.4);
% N2=im2bw(M,0.7);
% subplot(235);imshow(N1);
% title('0.4');
% subplot(236);imshow(N2);
% title('0.7');

% I=imread('Head.png');
% J=imread('Lena.png');
% newsize=[256 256];
% I2=imresize(I,newsize);
% J2=imresize(J,newsize);
% K=imadd(I2,J2);
% subplot(2,2,1);imshow(I2);
% subplot(2,2,2);imshow(J2);
% subplot(2,2,3);imshow(K);

% I=imread('Head.png');
% J=imread('Lena.png');
% newsize=[256 256];
% I2=imresize(I,newsize);
% J2=imresize(J,newsize);
% K=imsubtract(I2,J2);
% subplot(2,2,1);imshow(I2);
% subplot(2,2,2);imshow(J2);
% subplot(2,2,3);imshow(K);


% image = imread('Head.png');
% A = imresize(image,1.5);
% B = imresize(image,0.7);
% C = imresize(image,[420 384]);
% D = imresize(image,[150 180]);
% figure;
% subplot(2, 3, 1), imshow(image), title('YT');
% subplot(2, 3, 2), imshow(A), title('1.5X');
% subplot(2, 3, 3), imshow(B), title('0.7X');
% subplot(2, 3, 4), imshow(C), title('420x384');
% subplot(2, 3, 5), imshow(D), title('150×180');


% image = imread('Head.png'); 
% A = imrotate(image, 45, 'bilinear', 'crop');
% B = imrotate(image, 90, 'bilinear', 'crop');
% 
% figure;
% subplot(1, 3, 1), imshow(image), title('YT');
% subplot(1, 3, 2), imshow(A), title('45°');
% subplot(1, 3, 3), imshow(B), title('90°');


% fly = imread('fly.png'); 
% head = imread('Head.png'); 
% suoxiao = 0.15;  
% Image1 = imresize(fly, suoxiao);
% background = (Image1(:,:,1) == 0) & (Image1(:,:,2) == 0) & (Image1(:,:,3) == 0);
% Image1(repmat(background, [1, 1, 3])) = NaN; 
% number = 3; 
% Image2 = head; 
% [fly1, fly2, ~] = size(Image1);
% 
% for i = 1:number
%     x = randi([1, size(head, 2) - fly2]);
%     y = randi([1, size(head, 1) - fly1]);
%     angle = randi([0, 360]); 
%     rotatedImage = imrotate(Image1, angle, 'crop');
%     [rotatedImage1, rotatedImage2, ~] = size(rotatedImage);
% 
%     if x + rotatedImage2 > size(head, 2)
%         x = size(head, 2) - rotatedImage2; 
%     end
%     if y + rotatedImage1 > size(head, 1)
%         y = size(head, 1) - rotatedImage1; 
%     end
% 
%     for c = 1:3
%         region1 = rotatedImage(:,:,c);
%         region2 = Image2(y:y+rotatedImage1-1, x:x+rotatedImage2-1, c);
%         region2(~isnan(region1)) = region1(~isnan(region1));
%         Image2(y:y+rotatedImage1-1, x:x+rotatedImage2-1, c) = region2;
%     end
% end
% 
% imshow(Image2);
% title('Handsome');



% Image1 = imread('Head.png');
% Image2 = im2double(Image1);
% Image = exp(Image2);
% 
% imshow(Image);
% title('指数变换');


% image1 = imread('Head.png');
% image2 = im2double(image1);
% pow = 2; 
% image = power(image2, pow);
% 
% imshow(image);
% title('幂函数变换');


% 原始4x4矩阵
originalMatrix = [
    59 60 58 57;
    61 59 59 57;
    62 59 60 58;
    59 61 60 56
];

[rows, cols] = size(originalMatrix);

newRows = 16;
newCols = 16;

newImg = zeros(newRows, newCols);

for i = 1:newRows
    for j = 1:newCols
        x = floor((i - 1) * rows / newRows) + 1;
        y = floor((j - 1) * cols / newCols) + 1;
        
        x = max(1, min(x, rows));
        y = max(1, min(y, cols));
        
        newImg(i, j) = originalMatrix(x, y);
    end
end
imshow(mat2gray(newImg));
title('16x16');