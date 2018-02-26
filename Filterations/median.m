A = imread('board.tif');
A = rgb2gray(A);
figure,imshow(A),title('ORIGINAL IMAGE');

modifyA=padarray(A,[1 1],'replicate');
B=zeros(size(A));


        for x=1:size(A,1)
            for y=1:size(A,2)
                modifyA(x+1,y+1)=A(x,y);
            end
        end

for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
        window=zeros(9,1);
        inc=1;
        for x=1:3
            for y=1:3
                window(inc)=modifyA(i+x-1,j+y-1);
                inc=inc+1;
            end
        end
       
        med=sort(window);
        
        B(i,j)=med(5);
    end
end
B=uint8(B);
figure,imshow(B),title('IMAGE AFTER MEDIAN FILTERING');