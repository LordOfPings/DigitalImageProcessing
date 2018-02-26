a=imread('cameraman.tif');

b=im2double(a);
[m,n]=size(a);

%Gradient dx
L(1:m,1:n)=0;
for i=1:m-2;
    for j=1:m-2;
        L(i,j)=-1*b(i,j)+1*b(i+1,j);
    end;
end;


%Gradient dy
M(1:m,1:n)=0;
for i=1:m-2;
    for j=1:m-2;
        M(i,j)=-1*b(i,j)+1*b(i,j+1);
    end;
end;

figure;
subplot(2,2,1)
imshow(L)
title('Gradient  Gx');
subplot(2,2,2)
imshow(M)
title('Gradient  Gy');
N=L+M;
subplot(2,2,3)
imshow(N)
title('Gx + Gy');
subplot(2,2,4)
imshow(b)
title('Original Image');
[Gmag,Gdir] = imgradient(b);
figure; imshowpair(Gmag, Gdir, 'montage');