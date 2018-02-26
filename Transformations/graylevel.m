a=imread('cameraman.tif');
[m n]=size(a);
b=a;
for i=1:m
    for j=1:n
        if(a(i,j)>90 && a(i,j)<250)
            b(i,j)=0;
        else
            b(i,j)=255;
        end
    end
end

figure(1); imshow(a)
figure(2); imshow(b)