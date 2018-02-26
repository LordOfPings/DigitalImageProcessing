a = imread('coins.png');
a = im2double(a);
imshow(a);
figure,imhist(a);

pd = makedist('Normal','mu',0,'sigma',1);
L = pdf(pd,a);
imshow(L);
imhist(L);
minGrayLevel = min(L(:));
maxGrayLevel = max(L(:));
threshold = (minGrayLevel + maxGrayLevel)/2;

[row,column] = size(L);
for i=1:row;
      for j=1:column;
          if L(i,j)>threshold
              L(i,j)=1;
          else
              L(i,j)=0;
          end
      end
end
figure, imshow(L);
figure, imhist(L);
