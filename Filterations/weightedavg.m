
A = imread('board.tif');
A = rgb2gray(A);
figure,imshow(A),title('ORIGINAL IMAGE');
 
f = [1,2,1;
      2,4,2;
      1,2,1];
  
mf = f/16;

modifyA=padarray(A,[1 1],'replicate');
B=zeros(size(A));


        for x=1:size(A,1)
            for y=1:size(A,2)
                modifyA(x+1,y+1)=A(x,y);
            end
        end
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
        sum = 0;
        for x=1:3
            for y=1:3
                val = mf(x,y) * modifyA(i+x-1,j+y-1);
                sum = sum + val;
            end
        end
        B(i,j)=sum;
    end
end
B=uint8(B);
figure,imshow(B),title('IMAGE AFTER WEIGHTED AVG FILTERING');