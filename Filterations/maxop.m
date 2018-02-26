A = imread('board.tif');
A = rgb2gray(A);
figure,imshow(A),title('ORIGINAL IMAGE');

B=zeros(size(A));

modifyA=padarray(A,[1 1],'replicate');

        x=[1:3];
        y=[1:3];
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
       window=reshape(modifyA(i+x-1,j+y-1),[],1); 
       B(i,j)=max(window);
   
    end
end
B=uint8(B);
figure,imshow(B),title('IMAGE AFTER MAX FILTERING');