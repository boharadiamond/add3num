function im=Thresholding(I)
[r,c]=size(I);
im=zeros(r,c);
for i=1:c
    for j=1:r
        %thresholding
        if I(i,j)>100
            im(i,j)=1;
        else
            im(i,j)=0;
        end
    end
end
im=bwareaopen(im,5);
im=imfill(im,'holes');
end
