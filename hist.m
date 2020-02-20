function histogram=hist(img)
histogram=zeros(256,1);

height=size(img,1);
width=size(img,2);
for i=1:height
    for j=1:width
        for l=1:256
            if img(i,j)==l-1
                histogram(l)=histogram(l)+1;
            end
            
        end
    end
    
end
graph=bar(0:size(histogram,1)-1,histogram,0.2,'b');
axis([0 255 0 inf])
xlabel('Warto�ci jasno�ci [0,255]');
ylabel('Liczba punkt�w o danej jasno�ci');
end