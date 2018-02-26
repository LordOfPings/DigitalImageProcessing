a = imread('cameraman.tif');
a = im2double(a);
for c=0:5
g = c*log(1+a);
figure,imshow(g);
end
figure,imshow(a);