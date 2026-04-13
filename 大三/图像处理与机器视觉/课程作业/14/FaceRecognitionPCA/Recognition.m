function [OutputClass,Recognized_index] = Recognition(TestImagePath,neednum,average_face, immin, newVT)
train_num=5;
Average_face=double(reshape(average_face,1,112*92));
MeanFace=mean(Average_face,1);
% MeanFace=mean(imdata,1);
face_train_projection=zeros(neednum,40*train_num);
for i=1:40*train_num
    %映射训练集图像
    Coefficient1=newVT*immin(:,i);  %k*d x d*1=k*1;
    face_train_projection(:,i)=Coefficient1;
end
%读入样本数据
test=zeros(112*92,40*(10-train_num));
for i=1:40    
    for j=(train_num+1):10  %6到10,后五张作为测试样本
        addr=strcat('G:\硕士论文\作业\模式识别\FaceRecognitionPCA\FaceRecognitionPCA\faces','\s',num2str(i),'/',num2str(j),'.bmp');
        a=imread(addr);
        b=a(1:112*92); 
        test(:,(10-train_num)*(i-1)+(j-train_num))=b';
    end
end
%减去平均脸
testmin=zeros(112*92,40*(10-train_num));
for i=1:40*(10-train_num)     
    testmin(:,i) = test(:,i)-average_face;
end
face_test_projection=zeros(neednum,40*(10-train_num));
for i=1:40*(10-train_num)
    %映射测试集图像
    Coefficient2=newVT*testmin(:,i);
    face_test_projection(:,i)=Coefficient2;
end

%识别，并计算准确率
right=0;%准确数
for num=1:40*(10-train_num)
    class=minindex(num,face_train_projection,face_test_projection);
% display(strcat('测试集中的第',num2str(num),'张图片属于类别：S',num2str(class)));
    if class==ceil(num/5)
    right=right+1;
    end
end
accuracy=num2str(100*right/length(face_test_projection));
display(strcat('测试中判错数为：',num2str(length(face_test_projection)-right),'张，正确数为：',num2str(right),'张，正确率为:',accuracy,'%'));

%随机检测，找出与输入人脸最相近的人脸图像
A=imread(TestImagePath);
B=A(1:112*92);
test=double(B')-average_face;
TestProjectedImage = (newVT*test);
Euc_dist = [];
for p=1:length(face_train_projection)
      temp=normest(TestProjectedImage-face_train_projection(:,p));
      Euc_dist = [Euc_dist temp];
end
[Euc_dist_min , Recognized_index] = min(Euc_dist);%Recognized_index记录最小距离的行号
OutputClass = strcat('s',int2str((Recognized_index-1)/5),'class');
figure,
subplot(121);
imshow(A,[]);
title('输入人脸');
subplot(122);
imshow(reshape(((immin(:,Recognized_index))'+average_face'),112,92),[]);
title(strcat('识别人脸，类别:',int2str((Recognized_index-1)/5)));
% accuracy=uicontrol('style','toggle','string','accuracy')
end




