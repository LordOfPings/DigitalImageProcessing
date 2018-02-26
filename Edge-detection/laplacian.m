%Input Image
A=imread('cameraman.tif');
%Preallocate the matrices with zeros
I1=A;
I=zeros(size(A));
I2=zeros(size(A));

%Filter Masks

F1=[0 1 0;1 -4 1; 0 1 0];
F2=[1 1 1;1 -8 1; 1 1 1];

%Padarray with zeros
B=padarray(A,[1,1]);
B=double(A);

%Implementation of the equation in Fig.D
for i=1:size(B,1)-2
    for j=1:size(B,2)-2
       
        I(i,j)=sum(sum(F1.*B(i:i+2,j:j+2)));
        K(i,j)=sum(sum(F2.*B(i:i+2,j:j+2)));
    end
end
I=uint8(I);K=uint8(K);
figure;
subplot(2,2,1)
imshow(I)
title('Laplacian Normal');
subplot(2,2,2)
imshow(K)
title('Laplacian Diagonal');
subplot(2,2,3)
imshow(A)
title('Original Image');