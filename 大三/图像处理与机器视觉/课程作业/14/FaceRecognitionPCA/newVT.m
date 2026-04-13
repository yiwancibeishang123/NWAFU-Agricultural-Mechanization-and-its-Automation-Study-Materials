function [neednum,average_face, immin, newVT] = newVT(imdata)
%此过程为标准PCA流程
%计算平均脸并显示
average_face=mean(imdata,2); %按行求平均mean(a,2)  按列mean（a）
Average_face=reshape(average_face,112,92);%将[112*92,1]的脸灰度数据转成[112,92]
figure;
subplot(1,1,1);
imshow(Average_face,[]);%imshow(I,[]) 显示灰度图像 I，根据 I 中的像素值范围对显示进行转换。
title(strcat('40*5张训练样本的平均脸'));
%步骤一：图像预处理，去中心化，即减去平均值
train_num=5;
immin=zeros(112*92,40*train_num);
for i=1:40*train_num  
    immin(:,i) = imdata(:,i)-average_face;
end
%步骤二：计算协方差矩阵
W=immin'*immin; %n*d x d*n= n*n 较小
%步骤三：对协方差矩阵W进行特征值分解，计算特征向量与特征值（向量）
[V,D]=eig(W);
%步骤四：对特征值进行排序，选取贡献率大于前85%的特征脸
[D_sort,index] = sort(diag(D),'descend');%降序排列
SumAllFaceEigenValue=sum(D_sort);
NowFaceEigenValue=0;
    %选取累计贡献大于85%的前neednum个特征脸
for i=1:size(D_sort,1)
NowFaceEigenValue=NowFaceEigenValue+D_sort(i);
neednum=i;
if(NowFaceEigenValue>SumAllFaceEigenValue*0.85)%累计贡献率达到85%以上即可
    break;
end
end
V_sort = V(:,index);
VT=immin*V_sort; %dxn*nxk=d*k
for i=1:40*train_num
    VT(:,i)=VT(:,i)/norm(VT(:,i));%归一化处理
end
% need_num=neednum;
for i=1:neednum
newVT(i,:)=VT(:,i);%取前neednum个特征值
end
end



