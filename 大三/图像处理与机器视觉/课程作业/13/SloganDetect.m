I = imread('slogan1.jpg');
Im1 = rgb2gray(I);
figure;
subplot(321), imshow(Im1), title('Gray');

Tiao = imadjust(Im1, [0.19, 0.78], [0, 1]);
subplot(322), imshow(Tiao), title('Enhanced');

Im2 = edge(Im1, 'sobel', 0.02, 'both');
subplot(323), imshow(Im2), title('Sobel');

sc = [1; 1; 0];
Im3 = imerode(Im2, sc);
subplot(324), imshow(Im3), title('Eroded');

se = strel('rectangle', [40, 50]);
Im4 = imclose(Im3, se);
subplot(325), imshow(Im4), title('Closed');

Im5 = bwareaopen(Im4, 800);
subplot(326), imshow(Im5), title('Removed');

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

y1 = 10; 
y2 = 0.25; 
flag = 0; 
word1 = []; 
maxIterations = 1000; 
iteration = 0; 
previous_wide = -1; % 初始化previous_wide

while flag == 0 && iteration < maxIterations
    wide = find(sum(d, 1), 1, 'first') - 1; 
    disp(['Iteration: ', num2str(iteration), ', wide: ', num2str(wide)]);
    
    if wide < y1
        d(:, 1:wide) = 0; 
    else
        temp = d(:, 1:wide);
        all = sum(sum(temp));
        if all == 0 
            break; 
        end
        two_thirds = sum(sum(temp(round(size(temp, 1)/3):round(2 * size(temp, 1)/3), :)));
        if two_thirds / all > y2
            flag = 1;
            word1 = temp; 
        end
    end
    
    if wide == previous_wide
        break; % 如果wide没有变化则退出
    end
    previous_wide = wide; % 更新previous_wide
    iteration = iteration + 1; 
end

if iteration >= maxIterations
    warning('Reached maximum iterations, check the logic.');
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