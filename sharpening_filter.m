%% Sharpening filter
% author: Konrad P³onka

clear all;
close all;

A=imread('14.jpg');
A=rgb2gray(A);
A=double(A);
F1=[-1 -1 -1 -1 9 -1 -1 -1 -1]; % Sharpening filter mask 1
F2=[0 -1 0 -1 5 -1 0 -1 0]; % Sharpening filter mask 2
F3=[0 -1 0 -1 4 -1 0 -1 0]; % Laplace filter 1 (edge detection)
F4=[-1 -1 -1 -1 8 -1 -1 -1 -1]; %Laplace filter 2

iteration=1;
for i=2:size(A,1)-1
    for j=2:size(A,2)-1
        for n=i-1:i+1
            for m=j-1:j+1
                number(iteration)=A(n,m);
                iteration=iteration+1;
            end
        end
        
        G(i-1,j-1)=sum(F3.*number);
        clear number;
        iteration=1;
    end
   
    
end
subplot(1,2,1)
imshow(uint8(A))
title('Original photo','FontSize',25)
subplot(1,2,2)
imshow(uint8(G))
title('After processing', 'FontSize',25);
