classdef ImageSegmentationApp < matlab.apps.AppBase

    properties (Access = public)
        UIFigure          matlab.ui.Figure
        LoadImageButton   matlab.ui.control.Button
        SegmentButton     matlab.ui.control.Button
        CreatorInfoTextArea  matlab.ui.control.TextArea
        OriginalAxes      matlab.ui.control.UIAxes
        ProcessedAxes     matlab.ui.control.UIAxes
        Image             % 存储图像
    end


    methods (Access = private)
        
        % 插入图像
        function LoadImageButtonPushed(app, event)
            [file, path] = uigetfile({'*.jpg;*.png;*.bmp', 'Image Files (*.jpg, *.png, *.bmp)'});
            if isequal(file, 0)
                return;
            end
            app.Image = imread(fullfile(path, file));
            imshow(app.Image, 'Parent', app.OriginalAxes);
            title(app.OriginalAxes, '原始图像');
        end
        
        % 阈值分割
        function SegmentButtonPushed(app, event)
            if isempty(app.Image)
                uialert(app.UIFigure, '未插入图像', '错误');
                return;
            end
    
        % 确认 RGB 图像
            if size(app.Image, 3) == 3
        % 灰度图像
                grayImage = rgb2gray(app.Image);
            elseif size(app.Image, 3) == 1
                grayImage = app.Image;
            else
                uialert(app.UIFigure, '不支持的图像格式！', '错误');
                return;
        end
    
    % 最大类间方差法
        level = graythresh(grayImage);
        binaryImage = imbinarize(grayImage, level);
    
    % 处理后的图像
        imshow(binaryImage, 'Parent', app.ProcessedAxes);
        title(app.ProcessedAxes, '分割结果');
        end
    end

    methods (Access = private)

        function createComponents(app)
            % 创建窗口
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 600 400];
            app.UIFigure.Name = '最大类间方差法阈值分割';

            app.LoadImageButton = uibutton(app.UIFigure, 'push');
            app.LoadImageButton.Position = [120 350 100 30];
            app.LoadImageButton.Text = '插入图像';
            app.LoadImageButton.ButtonPushedFcn = @(src, event) LoadImageButtonPushed(app, event);

            app.SegmentButton = uibutton(app.UIFigure, 'push');
            app.SegmentButton.Position = [370 350 100 30];
            app.SegmentButton.Text = '阈值分割';
            app.SegmentButton.ButtonPushedFcn = @(src, event) SegmentButtonPushed(app, event);

            app.OriginalAxes = uiaxes(app.UIFigure);
            app.OriginalAxes.Position = [50 50 220 280];

            app.ProcessedAxes = uiaxes(app.UIFigure);
            app.ProcessedAxes.Position = [300 50 220 280];

            app.UIFigure.Visible = 'on';
        end
    end

    methods (Access = public)

        function run(app)
            app = ImageSegmentationApp();
            app.createComponents();
        end
    end
end