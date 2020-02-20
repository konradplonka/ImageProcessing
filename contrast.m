
%% Contrast changing
% author: Konrad P³onka

clear all;
close all;

%% Read image to vector
img=imread('img\contrast.jpg');
img=rgb2gray(img);

%% Histogram determination
h=hist(img);

%% LUT determination
a=2; % directional coefficient
    
for i=0:255
    k=i+1;
        if ((a*(i-127)+127) > 255)
            LUT(k) = 255;
        elseif ((a*(i-127)+127) < 0)
            LUT(k) = 0;
        else
            LUT(k) = a*(i-127)+127;
        end
end


%% Changing elements using LUT
for i=1:size(img,1)
    for j=1:size(img,2)
       imgNew(i,j)=LUT(img(i,j)+1);
    end
end
    
%% Results
subplot(1,2,1)
imshow(uint8(img))
title('Original image','FontSize',25)
subplot(1,2,2)
imshow(uint8(imgNew))
title('Image after contrast changing','FontSize',25)





    


