
Img = imread('cameraman.tif');
A = imnoise(Img,'Gaussian',0.04,0.003);
%Image with noise
figure,imshow(A);
I = double(A);

%Standard Deviation
sigma1 = 1.76;
sigma2 = 0.5;
%Window size
sz = 4;
[x,y]=meshgrid(-sz:sz,-sz:sz);

M = size(x,1)-1;
N = size(y,1)-1;
Exp_comp = -(x.^2+y.^2)/(2*sigma1*sigma1);
Kernel= exp(Exp_comp)/(2*pi*sigma1*sigma1);
Exp_comp2 = -(x.^2+y.^2)/(2*sigma2*sigma2);
Kernel2= exp(Exp_comp2)/(2*pi*sigma2*sigma2);

Output=zeros(size(I));

I = padarray(I,[sz sz]);

%Convolution
for i = 1:size(I,1)-M
    for j =1:size(I,2)-N
        Temp = I(i:i+M,j:j+M).*Kernel;
        Output(i,j)=sum(Temp(:));
    end;
end;
for i = 1:size(I,1)-M
    for j =1:size(I,2)-N
        Temp2 = I(i:i+M,j:j+M).*Kernel2;
        Outputb(i,j)=sum(Temp2(:));
    end;
end;

DoG = Output-Outputb;
DoG = uint8(DoG);
figure,imshow(DoG);