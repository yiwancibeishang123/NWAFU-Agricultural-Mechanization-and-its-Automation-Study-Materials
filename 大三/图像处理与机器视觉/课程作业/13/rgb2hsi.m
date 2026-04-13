function hsi = rgb2hsi(rgb)
%hsi = rgb2hsi( rgb )将rgb转化为hsi
%输出hsi是double型的
rgb = im2double(rgb); % 将图像转换为double型
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);
% 执行转化
num = 0.5*((r-g)+(r-b));
den = sqrt((r-g).^2 +(r-b).*(g-b));
theta = acos(num./(den + eps)); % eps极小值标示，防止除以0出错
H = theta;
H(b>g) = 2*pi - H(b>g);
H = H/(2*pi);
num = min(min(r,g),b);
den = r + g + b;
den(den == 0) = eps; % eps极小值标示，防止除以0出错
S = 1 - 3.* num./den;
H(S==0) = 0;
I = ( r + g + b )/3;
% 组合hsi图像，H、S、I是矩阵
hsi = cat(3,H,S,I);
end

function rgb = hsi2rgb(hsi)
%hsi2rgb源程序
%rgb=hsi2rgb(hsi)把一幅HSI图像转换为RGB图像
%其中HSI是double型
%hsi(:,:,1)是色度分量，它的范围是除以2*pi后在[0,1]内
%hsi(:,:,2)是饱和度分量，它的范围是在[0,1]内
%hsi(:,:,3)是亮度分量，它的范围是在[0,1]内
%输出图像的分量是
%rgb(:,:,1)为红
%rgb(:,:,2)为绿
%rgb(:,:,3)为蓝
%提取HSI的各个分量
hsi = im2double(hsi); % 把hsi转化为双精度浮点类型
H = hsi(:,:,1)*2*pi;
S = hsi(:,:,2);
I = hsi(:,:,3);
%执行变换方程
R = zeros(size(hsi,1),size(hsi,2));
G = zeros(size(hsi,1),size(hsi,2));
B = zeros(size(hsi,1),size(hsi,2));
%RG区(0<=H<2*pi/3)
idx = find((0<=H) & (H<2*pi/3)); % 寻找0<=H<2*pi/3
B(idx) = I(idx).*(1-S(idx));
R(idx) = I(idx).*(1+S(idx).*cos(H(idx))./cos(pi/3-H(idx)));
G(idx) = 3*I(idx) - (R(idx)+B(idx));
%BG区(2*pi/3<=H<4*pi/3)
idx = find((2*pi/3<=H) & (H<4*pi/3)); % 寻找2*pi/3<=H<4*pi/3
R(idx) = I(idx).*(1-S(idx));
G(idx) = I(idx).*(1+S(idx).*cos(H(idx)-2*pi/3)./cos(pi-H(idx)));
B(idx) = 3*I(idx) - (R(idx)+G(idx));
%BR区(4*pi/3<=H<=2*pi)
idx = find((4*pi/3<=H) & (H<=2*pi)); % 寻找4*pi/3<=H<=2*pi
G(idx) = I(idx).*(1-S(idx));
B(idx) = I(idx).*(1+S(idx).*cos(H(idx)-4*pi/3)./cos(5*pi/3-H(idx)));
R(idx) = 3*I(idx) - (G(idx)+B(idx));
%将3个分量联合成为一个RGB图像
rgb = cat(3,R,G,B);
rgb = max(min(rgb,1),0);
end