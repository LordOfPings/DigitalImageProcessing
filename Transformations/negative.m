a= imread('cameraman.tif');
[m,n]=size(a);
for i=1:m
for j=1:n
s(i,j)=256-1-a(i,j);
end;
end;
figure,imshow(a);
figure,imshow(s);
