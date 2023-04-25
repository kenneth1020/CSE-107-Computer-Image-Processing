function out = find_edges(in,threshold)
%finds_edges calling the gradient images to filter out the image pixel
%values. Using the threshold. Whatever value is above the threshold will be
% (255) or white. Anything below the threshold will be black or (0)
%
% Syntax: 
%   out = find_edges(in, threshold) 
% 
% Input: 
%   in = the grayscale image to be rendered. It should be of type uint8 and have values 
%        in the range 0-255.
%   threshold = containing a value of 0-255 to filter out the edges of the
%   images
%
% Output: 
%   out = a image that is has pixels value of 0 or 255. Showing the images
%   edges and outlines in white
% 
% History: 
%   Kenneth T Tran created 4/13/2022

[r ,c] = size(in);
out = double(uint8(zeros(r,c)));

%threshold anything above 200 will be white and lower will be dark.
g = gradient_magitude(in);

for x=1: r
    for y=1: c
         value = double(g(x,y));
         if value > threshold
             out(x,y) = 255;
         else
             out(x,y) = 0;
         end
    end
end
%figure("Name", "Edge")
%imshow(out);

end

