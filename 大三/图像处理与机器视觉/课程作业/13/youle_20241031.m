% fc=imread('Head.png');
% subplot(121),imshow(fc);
% fr=fc(:,:,1);
% fg=fc(:,:,2);
% fb=fc(:,:,3);
% h=rgb2hsi(fc);
% H=h(:,:,1);
% S=h(:,:,2);
% I=h(:,:,3);
% I=I*1.5;
% h=cat(3,H,S,I);
% f=hsi2rgb(h);
% f=min(f,1);
% subplot(122),imshow(f);

I=imread('slogan1.jpg');
Im1=rgb2gray(I);
figure;
subplot(321),imshow(Im1),title('Gray');
% subplot(522),imhist(Im1),title('Hist1');
Tiao=imadjust(Im1,[0.19,0.78],[0,1]);
subplot(322),imshow(Tiao),title('Enhanced');
% subplot(524),imhist(Tiao),title('Hist2');
Im2=edge(Im1,'sobel',0.02,'both');
subplot(323),imshow(Im2),title('Sobel');
sc=[1;1;0];
Im3=imerode(Im2,sc);
subplot(324),imshow(Im3),title('Eroded');
se=strel('rectangle',[40,50]);
Im4=imclose(Im3,se);
subplot(325),imshow(Im4),title('Closed');
Im5=bwareaopen(Im4,800);
subplot(326),imshow(Im5),title('Removed');

% [y,x,z]=size(Im5);
% Im6=double(Im5);
% Blue_y=zeros(y,1);
% for i=1:y
%     for j=1:x
%         if(Im6(i,j,1)==1)
%             Blue_y(i,1)=Blue_y(i,1)+1;
%         end
%     end
% end
% [tempMaxY]=max(Blue_y);
% PY1=tempMaxY;
% while((Blue_y(PY1,1)>=5)&&(PY1>1))
%     PY1=PY1-1;
% end
% PY2=tempMaxY;
% while((Blue_y(PY2,1)>=5)&&(PY2<y))
%     PY2=PY2+1;
% end
% IY=I(PY1:PY2,:,:);
% Blue_x=zeros(1,x);
% for j=1:x
%     for i=PY1:PY2
%         if(Im6(i,j,1)==1)
%             Blue_x(1,j)=Blue_x(1,j)+1;
%         end
%     end
% end
% PX1=1;
% while((Blue_x(1,PX1)<3)&&(PX1<x))
%     PX1=PX1+1;
% end
% PX2=x;
% while((Blue_x(1,PX2)<3)&&(PX2>PX1))
%     PX2=PX2-1;
% end
% PX1=PX1-1;
% PX2=PX2+1;
% 
% PY1 = max(min(PY1, size(I, 1)), 1);
% PY2 = max(min(PY2, size(I, 1)), 1);
% PX1 = max(min(PX1, size(I, 2)), 1);
% PX2 = max(min(PX2, size(I, 2)), 1);
% if PY1 > PY2
%     PY1 = PY2;
% end
% if PX1 > PX2
%     PX1 = PX2;
% end
% 
% dw=I(PY1:PY2,PX1:PX2,:);
% subplot(529),imshow(IY),title('Vertical');
% subplot(5,2,10),imshow(dw),title('Cut');

% g_max=double(max(max(Im1)));
% g_min=double(min(min(Im1)));
% T=round(g_max-(g_max-g_min)/3);
% [m,n]=size(Im1);
% d=(double(Im1)>=T);
% % figure;imshow(d);
% h=fspecial('average',3);
% d=im2bw(round(filter2(h,d)));
% % figure,imshow(d);
% se1=eye(2);
% [m,n]=size(d);
% if bwarea(d)/m/n >= 0.365
%     d=imerode(d,se1);
% else 
%     if bwarea(d)/m/n<=0.235
%         d=imdilate(d,se1);
%     end
% end
% % figure,imshow(d);
% % d=Extract(d,0.2);
% [m,n]=size(d);
% j=1;
% s=sum(d);
% while j~=n
%     while s(j)==0
%         j=j+1;
%     end
%     k1=j;
%     while s(j)~=0 && j<=n-1
%         j=j+1;
%     end
%     k2=j-1;
%     if k2-k1 >= round(n/6.5)
%         [val,num]=min(sum(d(:,[k1+5;k2-5])));
%         d(:,k1+num+5)=0;
%     end
% end
% y1=10;y2=0.25;flag=0;word1=[];
% while flag==0
%     [m,n]=size(d);
%     wide=0;
%     while sum(d(:,wide+1))~=0
%         wide=wide+1;
%     end
%     if wide<y1
%         d(:,1:wide)=0;
%         % d=Extract(d,0.2);
%     else
%         % temp=Extract(imcrop([1,wide,m]),0.2);
%         [m,n]=size(temp);
%         all=sum(sum(temp));
%         two_thirds=sum(sum(temp(round(m/3):2*round(m/3),:)));
%         if two_thirds/all >y2
%             flag=1;
%             word1=temp;
%         end
%         % d(:,[1:wide])=0;d=Extract(d);
%     end
% end
% [word2,d]=Segment(d);
% [word3,d]=Segment(d);
% [word4,d]=Segment(d);
% [word5,d]=Segment(d);
% [word6,d]=Segment(d);
% [word7,d]=Segment(d);
% [word8,d]=Segment(d);
% [word9,d]=Segment(d);
% word1=imresize(word1,[40 20]);
% word2=imresize(word2,[40 20]);
% word3=imresize(word3,[40 20]);
% word4=imresize(word4,[40 20]);
% word5=imresize(word5,[40 20]);
% word6=imresize(word6,[40 20]);
% word7=imresize(word7,[40 20]);
% word8=imresize(word8,[40 20]);
% word9=imresize(word9,[40 20]);
% figure;
% subplot(171),imshow(word1);
% subplot(172),imshow(word2);
% subplot(173),imshow(word3);
% subplot(174),imshow(word4);
% subplot(175),imshow(word5);
% subplot(176),imshow(word6);
% subplot(177),imshow(word7);
% subplot(178),imshow(word8);
% subplot(179),imshow(word9);

[m, n] = size(Im1);
g_max = double(max(max(Im1)));
g_min = double(min(min(Im1)));
T = round(g_max - (g_max - g_min) / 3);
d = (double(Im1) >= T);

h = fspecial('average', 3);
d = im2bw(round(filter2(h, d)));

se1 = eye(2);
if bwarea(d) / (m * n) >= 0.365
    d = imerode(d, se1);
elseif bwarea(d) / (m * n) <= 0.235
    d = imdilate(d, se1);
end

% 连续字符区域提取
s = sum(d);
j = 1;
while j <= n
    while j <= n && s(j) == 0
        j = j + 1;
    end
    k1 = j;
    while j <= n && s(j) ~= 0
        j = j + 1;
    end
    k2 = j - 1;
    if k2 - k1 >= round(n / 6.5)
        d(:, k1 + find(s(k1 + 5:k2 - 5) == min(s(k1 + 5:k2 - 5))) + 5) = 0;
    end
end

% 字符分割
y1 = 10; y2 = 0.25; flag = 0; word1 = [];
while flag == 0
    wide = find(sum(d, 1), 1, 'first') - 1;
    if wide < y1
        d(:, 1:wide) = 0;
    else
        temp = d(:, 1:wide);
        all = sum(sum(temp));
        two_thirds = sum(sum(temp(round(size(temp, 1)/3):round(2 * size(temp, 1)/3), :)));
        if two_thirds / all > y2
            flag = 1;
            word1 = temp;
        end
    end
end

% 字符分割和调整
words = {};
for i = 1:9
    if ~isempty(d)
        [m, n] = size(d);
        [~, first_col] = find(d, 1, 'first');
        [~, last_col] = find(d, 1, 'last');
        if ~isempty(first_col) && ~isempty(last_col)
            word_temp = d(:, first_col:last_col);
            word_temp = imresize(word_temp, [40 20]);
            words{end + 1} = word_temp;
            d(:, first_col:last_col) = 0; % 清除已提取字符
        end
    end
end

% 显示结果
figure;
for i = 1:length(words)
    subplot(1, 9, i), imshow(words{i}), title(['Word ' num2str(i)]);
end