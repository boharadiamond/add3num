%title: to study the variables point operation for the image enhancement.

close;
clear;
clc;
%reading and displaying an image
img=imread('lina.png');
img1=rgb2gray(img);
figure;
subplot(2,2,1),imshow(img),title('original image');
subplot(2,2,2),imshow(img1),title('gray scale image');

%Digital negative operation 
S=255-img; %formula for digital Negative S=L-1-r
subplot(2,2,3),imshow(S),title('Negative lina image');%display the image
S1= 255-img1; %formula for digital Negative S=L-1-r
subplot(2,2,4),imshow(S1),title('Negative Gray scale lina image');%display the image
theta=100;
img1=imread('lina.png');
img1=rgb2gray(img1);
figure;
subplot(3,1,1),imshow(img1),title('original image');
[r,c]=size(img1);
S=zeros(r,c);

for i =1:r
    for j=1:c
        if(img(i,j)<theta)
            S(i,j)=1;%Bright Bcakground
        else
            S(i,j)=0;%Dark Object
        end
    end
end
subplot(3,1,2),imshow(S),title('Dark object with Bright Background');

S=zeros(r,c);

for i =1:r
    for j=1:c
        if(img(i,j)<theta)
            S(i,j)=0;%Dark Bcakground
        else
            S(i,j)=1;%Bright Object
        end
    end
end
subplot(3,1,3),imshow(S),title('Bright object with Dark Background');

%Intensity Level Slicing
%Without Preserving Background
x=imread('lina.png');
x=rgb2gray(x);
[h,w]=size(x);
a=input('enter the value for a: ');
b=input('enter the value for b: ');
y=x;
for i=1:h
    for j=1:w
        if x(i,j)>=a && x(i,j)<=b
            y(i,j)=255;%S=T(r)=L-1 for r <a and r>b
            
        else
            y(i,j)=10;%S=T(r)=C, otherwise
        end
    end
end
figure,subplot(3,1,1),imshow(x), title('Original Image');
subplot(3,1,2),imshow(y),title('Intensity Sliced Image without Preserving Background');
%with preserving background
for i=1:h
    for j=1:w
        if x(i,j)>=a && x(i,j)<=b
            y(i,j)=255;%S=T(r)=L-r for r <a and r>b
            
        else
            y(i,j)=x(i,j);%S=T(r)=r, otherwise
        end
    end
end

subplot(3,1,3),imshow(y),title('Intensity Sliced Image with Preserving Background');

        
        
       

