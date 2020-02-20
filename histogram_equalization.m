%% Histogram equalization
% author: Konrad P³onka

clear all;
close all;

%% Read image to vector
img=imread('img\histogram_equalization.jpg');
img=rgb2gray(img);

%% Image before processing
subplot(2,2,1);
imshow(img);
title('Original image','FontSize',25)

subplot(2,2,2);
hist(img);
title('Histogram of the original image','FontSize',25)

%% Histogram determination
h=imhist(img);

length_h=length(h);


sum=h(1);
D(1)=h(1)/(size(img,1)*size(img,2));

%% Calculating cumulative distribution function
for n=2:length_h %obliczanie dystrybuanty
         sum=sum+h(n);
        D(n)=sum/(size(img,1)*size(img,2));
        
end

%% Searching for the first nonzero distribution value
for i=1:size(D)
    if D(i)~= 0
        D0=D(i);
    end
end


%% LUT determination
for i=1:size(h,1)
    LUT(i)=floor(((D(i)-D0(1))/(1-D0(1)))*(length_h-1));
end

%% Changing values using LUT table
for i=1:size(img,1) 
    for j=1:size(img,2)
       img(i,j)=LUT(img(i,j)+1);
   end
    

end

subplot(2,2,3);
imshow(img);
title('Image after histogram equalization','FontSize',25)

subplot(2,2,4);
hist(img);
title('Histogram after equalization', 'FontSize',25)




