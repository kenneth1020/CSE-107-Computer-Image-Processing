function out_image = spatial_filter(image, filter)
% spatial_filter a image filter thats takes in a filter of any sizes like
% 3x3, 5x5, 7x7 etc and creating an spatial filter image output. By using  
% the given filter to calculate the out_image. By creating a 0 image2 to
% help calculate when the filter is outbounds at points like (0,0). The
% image2 grows by the filter sizes
% 
% Syntax: 
%   out_image = spatial_filter(image, filter) 
% 
% Input: 
%   image = the grayscale image to be rendered. It should be of type uint8 and have values 
%        in the range 0-255.
%   filter = any filter size that is 3x3 or odd number of NxN filter.
% 
% Output: 
%   out = the rendered binary image. It is of type uint8 and will have two values: 0 and 
%         255. 
% 
% History: 
%   Kenneth T Tran created 4/13/2022 

%testcode
%filter = [-1 0 1; -2 0 2; -1 0 1];
%filter = [-1 -2 -1 ; 0 0 0 ; 1 2 1];
%image = imread("watertower.tif");

%filter matrix can be 3x3 9x9 27x27
[r, c] = size(image);
[r2,c2] = size(filter);
out_image = double(uint8(zeros(r,c)));

%creating image boarder by zeros
float = double(image);
sides = (r2-1);

%Creating image two to be have extra row and columns dependent by the
%filter matrix sizes
r3 = r + sides;
c3 = c + sides;
image2 = double(uint8(zeros(r3,c3)));

%Reading creating a new matrix with 0 boarders depending on the filter
%size. Boarder of 0 will be equal to (row_size_of_filter - 1) / 2
for i=1+(sides/2): r+(sides/2)
    for j=1+(sides/2): c+(sides/2)
        image2(i,j) = float(i-(sides/2),j-(sides/2)); 
    end
end

h = double(uint8(zeros(r2,c2)));
%Reading the image center away from the zero boarders. Then applied the
%filter
for x=1+(sides/2): r+(sides/2)
    for y=1+(sides/2):c+(sides/2)
        %filtering with in a double loop
        for i=1:r2
            for j=1:c2
                %filtering the image at certain square
                h(i,j) = filter(i,j)* double(image2(x+i-sides,y+j-sides));
            end
        end
        %Sum the filter to get filter pixel value then put into the output
        %image
        value = sum(h,"all");
        out_image(x-(sides/2),y-(sides/2)) = value;
    end
end

%Testing output image
%figure("Name","Image filter")
%imshow(out_image);
end