%基于ORL数据库的PCA人脸识别系统
%时间：2019年12月30日
function  imdata = File_Read_ORL()
%测试数据：40人，每人10张照片。每人取前train_num张照片作为训练集，后（10－train_num）张照片作为测试集。
clear;
clc;
train_num=5;

%计算特征脸并创建特征空间
imdata=zeros(112*92,40*train_num);
for i=1:40    
    for j=1:train_num  
        addr=strcat('G:\硕士论文\作业\模式识别\FaceRecognitionPCA\FaceRecognitionPCA\faces','\s',num2str(i),'/',num2str(j),'.bmp');
        a=imread(addr);%从地址中读入图像
        b=a(1:112*92); %把图像a矩阵按列顺序转为行向量b
        imdata(:,train_num*(i-1)+j)=b'; %把b的转置矩阵存放到imdata矩阵的第ph*(i-1)+j列
    end
end
