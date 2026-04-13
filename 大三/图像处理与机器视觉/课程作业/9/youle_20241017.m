% I=rgb2gray(imread('lotus.JPG'));
% figure,subplot(121),imshow(I),title('org');
% T=graythresh(I);
% result=im2bw(I,T);
% subplot(122),imshow(result),title('threshold');


classdef ImageSegmentationApp < matlab.apps.AppBase

    % 属性区
    properties (Access = public)
        UIFigure          matlab.ui.Figure
        LoadImageButton   matlab.ui.control.Button
        SegmentButton     matlab.ui.control.Button
        OriginalAxes      matlab.ui.control.UIAxes
        ProcessedAxes     matlab.ui.control.UIAxes
        Image             % 用于存储加载的图像
    end

    % 构造函数
    methods (Access = private)
        
        % 加载图像
        function LoadImageButtonPushed(app, event)
            [file, path] = uigetfile({'*.jpg;*.png;*.bmp', 'Image Files (*.jpg, *.png, *.bmp)'});
            if isequal(file, 0)
                return; % 用户取消选择
            end
            app.Image = imread(fullfile(path, file));
            imshow(app.Image, 'Parent', app.OriginalAxes);
            title(app.OriginalAxes, '原始图像');
        end
        
        % 执行阈值分割
        function SegmentButtonPushed(app, event)
            if isempty(app.Image)
                uialert(app.UIFigure, '请先加载图像！', '错误');
                return;
            end
            
            % 转换为灰度图像
            grayImage = rgb2gray(app.Image);
            
            % 使用 Otsu 方法计算最佳阈值
            level = graythresh(grayImage);
            binaryImage = imbinarize(grayImage, level);
            
            % 显示处理后的图像
            imshow(binaryImage, 'Parent', app.ProcessedAxes);
            title(app.ProcessedAxes, '分割结果');
        end
    end

    % 创建 UI 组件
    methods (Access = private)

        % 创建 UI
        function createComponents(app)
            % 创建窗口
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 600 400];
            app.UIFigure.Name = '图像分割应用';

            % 创建加载图像按钮
            app.LoadImageButton = uibutton(app.UIFigure, 'push');
            app.LoadImageButton.Position = [50 350 100 30];
            app.LoadImageButton.Text = '加载图像';
            app.LoadImageButton.ButtonPushedFcn = @(src, event) LoadImageButtonPushed(app, event);

            % 创建分割按钮
            app.SegmentButton = uibutton(app.UIFigure, 'push');
            app.SegmentButton.Position = [200 350 100 30];
            app.SegmentButton.Text = '分割图像';
            app.SegmentButton.ButtonPushedFcn = @(src, event) SegmentButtonPushed(app, event);

            % 创建原始图像坐标轴
            app.OriginalAxes = uiaxes(app.UIFigure);
            app.OriginalAxes.Position = [50 50 220 280];

            % 创建处理后图像坐标轴
            app.ProcessedAxes = uiaxes(app.UIFigure);
            app.ProcessedAxes.Position = [300 50 220 280];

            % 显示窗口
            app.UIFigure.Visible = 'on';
        end
    end

    % 运行应用
    methods (Access = public)

        % 启动应用
        function runApp()
            app = ImageSegmentationApp();
            app.createComponents();
        end
    end
end