f=rgb2gray(imread('tree.png'));
[g1,SI1]=graycomatrix(f,'G',[]);
status1=graycoprops(g1);
f=filter2(fspecial('average',round(min(size(f))/8)),f);
imshow(uint8(f));
[g2,SI2]=graycomatrix(f,'G',[]);
status2=graycoprops(g2);