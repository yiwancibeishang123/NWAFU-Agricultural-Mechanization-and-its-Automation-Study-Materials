function output = Extract(inputImage, threshold)
    % 计算图像的像素值
    output = inputImage;
    
    % 找到连续的区域
    [rows, cols] = size(inputImage);
    for i = 1:rows
        for j = 1:cols
            if inputImage(i, j) > threshold
                output(i, j) = 1; % 保留大于阈值的像素
            else
                output(i, j) = 0; % 设置为0
            end
        end
    end
end