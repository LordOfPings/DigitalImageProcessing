a=imread('cameraman.tif');
[r,c]=size(a);
L = 256;
k = 80;

p=zeros(1,L);

%—–Step 1———-Computing Histogram-————————–
for level=1:1:L
for i=1:1:r
for j=1:1:c
if(a(i,j)==level)
p(level)=p(level)+1;
end
end
p(level) = p(level);
end
end
p1 = zeros(1,L);
p2 = zeros(1,L);
m1 = zeros(1,L);
m2 = zeros(1,L);
var = zeros(1,L);
temp=0;
temp2 = 0;
temp3 = 0;
temp4 = 0;

%—–Step 2—————-p1 calculation-————————–
for thresh=1:k
for ite= 1:thresh
temp=temp+p(ite);
end
p1(thresh)=temp;
temp=0;
end

%—–Step 2————–p2 calculation—————————–
for thresh2 = k+1: L
for i = thresh2:L

temp2 = temp2 + p(i);
end
p2(thresh2)=temp2;
temp2=0;
end

%——-Step 3————-m1 calculation—————————-
for thresh3 =1:k
for i =1:thresh3
temp3 = temp3 + i* p(i);
end
m1(thresh3) = temp3/p1(thresh3);
end

%——-Step 3———-m2 calculation———————————–
for thresh4 =k+1:L
for i =thresh4:L
temp4 = temp4 + i* p(i);
end
m2(thresh4) = temp4/p2(thresh4);
end

%——–Step 4———Global mean value calculation ———————

mg = p1(k)*m1(k)+p2(k)*m2(k);

%———-Step 5—–Between Class Variance ——————————
for v =1:L
var(v) = ( p1(v)*(m1(v)-mg)^2 )+( p2(v)*(m2(v)-mg)^2 );
end

%—–Step 6——–finidng max var(k*)—————————–

[maxNum, IndexofMaxNum] = max(var);
threshold = max(var)
output=a;
for i=1:r
for j=1:c
if output(i,j) >IndexofMaxNum
output(i,j)=255;
else
output(i,j)=0;
end
end
end

subplot(1,3,1)
imshow(a);
title('Orignal Image');
subplot(1,3,2)
stem(p);
title('Histogram');
subplot(1,3,3)
title('Output Image');
imshow(output);