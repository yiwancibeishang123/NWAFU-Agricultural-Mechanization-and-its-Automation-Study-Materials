% A1=imread('apple.png');
% B=rgb2gray(A1);
% A2=im2double(B);
% 
% A=regiongrowing(A2,150,200,0.1);
% figure,
% subplot(121),imshow(A1),title('ORG');
% subplot(122),imshow(A),title('Regiongrowing');



% I=imread('apple.png');
% figure,
% hsv=rgb2hsv(I);
% h=hsv(:,:,1);
% h(h>330/360)=0;
% training=h(:);
% startdata=[0;60/360;120/360;180/360;240/360;300/360];
% [IDX,C]=kmeans(training,6,'Start',startdata);
% idbw=(IDX==1);
% template=reshape(idbw,size(h));
% figure,
% subplot(121),imshow(I);
% subplot(122),imshow(template);


% I1=imread("apple.png");
% R=I(:,:,1);
% G=I(:,:,2);
% B=I(:,:,3);
% set(0,'defaultFigurePosition',[100,100,1000,500]);
% set(0,'defaultFigureColor',[1,1,1]);
% figure,imshow(I1);
% figure,
% subplot(231),imshow(R);
% subplot(232),imshow(G);
% subplot(233),imshow(B);
% subplot(234),imhist(I(:,:,1))
% subplot(235),imhist(I(:,:,2))
% subplot(236),imhist(I(:,:,3))

% image=imread('plane.png');
% BW=im2bw(rgb2gray(image));
% 
% figure,subplot(221),imshow(BW),title('二值化图像');
% SE=strel('square',3);
% Morph=imopen(BW,SE);
% Morph=imclose(Morph,SE);
% subplot(222),imshow(Morph),title('形态学滤波');
% [B,L]=bwboundaries(1-Morph);
% subplot(223),imshow(L), title('划分的区域');
% STATS = regionprops(L,'Area','Centroid','Orientation','BoundingBox');
% 
% subplot(224),imshow(image),title('检测的区域');
% hold on;
% for i=1:length(B)
%     boundary=B{i};
%     plot(boundary(:,2),boundary(:,1),'r','LineWidth',2);
% end
% 
% for i=1:length(STATS)
%     rectangle('Position',STATS(i).BoundingBox ,'EdgeColor','g');
% end
% hold off;




    image = imread('Head.png');
    if size(image, 3) == 3
        image = rgb2gray(image);
    end
    image = double(image);

    [m, n] = size(image);
    image_mean = mean(image(:));
    image_centered = image - image_mean;

    covariance_matrix = (image_centered' * image_centered) / (m * n - 1);
    [eigen_vectors, eigen_values] = eig(covariance_matrix);
    principal_components = image_centered * eigen_vectors;

    figure;
    subplot(121);
    imshow(uint8(image));
    title('原始图像');

    subplot(122);
    imshow(uint8(principal_components(:, 1) + image_mean));
    title('主成分');
