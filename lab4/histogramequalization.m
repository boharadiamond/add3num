%To study about contrast streatching and basic histogram properties of
%image

%__________________histogram equalization__________________________
a=imread('cameraman.jpg');
c1=im2double(a);
[r,c]=size(a);

%________________basic type of histogram________________
a=a-50;
figure;subplot(4,2,1),imshow(a),title('original image');
subplot(4,2,2),imhist(s),title('histogram of original image');
b=a-80;%reducing the pixel intensity

subplot(4,2,3),imshow(b),title('dark image');
subplot(4,2,4),imhist(b),title('histogram of dark image');


b=a+80;%increasing the pixel intensity

subplot(4,2,5),imshow(b),title('bright image');
subplot(4,2,6),imhist(b),title('histogram of bright image');

k=a;
for i=1:r
    for j=1:c
        if(a(i,j)<100)
            k(i,j)=a(i,j)+100;
        elseif(a(i,j)>200)
            k(i,j)=a(i,j)-55;
        end
     
    end
end

figure;subplot(4,2,7),imshow(a),title('low contrast image');
subplot(4,2,8),imhist(k),title('histogram of low contrast image');


%_________________________equalization with builtin function____________

a=imread('lina.png');
a=rgb2gray(a);
out1=histeq(a);
subplot(1,3,1),imshow(out1),title('equalized image');
subplot(1,3,2),imhist(out1),title('histogram of equalized image');
subplot(1,3,3),imshow(a),title('original image');



