function [word, updatedImage] = Segment(inputImage)
    % 使用连通域标记
    [L, num] = bwlabel(inputImage);
    
    % 找到每个连通域的边界
    properties = regionprops(L, 'BoundingBox');
    
    % 假设我们只需要第一个字符区域
    if num > 0
        % 选择第一个字符区域
        boundingBox = properties(1).BoundingBox;
        x1 = round(boundingBox(1));
        y1 = round(boundingBox(2));
        width = round(boundingBox(3));
        height = round(boundingBox(4));
        
        % 提取字符区域
        word = imcrop(inputImage, [x1, y1, width, height]);
        
        % 更新图像，清除已提取的字符
        updatedImage = inputImage;
        updatedImage(L == L(round(y1 + height / 2), round(x1 + width / 2))) = 0;
    else
        word = [];
        updatedImage = inputImage;
    end
end