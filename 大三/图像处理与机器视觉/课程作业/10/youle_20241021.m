% I1=imread('cameraman.tif');
% S=qtdecomp(I1,0.27);
% blocks=repmat(uint8(0),size(S));
% for dim=[256 128 64 32 16 8 4 2 1]
%     numblocks=length(find(S==dim));
%     if(numblocks>0)
%         values=repmat(uint8(1),[dim dim numblocks]);
%         values(2:dim,2:dim,:)=0;
%         blocks=qtsetblk(blocks,S,dim,values);
%     end
% end
%     blocks(end,1:end)=1;  blocks(1:end,end)=1;
%     figure,
%     subplot(121),imshow(I1);  
%     subplot(122),imshow(blocks,[]);


A1=imread('lotus.JPG');
B=rgb2gray(A1);
A2=im2double(B);

A=regiongrowing(A2,50,150,0.1);
figure,
subplot(121),imshow(A1),title('ORG');
subplot(122),imshow(A),title('Regiongrowing');



% I = imread('Head.png');
% % 转换为灰度图像
% if size(I, 3) == 3
%    I = rgb2gray(I);
% end
% 
% % 阈值分割
% threshold = graythresh(I);
% A = imbinarize(I, threshold);
% 
% figure;
% subplot(121);imshow(I);title('ORG');
% subplot(122);imshow(A);title('OTSU');