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
clearvars -except a;
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
Af=fftshift(A);
Aff=abs(Af);
subplot(2,3,3),imshow(uint8(Aff));
title('fft shift image after shifting');

Alow=zeros(m,n);
Ahigh=zeros(m,n);
%low pass filter realizaton
for i=1:m
    for j=1:n
        d(i,j)=sqrt((i-(m/2))^2+(j-(n/2))^2);
        if d(i,j)<=D0
            filt(i,j)=0;
        else
            filt(i,j)=1;
        end
    end
end
subplot(2,3,4),imshow((1.-filt)),title('ideal low pass filter');
B=fftshift(Alow);
B=(1.-filt).*Af;%low pass filter
B=fftshift(B);%Reshifting the image
B1=ifft2(B);%taking inverse transformation
B2=abs(B1);%taking magnitude value of the filtered image
subplot(2,3,5),imshow(B2),title('ideal low pass filterd image');
%High pass filtering
C=filt.*Af;
C=fftshift(C);%reshifting the image
C1=ifft2(C);%taking inverse transformation 
C2=abs(C1);%taking magnatude value of filtered image
subplot(2,3,6),imshow(C2),title('ideal High pass filtered image');
figure;
surf(fftshift(abs(filt)),'edgecolor','none');
%_______________Gaussian Filtering_____________
for i=1-m
    for j=1:n
        dgauss(i,j)=(exp(-((i-m/2)^2+(j-n/2)^2)/(2*D0^2)));
    end
end
Bgauss1=dgauss.*Af;
Aabs=abs(Af);
BgaussImag=dgauss.*Aabs;
BgaussI=fftshift(Bgauss1);
Bgauss1=ifft2(BgaussI);
figure,subplot(1,2,1),imshow(abs(Bgauss1)),title('Gaussian low pass filtered image');
subplot(1,2,2),imshow(B2),title('ideal low pass filtered image');

figure,subplot(1,2,1),imshow(dgauss),title('Gaussian low pass filter');
subplot(1,2,2),imshow(1-filt),title('low pass filter');

ft=fft2(filt);
figure,surf(fftshift(abs(ft)),'edgecolor','none');



%__________________Butterworth low pass filter____________
af=fftshift(fft2(a));%frequency transformation of image
lp=butterhp(a,D0,1);%DEFINE BUTTERWORTH FILTER with d0=15;
figure,imshow(af);%frequency domain image
afhp=af.*lp;%filtering in frequency domain
figure,subplot(2,3,2),imshow(af),title('frequency domain image');
subplot(2,3,3),imshow(lp),title('lowpass butterworth filter');
aflpi=ifft2(aflp);
subplot(2,3,4),imshow(aflp),title('frequency domain filtered image');
subplot(2,3,5),ifftshow(aflpi/255),title('butterworth lowpass filter');


%_______________Buttorworth high pass filter_____________
af=fftshift(fft2(a));%frequency transformation of image
hp=butterhp(a,D0,1);%DEFINE BUTTERWORTH FILTER with d0=15;
figure,imshow(af);%frequency domain image
afhp=af.*hp;%filtering in frequency domain
figure,subplot(2,3,1),imshow(a),title('original image');
subplot(2,3,2),imshow(af),title('frequency domain image');
subplot(2,3,3),imshow(hp),title('highpass butterworth filter');
aflpi=ifft2(afhp);
subplot(2,3,4),imshow(aflp),title('frequency domain filtered image');
subplot(2,3,5),ifftshow(afhpi/255),title('butterworth highpass filter');



            


