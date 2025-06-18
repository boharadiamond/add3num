%lab 4
%Title : To demonstrate filtering by using frequency domain transformation
close all;
clear variables;
clc;
%________________reading an image_____________
[file,path]=uigetfile('','');
f1=fullfile(path,file);
if prod(double(file)==0) && prod(double(path)==0)
    return;
end
a=imread(f1);
imshow(a);
%_____________________Image to be transformed_____________
clearvars -xcept a;
if (size(size(a),2)==3)
    a=rgb2gray(a);
end
a=im2double(a);
figure;subplot(2,3,1),imshow(a),title('original image');
[m,n]=size(a);
out=strcat('the size of imageis: ',num2str(m),'*', num2str(n));
disp(out);
maxallowed=min(m,n)/2;
D0=input(['enter cutoff frequency (A number less than',num2str(maxallowed),'):']);
A=fft2(a);%fourrier transformation of a
subplot(2,3,2),imshow(uint8(abs(A)));
title('FFT OF ORIGINAL IMAGE without shifting');
