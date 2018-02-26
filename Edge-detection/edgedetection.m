clc;
close all;
clear all;
a = imread('cameraman.tif');

b=im2double(a);
[m,n]=size(a);

%ROBERT
L(1:m,1:n)=0;
for i=1:m-2;
    for j=1:m-2;
        L(i,j)=-1*b(i,j)+0+0+1*b(i+1,j+1);
    end;
end;



M(1:m,1:n)=0;
for i=1:m-2;
    for j=1:m-2;
        M(i,j)=0-1*b(i,j+1)+1*b(i+1,j)+0;
    end;
end;

figure;
subplot(2,2,1)
imshow(L)
title('Robert    Gx');
subplot(2,2,2)
imshow(M)
title('Robert    Gy');
N=M+L;
subplot(2,2,3)
imshow(N)
title('Robert    Gx+Gy');
subplot(2,2,4)
imshow(b)
title('Original Image');



%PREWIT
N(1:m,1:n)=0;
for i=1:m-2;
    for j=1:m-2;
        N(i,j)=-1*b(i,j)-1*b(i,j+1)-1*b(i,j+2)+0+0+0+1*b(i+2,j)+1*b(i+2,j+1)+1*b(i+2,j+2);
    end;
end;
O(1:m,1:n)=0;
for i=1:m-2;
    for j=1:m-2;
        O(i,j)=-1*b(i,j)+0+1*b(i,j+2)-1*b(i+2,j)+0+1*b(i+1,j+2)-1*b(i+2,j)+0+1*b(i+2,j+2);
    end;
end;
figure;
subplot(2,2,1)
imshow(N)
title('Prewit    Gx');
subplot(2,2,2)
imshow(O)
title('Prewit    Gy');
Z=N+O;
subplot(2,2,3)
imshow(Z)
title('Prewit    Gx+Gy');
subplot(2,2,4)
imshow(b)
title('Original Image');

%SOBEL
P(1:m,1:n)=0;
for i=1:m-2;
    for j=1:m-2;
        P(i,j)=-1*b(i,j)-2*b(i,j+1)-1*b(i,j+2)+0+0+0+1*b(i+2,j)+2*b(i+2,j+1)+1*b(i+2,j+2);
    end;
end;


R(1:m,1:n)=0;
for i=1:m-2;
    for j=1:m-2;
        R(i,j)=-1*b(i,j)+0+1*b(i,j+2)-2*b(i+1,j)+0+2*b(i+1,j+2)-1*b(i+2,j)+0+1*b(i+2,j+2);
    end;
end;

 figure;
subplot(2,2,1)
imshow(P)
title('Sobel    Gx');
subplot(2,2,2)
imshow(R)
title('Sobel   Gy');

Y=P+R;
subplot(2,2,3)
imshow(Y)
title('Soble  Gx+Gy');
subplot(2,2,4)
imshow(b)

title('Original  Image');
