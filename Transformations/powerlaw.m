a= imread('cameraman.tif');
a= im2double(a);
c = 1;
y=input('Gamma value:'); 
[m,n]=size(a);
for i=1:m
for j=1:n
s(i,j)=1*(a(i,j)^y);
end
end
figure,imshow(a);
figure,imshow(s);

