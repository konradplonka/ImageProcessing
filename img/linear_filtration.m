%% Linear filtration
% author: Konrad P³onka

clear all;
close all;

%% Read image to vector
img=imread('img\linear_filtration.jpg');
img=double(rgb2gray(img));

windowSize=5;
%windowSize=3(3x3)
%windowSize=5(5x5)
%windowSize=7(7x7)

%% Resizing image
if windowSize==3
    imgPow=resizeImageWindowSize3x3(img);
    o=1;
end
if windowSize==5
    imgPow=resizeImageWindowSize5x5(img);
    o=2;
end
if windowSize==7
    imgPow=resizeImageWindowSize7x7(img);
    o=3;
end


%% Image processing
c=1;
sum=0;
 for i=1+o:size(img,1)-o
     for j=1+o:size(img,2)-o
         for n=i-o:i+o
             for m=j-o:j+o
                 sum=sum+img(n,m);
               
             end
         end
         imgNew(i-o,j-o)=sum/windowSize^2;
         sum=0;
         
    end 
end

%% Results presentation
subplot(1,2,1)
imshow(uint8(img))
title('Original image','FontSize',25)
subplot(1,2,2)
imshow(uint8(imgNew))
str = sprintf('After filtration image using window size %ix%i', windowSize,windowSize);
title(str,'FontSize',25)



