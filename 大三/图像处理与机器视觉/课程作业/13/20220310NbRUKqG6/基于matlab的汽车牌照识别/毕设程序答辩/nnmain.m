% clear
% clc
%%  读取样本数据
DATADIR='.\sample\';                                   % 待处理图像目录 
dirinfo=dir(DATADIR);                                  % 获取图像目录所有文件信息
Name={dirinfo.name};                                   % 获取文件名
Name(1:2)=[];                                          % 去除文件夹固有信息
[nouse num_of_char]=size(Name);                        % 获取类别数量
count = 1;
images = [];
labels = [];
for  cnt=1  :num_of_char                               % for 循环读取所有文件夹
 
      pathname=horzcat(DATADIR, Name{cnt},'\');        % 把路径和名字融合一起
      sub_dirinfo=dir(pathname);                       % 获取图像目录所有文件信息
      sub_Name={sub_dirinfo.name};                     % 获取文件名
      sub_Name(1:2)=[];  
      [nouse num_of_image]=size(sub_Name); 
      for i = 1: num_of_image
      image = imread(horzcat(pathname,sub_Name{i}));
      if size(image,3) >1 
          image = rgb2gray(image);
      end
      bw  = im2bw(image,graythresh(image));
      bw1 = double(reshape(bw,288,1));
      images = [images,bw1];
      labels(count) = cnt;
      count = count +1;
      end
end
%% 设置神经网络参数并训练
input_layer_size  = 288;          % 12x24  输入图像大小
hidden_layer_size = 30;           % 隐含层个数
num_labels = num_of_char;         % 标签个数  

X = images';                        
y = labels'; 
 

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);   %初始化神经网络参数
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);         %初始化神经网络参数
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];    
options = optimset('MaxIter', 500);   
lambda = 1;
costFunction = @(p) nnCostFunction(p, ...                                      % 用训练样本计算最优参数
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
             
%% 测试  可修改测试函数         
% images_test0 = imread(['3.jpg']);
% images_test1 = imresize(images_test0,[24 12]);  
% bw  = im2bw(images_test1,graythresh(images_test1));
% images_test = double(reshape(bw,288,1));
% pred = predict(Theta1, Theta2, images_test');                     
% Name{pred}             
             
             