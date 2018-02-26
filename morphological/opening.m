A=imread('circles.png');

s=strel('disk',2,0);

F=imerode(A,s);
E=imdilate(F,s);

figure,

subplot(2,1,1);

imshow(A);title('Binary Image');

subplot(2,1,2);

imshow(E);title('opened Image');
