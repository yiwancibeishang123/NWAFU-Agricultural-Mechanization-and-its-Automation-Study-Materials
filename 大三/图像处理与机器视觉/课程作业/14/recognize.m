function Rer=Re()

I=imread('selfie.jpg');

O=rgb2ntsc(I);
G=O(:,:,2);
[m n]=size(G);
U=zeros(m,n);
for i=1:m
   for j=1:n
     if G(i,j)>0.03&&G(i,j)<0.16
        U(i,j)=1;
     end
   end
end
Rer=1;
sr=strel('disk',6);%%创建结构元素
C=imclose(U,sr);
L=bwlabel(C);
B=regionprops(L,'area');
Se=[B.Area];
Sm=max(Se);
if Sm>m*n/27       
  B1=bwareaopen(C,Sm);
  k_y1=m;k2=m;l2=n;
  for i=1:m
    if any(B1(i,:))==1
       k_y1=i;
       break
    end
  end
  for i=k_y1:m
    if B1(i,:)==0
      k2=i;
      break
    end
  end
  for j=1:n
    if any(B1(:,j))==1
      l_y1=j;
      break
    end
  end
  for j=l_y1:n
    if B1(:,j)==0
      l2=j;
      break
    end
  end
  k_y=k2-k_y1;
  l=l2-l_y1;
  if k_y>.5*l&&k_y<3*l   
    I1=imcrop(B1,[l_y1 k_y1 l .4*k_y]);
    [n1 m1]=size(I1);
     L1=bwlabel(I1);
     E=regionprops(L1,'area');
     Si=[E.Area];
     Sm=max(Si);
    if Sm/(n1*m1)>.3
       B2=bwareaopen(I1,floor(.5*Sm));
       g_y1=m1;
       g2=m1;
       for j=1:m1
          if any(B2(:,j))==1
             g_y1=j;
             break
          end
       end
       for j=g_y1:m1
           if B2(:,j)==0
              g2=j;
              break
           end
       end
       g=g2-g_y1;
       figure;
       imshow(I,'border','tight','InitialMagnification','fit');
       hold on
       h1=line([l_y1+g_y1,l_y1+g_y1+g],[k_y1,k_y1]);
       h2=line([l_y1+g_y1+g,l_y1+g_y1+g],[k_y1,k_y1+1.1*g]);
       h3=line([l_y1+g_y1+g,l_y1+g_y1],[k_y1+1.1*g,k_y1+1.1*g]);
       h4=line([l_y1+g_y1,l_y1+g_y1],[k_y1+1.1*g,k_y1]);
       h=[h1 h2 h3 h4];
       set(h,'Color',[1 0 0],'LineWidth',3);
       gfframe=getframe(gcf);
       gffim=frame2im(gfframe);
       imwrite(gffim,'recg_result.jpg','jpg'); %%%%存储图片命名,为了保存画红框的图片
       Rer=1;
       %fid=fopen('re.txt','w');
       %fprintf(fid,'%d',Rer);
       %fclose(fid);
    else%%%未能满足最近一个if判断，不能识别人脸
      figure;
      imshow(I);
      imwrite(I,'face_result.jpg','jpg'); %%%%存储图片命名
      Rer=2;
      %fid=fopen('re.txt','w');
      %fprintf(fid,'%d',Rer);
      %fclose(fid);
    end
  else
      figure;
      imshow(I);
      imwrite(I,'face_result.jpg','jpg'); %%%%存储图片命名
      Rer=3;
      %fid=fopen('re.txt','w');
      %fprintf(fid,'%d',Rer);
      %fclose(fid);
  end
else
  figure;
  imshow(I);
  imwrite(I,'face_result.jpg','jpg'); %%%%存储图片命名
  Rer=4;
  %fid=fopen('re.txt','w');
  %fprintf(fid,'%d',Rer);
  %fclose(fid);
end
end
