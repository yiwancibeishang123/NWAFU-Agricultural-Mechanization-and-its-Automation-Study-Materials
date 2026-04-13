function varargout = run(varargin)
% RUN MATLAB code for run.fig
%      RUN, by itself, creates a new RUN or raises the existing
%      singleton*.
%
%      H = RUN returns the handle to a new RUN or the handle to
%      the existing singleton*.
%
%      RUN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUN.M with the given input arguments.
%
%      RUN('Property','Value',...) creates a new RUN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before run_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to run_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help run

% Last Modified by GUIDE v2.5 07-May-2016 15:41:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @run_OpeningFcn, ...
                   'gui_OutputFcn',  @run_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before run is made visible.
function run_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to run (see VARARGIN)

% Choose default command line output for run
handles.output = hObject;
handles.cd0 = cd;
handles.Color = 0;
handles.I = [];

axes(handles.axes1);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

axes(handles.axes2);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

axes(handles.axes3);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

axes(handles.axes4);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

axes(handles.axes5);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

axes(handles.axes6);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

axes(handles.axes8);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

axes(handles.axes9);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;

axes(handles.axes12);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;
axes(handles.axes13);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;
axes(handles.axes14);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;
axes(handles.axes15);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;
axes(handles.axes16);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;
axes(handles.axes17);
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
box on;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes run wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = run_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%  读图
[filename, cd1] = uigetfile( ...
    {'*.tif;*.TIF;*.JPG;*.jpg;*.bmp;*.BMP;*.jpeg;*.JPEG;','Image file';...
    '*.*', 'All file (*.*)'},'Pick an Image');
axes(handles.axes1);
cla;
axes(handles.axes2);
cla;
axes(handles.axes3);
cla;
axes(handles.axes4);
cla;
if filename

    cd(cd1);
    d = imread(filename);
    cd(handles.cd0);
    handles.I = d;
    axes(handles.axes1);
    imshow(d);
    handles.filename = filename; 

    box on;
    
end

handles.Color = 0;
cd(handles.cd0);
set(handles.text2,'string','');
guidata(hObject, handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image =  handles.I; 
gray = rgb2gray(image);     % 图像灰度化
axes(handles.axes2);
imshow(gray);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image =  handles.I; 
gray = rgb2gray(image);
new_gray = histeq(gray);  % 直方图均衡 ，图像增强
axes(handles.axes3);
imshow(new_gray);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image =  handles.I; 
gray = rgb2gray(image);     
new_gray = histeq(gray);  % 直方图均衡 ，图像增强
if size(new_gray,1)>1000
    new_gray_1 = imresize(new_gray,0.1);
else
    new_gray_1  =new_gray;
end
bw  = edge(new_gray_1,'canny');                    
axes(handles.axes4);
imshow(bw);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% chepai dingwei
Image = handles.I;

 
DI = Image(:,:,3);

GI = (Image(:,:,1)<100 & Image(:,:,2)<150 & Image(:,:,3)>120 ...
     & abs(double(Image(:,:,2))-double(Image(:,:,3)))>30);      

axes(handles.axes5);
imshow(GI);
handles.GI = GI;
guidata(hObject, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%  fengecheoai
d = handles.GI;

se = ones(40);  % 腐蚀膨胀模版

d = imdilate(d,se);% 再做膨胀运算 
d = imerode(d,se); % 先做腐蚀运算
% 先膨胀后腐蚀的过程称为开运算。用来填充物体内细小空洞、连接邻近物体、平滑其边界的同时并不明显改变其面积。
d = bwareaopen(d,100); % 移除小对象 小区域肯定是噪声
 
STATS = regionprops(d);%统计被标记的区域的面积分布，显示区域总数
area = [];

for i = 1:size(STATS,1)
    area = [area;STATS(i).Area];
end
[value,index] = max(area); 

Bound = round(STATS(index).BoundingBox);
 
xmin = Bound(2);
xmax = Bound(2)+Bound(4);
ymin = Bound(1);
ymax = Bound(1)+Bound(3);

II = handles.I(xmin:xmax,ymin:ymax,:);
 
axes(handles.axes6);
imshow(II);

handles.Divice = II;
guidata(hObject, handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% 车牌预处理   校正 去边框
I_old = handles.Divice;
if size(I_old,2)> 900
    I = imresize(I_old,0.1);
else
    I  =I_old;
end
I_gray=rgb2gray(I);


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%水平校正
I_gray_bw=edge(I_gray,'sobel','horizontal');
theta1=1:180;
[R1,xp1]=radon(I_gray_bw,theta1);
[I1,J1]=find(R1>=max(max(R1)));
qxj_hor=90-J1;
I_HOR_JZ=imrotate(I,qxj_hor,'bilinear','crop');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%水平校正结束 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%水平去边框
    I_hor_jz_gray=rgb2gray(I_HOR_JZ);

    I_hor_jz_gray_bw=edge(I_hor_jz_gray,'canny');

   [m,n]=size(I_hor_jz_gray_bw);
    count_hor=zeros(m,1);
    for i=1:1:m
        tbd=0;
        for j=1:1:n-1
            if I_hor_jz_gray_bw(i,j)~=I_hor_jz_gray_bw(i,j+1);
                tbd=tbd+1;
            end    
        end
        count_hor(i,1)=tbd/2;
    end
  for i1=1:1:m
      if count_hor(i1,1)>9
          TOP=i1;
          break;
      end
  end
  for j1=m:-1:1;
      if count_hor(j1,1)>9
          BOTTOM=j1;
          break;
      end
  end
I_HOR_JZ_S=I_HOR_JZ(TOP:BOTTOM,:,:);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%水平去边框结束

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%垂直校正
I_hor_jz_gray=medfilt2(I_hor_jz_gray);
 I_hor_jz_gray_bw1=edge(I_hor_jz_gray,'canny');
 [height,width]=size( I_hor_jz_gray_bw1);
 I_hor_jz_gray_bw1_1=I_hor_jz_gray_bw1(:,width/2:width);
 I_hor_jz_gray_bw1_2=I_hor_jz_gray_bw1(:,1:width/2);
theta2=-30:30;
[R2,xp2]=radon(I_hor_jz_gray_bw1_1,theta2);
[R3,xp3]=radon(I_hor_jz_gray_bw1_2,theta2);
[I2,J2]=find(R2>=max(max(R2)));
[I3,J3]=find(R3>=max(max(R3)));
qxj_ver2=J2-30;
qxj_ver2_s=mean(qxj_ver2(:));
qxj_ver3=J3-30;
qxj_ver3_s=mean(qxj_ver3(:));
if abs(qxj_ver2_s-qxj_ver3_s)<3
    qxj_ver=(qxj_ver2_s+qxj_ver3_s)/2;
else
    [mexp,nexp]=size(I_HOR_JZ_S);
    count_black=zeros(61,nexp);
    count_white=zeros(61,nexp);
    for angle=-30:30
        T=maketform('affine',[1 -tand(angle) 0;0 1 0;0 0 1]');
        I_VER_exp=imtransform(I_HOR_JZ_S,T,'FillValues',255);
        I_VER_exp=rgb2gray(I_VER_exp);
        I_VER_exp=histeq(I_VER_exp);
        I_VER_exp=medfilt2(I_VER_exp);
        threshexp=graythresh(I_VER_exp);
        I_VER_exp_erzhi=im2bw(I_VER_exp,threshexp);
        [mexp,nexp]=size(I_VER_exp_erzhi);
        white=zeros(1,nexp);
        black=zeros(1,nexp);
        for zexp=1:nexp
            for cexp=1:mexp
                if I_VER_exp_erzhi(cexp,zexp)==1
                    white(1,zexp)= white(1,zexp)+1;
                else
                    black(1,zexp)=black(1,zexp)+1;
                end
            end
            if white(1,zexp)>0
                count_white(angle+31,zexp)=1;
            end
            if black(1,zexp)>0
                count_black(angle+31,zexp)=1;
            end
        end
    end
    result=count_white&count_black;
    ling=zeros(61,1);

    for o=1:61
        for p=1:nexp
            if result(o,p)==0
                ling(o,1)=ling(o,1)+1;
            end
        end
    end
    
   [hang2,lie2]=find(ling>=max(max(ling)));        
    qxj_ver=hang2-31;
    qxj_ver=mean(qxj_ver(:))
end
T1=maketform('affine',[1 -tand(qxj_ver) 0;0 1 0;0 0 1]');
I_VER_JZ=imtransform(I_HOR_JZ_S,T1,'FillValues',255);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%垂直校正结束

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%垂直去边框
 I_VER_JZ_gray=rgb2gray(I_VER_JZ);
 I_VER_JZ_gray=histeq(I_VER_JZ_gray);
 I_VER_JZ_gray=medfilt2(I_VER_JZ_gray);
 thresh=graythresh(I_VER_JZ_gray);
 I_VER_JZ_erzhi=im2bw(I_VER_JZ_gray,thresh);
% figure(6);imshow(I_VER_JZ_erzhi);title('二值图');
[m1,n1]=size(I_VER_JZ_erzhi);
count_ver=zeros(n1,1);
for z=1:n1
    tbd1=0;
    for c=1:m1-1
        if I_VER_JZ_erzhi(c,z)~=I_VER_JZ_erzhi(c+1,z)
            tbd1=tbd1+1;
        end
    end
    count_ver(z,1)=tbd1;
end

for z1=1:1:n1-1
    if count_ver(z1,1)>1&&count_ver(z1+1,1)>1
        LEFT=z1;
        break;
    end
end
for c1=n1:-1:2
    if count_ver(c1,1)>1&&count_ver(c1-1,1)>1
        RIGHT=c1;
        break;
    end
end
I_VER_JZ_S=I_VER_JZ(:,LEFT:RIGHT,:);
axes(handles.axes8);
imshow(I_VER_JZ_S);
handles.chepaiyu = I_VER_JZ_S;
handles.chepaiyuT = thresh;
guidata(hObject, handles);
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% 字符分割
I_VER_JZ_S = handles.chepaiyu;
thresh = handles.chepaiyuT;

I_1=rgb2gray(I_VER_JZ_S); 

K=im2bw(I_1,thresh);
[kuan,chang]=size(K);
% STATS = regionprops(K);
% 
% 
% for i = 1:size(STATS,1)
%     STATS(i).Area>
% rectangle('Position',STATS(4).BoundingBox,'EdgeColor','r');
%  


[x,y]=find(K==1)
a1=length(x);
[x,y]=find(K==0)
 b1=length(y);
 if a1>b1
     K1=~K;
 else
     K1=K;
 end
 
[a b] = size(K1);       
sumK = sum(K1);        
 
%寻找阈值
T=2;
myb = find(sumK>=T);        %所在的列为myb
myf = zeros(1,length(myb)); %大于阈值的列的数目

for ii = 2:length(myb)
    if myb(ii)-myb(ii-1)==1
        myb(ii-1) = 0;      %myb不为0的点位跳变的前边缘_index 
    else
        myf(ii) = myb(ii);  %myf不为0的点对应跳变的后边缘_index
    end
end
myd = find(myb~=0); %找到跳变的前边缘
MYE = myb(myd);     %对应列号
myh = find(myf~=0); %找到跳变的后边缘
myi = myf(myh);
MYB = [1 myi];
 
for ii = 1:length(MYE)
    part=sumK(1,MYB(ii):MYE(ii))
    sumP=sum(part,2)
end
 
 
count = 1;
for ii = 1:length(MYE) 
    part1=sumK(1,MYB(ii):MYE(ii))
    sumP1=sum(part1,2)
    if sumP1(1)> (chang*kuan)*0.02  
    switch count
        case 1
            axes(handles.axes9);
        case 2
            axes(handles.axes12);
        case 3
            axes(handles.axes13);  
        case 4
            axes(handles.axes14); 
        case 5
            axes(handles.axes15); 
        case 6
            axes(handles.axes16); 
         otherwise
            axes(handles.axes17); 
    end
      
      imshow(K1(:,MYB(ii):MYE(ii)));
      images_test1 = imresize(K1(:,MYB(ii):MYE(ii)),[24 12]);  
      images_test(:,count) = double(reshape(images_test1,288,1));        
     count = count+1;
     end
end
handles.testnum = images_test;
guidata(hObject, handles); 
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 字符识别
images_test_all = handles.testnum;
nnmain;
for i = 1:size(images_test_all,2) 
   images_test = double(images_test_all(:,i));
   pred(i) = predict(Theta1, Theta2, images_test');   
end
chepai = [];
for i = 1:size(pred,2)
    if pred(i)>0 
     chepai = [chepai,Name{pred(i)}];
    end
end
% chepai(1) = '苏';

set(handles.text2,'string',chepai);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% 这个按钮关闭软件
close all;
clear;
clc;
