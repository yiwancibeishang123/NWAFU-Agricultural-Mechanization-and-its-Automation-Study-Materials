A1=imread("lotus.JPG");
%A2=im2double('A1');
B=rgb2gray(A1);

% [thr,sorh,keepapp]=ddencmp('den','wv',B);
% C=wdencmp('gbl',b,'sym4',2,thr,sorh,keepapp);
% D=medfilt2(C,[7 7]);

% isuo=imresize(B,0.25,'bicubic');
% es=edge(isuo,'sobel');
% er=edge(isuo,'roberts');
% ep=edge(isuo,'prewitt');
% el=edge(isuo,'log');
% ec=edge(isuo,'canny');
% 
% se=strel('diamond',1);
% 
% X1=imclose(es,se);
% X2=imclose(er,se);
% X3=imclose(ep,se);
% X4=imclose(el,se);
% X5=imclose(ec,se);
% 
% figure,imshow(isuo);
% 
% subplot(231),imshow(A1);title('ORG');
% subplot(232),imshow(X1);title('sobel');
% subplot(233),imshow(X2);title('roberts');
% subplot(234),imshow(X3);title('prewitt');
% subplot(235),imshow(X4);title('log');
% subplot(236),imshow(X5);title('canny');



img = imread('woman.png'); 
img_float = im2double(img);

h = fspecial('gaussian', [10 10], 3); 
img_blur = imfilter(img_float, h); 

img_enhanced = imadjust(img_blur, [0 1], [0 1]);

hsv_img = rgb2hsv(img_enhanced);
skin_mask = (hsv_img(:,:,1) >= 0 & hsv_img(:,:,1) <= 0.2) & ... 
             (hsv_img(:,:,2) >= 0.1 & hsv_img(:,:,2) <= 0.5) & ... 
             (hsv_img(:,:,3) >= 0.4 & hsv_img(:,:,3) <= 0.8);

img_skin = img_enhanced;
img_skin(skin_mask) = img_skin(skin_mask) * 1.1; 

img_final = img_skin;

img2=im2double(img_final);
img3=img2+0.1;


figure, 
subplot(121), imshow(img),title('org');
subplot(122), imshow(img3),title('beautiful');



% img1 = imread('building.png');
% img2 = imread('leaves.png'); 
% gray1 = rgb2gray(img1);
% gray2 = rgb2gray(img2);
% smooth1 = imbilatfilt(img1, 30, 0.2);
% smooth2 = imbilatfilt(img2, 30, 0.2);
% edges1 = edge(gray1, 'Canny');
% edges2 = edge(gray2, 'Canny');
% edges_rgb1 = repmat(edges1, [1, 1, 3]);
% edges_rgb2 = repmat(edges2, [1, 1, 3]);
% 
% RE_img1 = rgb2hsv(smooth1);
% RE_img2 = rgb2hsv(smooth2);
% RE_img1(:,:,2) = RE_img1(:,:,2) * 1.5;
% RE_img2(:,:,2) = RE_img2(:,:,2) * 1.5;
% RE_img1(hsv_img(:,:,2) > 1) = 1;
% RE_img2(hsv_img(:,:,2) > 1) = 1;
% enhanced_img1 = hsv2rgb(RE_img1);
% enhanced_img2 = hsv2rgb(RE_img2);
% a_img1 = enhanced_img1;
% a_img2 = enhanced_img2;
% a_img1(edges_rgb1) = 0;
% a_img2(edges_rgb2) = 0;
% 
% figure;
% subplot(2,2,1), imshow(img1), title('Image1');
% subplot(2,2,2), imshow(a_img1), title('Enhanced Image1');
% subplot(2,2,3), imshow(img2), title('Image2');
% subplot(2,2,4), imshow(a_img2), title('Enhanced Image 2');



%低通或高通滤波器设计
f=imread('lena.jpg');
f = im2double(f);% 计算填充图像大小
[M,N] = size(f);
M2 = 2*M;
N2 = 2*N;
%傅里叶变换
F = fftshift(fft2(f,M2,N2));subplot(221);imshow(mat2gray(log(1+abs(F))));title('傅里叶频谱');
% 设计滤波器
% 生成网格坐标
u = -N:N-1;
v =-M:M-1;
[u,V] = meshgrid(u,v);
% 设计滤波器
D = hypot(u,V);
D0 = 30;%截止频率[10 30 60 160 4601
H = mat2gray( D<= D0);% 理想低通滤波器
subplot(222);imshow(H);title('理想低通滤波器');
%频域滤波
G =F.*H;
g0 = ifft2(fftshift(G));
g = g0(1:M,1:N);
g = real(g);
subplot(223);imshow(f);title('原图');
subplot(224);imshow(g);title('滤波后的图像');