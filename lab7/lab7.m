% image segmentation by using image labeling
%three critical statements
close all;
clear variables;
clc;
%read user input images
A=imread('Coins1.jpg');
A=rgb2gray(A);
subplot(4,4,1),imshow(A),title('original image');
B=im2bw(A);
subplot(4,4,2),imshow(B),title('Black and white image');
C=imfill(B,'holes');
subplot(4,4,3),imshow(A),title('Region Filled image');
label=bwlabel(C);
max=(max(label));
im1=(label==1);
subplot(4,4,4),imshow(im1);
subplot(4,4,5),imshow(label==10);

%manual code
for j=1:max(max(label))
    [r,c]=find(label==j);
    len=max(r)-min(r)+6;
    breadth=max(c)-min(c)+6;
    target=uint8(zeros(len,breadth));
    sy=min(c)-3;
    sx=min(r)-3;
    for i=1:size(r-1)
        x=r(i,1)-sx;
        y=c(i,1)-sy;
        target(x,y)=A(r(i,1),c(i,1));
    end
    mytitle=strcat('object number',num2str(j));
    subplot(4,4,4+j),imshow(target),title(mytitle);
end


