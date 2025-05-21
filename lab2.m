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
%Bit plane slicing
x=imread('lina.png');
x=rgb2gray(x);
id=double(x);
c0=mod(id,2);
c1=mod(floor(id/2),2);
c2=mod(floor(id/4),2);
c3=mod(floor(id/8),2);
c4=mod(floor(id/16),2);
c5=mod(floor(id/32),2);
c6=mod(floor(id/64),2);
c7=mod(floor(id/128),2);
figure,imshow(x),title('original image');
figure;
subplot(3,3,1),imshow(c0),title('Bit Plane 0');
subplot(3,3,2),imshow(c1),title('Bit Plane 1');
subplot(3,3,3),imshow(c2),title('Bit Plane 2');
subplot(3,3,4),imshow(c3),title('Bit Plane 3');
subplot(3,3,5),imshow(c4),title('Bit Plane 4');
subplot(3,3,6),imshow(c5),title('Bit Plane 5');
subplot(3,3,7),imshow(c6),title('Bit Plane 6');
subplot(3,3,8),imshow(c7),title('Bit Plane 7');
recon=2*(2*(2*(2*(2*(2*(2*c7+c6)+c5)+c4)+c3)+c2)+c1)+c0;
subplot(3,3,9),imshow(uint8(recon)),title('Reconstricted image');

%___________________________________________________
%____________________Power Transformation _________________
a=imread('lina.png');
a=rgb2gray(a);
c=im2double(a);
s=c;
s1=c;
factor=220;
[h,w]=size(a);
for i=1:w
    for j=1:w
        s(i,j)=factor*log(1+c(i,j));%log transformation
        s1(i,j)=factor*c(i,j)^(1/2);%power transformation
    end
end
figure;subplot(3,1,1),imshow(a),title('original image');
subplot(3,1,2),imshow(s/255),title('image after blog transformation');
subplot(3,1,3),imshow(uint8(s1)),title('image after power transformation');

    






        
       

