%% Histogram extension
% author: Konrad P³onka

clear all;
close all;

%% Read image to vector
img=imread('img\histogram_extension.jpg');
img=rgb2gray(img);
%% Histogram determination
h=hist(img);

%% Looking for the lowest value of brightness in the image
for i=1:length(h)
    if h(i)~=0
        vmin=i-1;
        break
    end
end
%% Looking for the lowest value of brightness in the image
for i=-length(h):-1
    if h(abs(i))~=0
        vmax=abs(i)-1;
        break
    end
end


%% LUT table determination
imax=255;
LUT = zeros(1, 255);
for i=1:size(h,1)
    LUT(i)=floor((imax/(vmax-vmin))*(i-vmin));
end

%% Changing elements using LUT table
[numRows,numCols] = size(img);
imgNew = zeros(numRows, numCols);

for i=1:size(img,1)
    for j=1:size(img,2)
       imgNew(i,j)=LUT(img(i,j)+1);
   end
    

end


%% Results presentation
subplot(2,2,1);
imshow(img);
title('Original image','FontSize',25)

subplot(2,2,2);
hist(img);
title('Histogram of the original image','FontSize',25)


subplot(2,2,3);
imshow(uint8(imgNew));
title('Image after histogram extension','FontSize',25)

subplot(2,2,4);
hist(imgNew);
title('Histogram after histogram extension','FontSize',25)
        
 



 