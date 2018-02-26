GIm=imread('cameraman.tif');
camera = imread('cameraman.tif');
numofpixels=size(GIm,1)*size(GIm,2);
figure,imshow(GIm);
title('Original Image');
HIm=uint8(zeros(size(GIm,1),size(GIm,2)));
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);

%to calculate threshold by finding mean
histog=hist(double(camera),256);
histograms=sum(histog');
figure(2);plot(histograms,'r');title('image-graph');
locmax=find(histograms==max(histograms));
T=zeros(1,256);
for hi=1:256
 T(hi)=histograms(hi)*(hi-locmax)^2;
end
locmaxx=find(T==max(T));
treshold=(locmax+locmaxx)/2
camera(camera<treshold)=0;
camera(camera>=treshold)=1; 
figure(3);colormap('gray'); imagesc(camera);title('threshold image'); 

%freq counts the occurrence of each pixel value.
%The probability of each occurrence is calculated by probf.
for i=1:size(GIm,1)
    for j=1:size(GIm,2)
        value=GIm(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/numofpixels;
    end
end
sum=0;
no_bins=255;

%The cumulative distribution probability is calculated. 
for i=1:size(probf)
   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/numofpixels;
   output(i)=round(probc(i)*no_bins);
end
for i=1:size(GIm,1)
    for j=1:size(GIm,2)
            HIm(i,j)=output(GIm(i,j)+1);
    end
end
figure,imshow(HIm);
title('Histogram equalization');

%The result is shown in the form of a table
figure('Position',get(0,'screensize'));
dat=cell(256,6);
for i=1:256
dat(i,:)={i,freq(i),probf(i),cum(i),probc(i),output(i)};   
end
columnname =   {'Bin', 'Histogram', 'Probability', 'Cumulative histogram','CDF','Output'};
columnformat = {'numeric', 'numeric', 'numeric', 'numeric', 'numeric','numeric'};
columneditable =  [false false false false false false];
t = uitable('Units','normalized','Position',...
            [0.1 0.1 0.4 0.9], 'Data', dat,...
            'ColumnName', columnname,...
            'ColumnFormat', columnformat,...
            'ColumnEditable', columneditable,...
            'RowName',[]); 
    subplot(2,2,2); bar(GIm);
    title('Before Histogram equalization');
    subplot(2,2,4); bar(HIm);
    title('After Histogram equalization');
   
