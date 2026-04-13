clear all;

%% 数据导入
list_names=dir('\orl_faces\*.pgm') 
img_num = length(list_names);% 文件夹中图像的个数
folder=list_names.folder

DB= zeros(112,92,img_num);

for idx = 1:img_num
    DB(:,:,idx)  =imread([folder,'\',list_names(idx).name]);
end

DB = reshape(DB, 112*92,100);

%% train与test划分

% 取出前40%作为测试数据，剩下60%作为训练数据
test_data_index = [];
train_data_index = [];

%记录测试集和训练集的下标
for i=0:9
    test_data_index = [test_data_index 10*i+1:10*i+4];
    train_data_index = [train_data_index 10*i+5:10*(i+1)];
end

test_data = DB(:, test_data_index);
train_data = DB(:,train_data_index);

waitfor(show_faces(train_data));


%% PCA算法实现

% S1：去中心化

% 1）求所有图像各像素点的平均值，即平均脸
mean_face = mean(train_data, 2); %计算出的是h*w的一张图，即平均脸
waitfor(show_face(mean_face));

% 2) 原始数据-mean，中心化每一列是一个一张图
centered_face = (train_data - mean_face);
waitfor(show_faces(centered_face));

% S2: 协方差矩阵的特征值与特征向量
% 1）cov协方差矩阵
cov_matrix = centered_face * centered_face';
[eigen_vectors, dianogol_matrix] = eig(cov_matrix);

% 2）特征值
eigen_values = diag(dianogol_matrix);

% 特征值降序排序，获得取特征值及其对应索引
[sorted_eigen_values, index] = sort(eigen_values, 'descend'); 

% 3）特征向量
sorted_eigen_vectors = eigen_vectors(:, index);

%% 特征脸(所有）

all_eigen_faces = sorted_eigen_vectors;

%% 特征脸选取

    %根据自己设定percent选出特征脸
    %根据选取特征量的数量构造特征脸
    
    %选出的特征脸就是W 
    %w*x就是映射到脸空间
    
    %正确的

%取出第一张人脸，使用不同数量的特征向量进行重构
single_face = centered_face(:,1);

index = 1;
X = [];
Y = [];

%下图是分别在10，20，30，…，100数量的特征向量下重构的人脸。
%从直观上可以看出随着特征向量数量的增加，重构出的人脸越来越清晰。
%这是因为使用越多的特征向量进行人脸重构，丢失的信息越少，因此重构出的人脸更加清晰。

numOfeig = 100   %特征值的数量

for i=10:10:numOfeig
    % 取出相应数量特征脸
    eigen_faces = all_eigen_faces(:,1:i);

    % 重建人脸并显示
    if (mod(i,10)==0)
        rebuild_faces = eigen_faces * (eigen_faces' * single_face) + mean_face;
        %%%
        subplot(2, 5, index);
        index = index + 1;
        fig = show_face(rebuild_faces);
        title(sprintf("i=%d", i));    

        if (i == 100)
            waitfor(fig);
        end
    end

 %% 测试、训练数据降维

 %计算不同数量特征向量下，人脸的识别准确度
 % 1）Y=W*X进行脸空间的映射
 % 2）使用欧式距离计算test与已知脸的距离
 % 3) 使用最近邻分类器KNN进行识别
 

 %projected_x_data就是降维后的reduced_face
    projected_train_data = eigen_faces' * (train_data - mean_face);
    projected_test_data = eigen_faces' * (test_data - mean_face);

    % KNN的k值
    %k就是人脸的标签判定数组的大小，出现最多次的就判断为true_label
    for k=1:6
        fprintf('knn')
        % 用于保存最小的k个值的矩阵
        % 用于保存最小k个值对应的人标签的矩阵
        minimun_k_values = zeros(k,1);
        label_of_minimun_k_values = zeros(k,1);

        % 测试脸的数量
        test_face_number = size(projected_test_data, 2);

        % 识别正确数量
        correct_predict_number = 0;

        % 遍历每一个待测试人脸
        for each_test_face_index = 1:test_face_number

            each_test_face = projected_test_data(:,each_test_face_index);
            
         %这边操作看似多余，其实是为了首先用6个值填满，减少之后空循环迭代
            for each_train_face_index = 1:k    
                %minimun_k_values 记录两点间距离 6*1矩阵
                minimun_k_values(each_train_face_index,1) = norm(each_test_face - projected_train_data(:,each_train_face_index));
                %label_of_minimun_k_values 就是通过计算算出实际的标签 -1 2 3 4 5 6 
                %label_of_minimun_k_values=[40,25;5,25;3,40]
                label_of_minimun_k_values(each_train_face_index,1) = floor((train_data_index(1,each_train_face_index) - 1) / 10) + 1;
            end

            % 找出k个值中最大值及其下标
            % IDX=5 
            [max_value, index_of_max_value] = max(minimun_k_values);

            % 计算与剩余每一个已知人脸的距离
            for each_train_face_index = k+1:size(projected_train_data,2)

                % 计算距离
                %norm函数就是求欧式距离
                distance = norm(each_test_face - projected_train_data(:,each_train_face_index));

                % 遇到更小的距离就更新距离和标签
                if (distance < max_value)
                    minimun_k_values(index_of_max_value,1) = distance;
                    label_of_minimun_k_values(index_of_max_value,1) = floor((train_data_index(1,each_train_face_index) - 1) / 10) + 1;
                    [max_value, index_of_max_value] = max(minimun_k_values);
                end
            end

            % 最终得到距离最小的k个值以及对应的标签
            % 取出出现次数最多的值，为预测的人脸标签
            
            %标签和下标的关系为： label=floor((train_data_index(1,each_train_face_index) - 1) / 10) + 1
            predict_label = mode(label_of_minimun_k_values);
            real_label = floor((test_data_index(1,each_test_face_index) - 1) / 10)+1;

            if (predict_label == real_label)
                fprintf("预测值：%d，实际值:%d，正确\n",predict_label,real_label);
                correct_predict_number = correct_predict_number + 1;
            else
                fprintf("预测值：%d，实际值:%d，错误\n",predict_label,real_label);
            end
        end

        %正确率
        correct_rate = correct_predict_number/test_face_number;

        X = [X k];
        Y = [Y correct_rate];
        
        fprintf("k=%d，numOfeig=%d，总测试样本：%d，正确数:%d，正确率：%1f \n", k, i,test_face_number,correct_predict_number,correct_rate);

    end
end

waitfor(plot(X,Y));

%% 功能函数 图像可视化

% 输入向量，显示脸

function fig = show_face(vector)
    fig= imshow((reshape(vector, [112 92]))/255);
end

% 显示矩阵中某些脸
function fig = show_faces(eigen_vectors)
    count = 1;
    index_of_image_to_show = [1,5,10,15,20,25,30,35];
    for i=index_of_image_to_show
        subplot(2,4,count);
        fig = show_face(eigen_vectors(:, i));
        title(sprintf("i=%d", i));
        count = count + 1;
    end
end
