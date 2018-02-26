A=imread('circles.png');

s=strel('disk',2,0);

E=imdilate(A,s);
F=imerode(E,s);

figure,

subplot(2,1,1);

imshow(A);title('Binary Image');

subplot(2,1,2);

imshow(F);title('opened Image');
