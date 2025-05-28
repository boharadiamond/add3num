%______________________Contrast Filtering________________________
a=imread('cameraman.jpg');
c1=im2double(a);
[r,c]=size(a);
s=c1;
x1=input('Enter the value of r1:');
y1=input('Enter the value of s1:');
x2=input('Enter the value of r2:');
y2=input('Enter the value of r2:');

slope =y1/x1;
slope1 =(y2-y1)/(x2-x1);
slope2 =(255-y2)/(255-x2);

inter1=y1-slope*x1;
inter2=y2-slope*x2;

for i=1:r
    for j=1:c
        if(c1(i,j)<x1)
            s(i,j)=c1(i,j)*slope;
        else
            if(c1(i,j)>x1 && c1(i,j)<x2)
            s(i,j)=slope1*c1(i,j)+inter1;
        else
            s(i,j)=slope2*c1(i,j)+inter2;
            end
        end
     
    end
end

figure;subplot(1,2,1),imshow(a),title('original image');
subplot(1,2,2),imshow(s),title('image after stretching');

        

            

