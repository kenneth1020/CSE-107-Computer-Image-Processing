function out_gradient = gradient_magitude(in)
%GRADIENT_MAGITUDE Calls the spatial filter to create a single gradient
%magitude image. Using its own filter, the filter use is Sobel masks. A 3x3
% masks in the y and x axis direction. The taking the two image masks in y
% and x direction. Exponent by 2 of both image. Add them together then
% sqaure root to get the Gradient image
%
% Syntax: 
%   out_gradient = gradient_magitude(in) 
% 
% Input: 
%   in = the grayscale image to be rendered. It should be of type uint8 and have values 
%        in the range 0-255.
% 
% Output: 
%   out_gradient = a gradient image combination of Sobel masks of x and y
%   axis of the input image
% 
% History: 
%   Kenneth T Tran created 4/13/2022

gy = [-1 0 1; -2 0 2; -1 0 1];
gx = [-1 -2 -1 ; 0 0 0 ; 1 2 1];
gy2 = spatial_filter(in, gy);
gx2 = spatial_filter(in, gx);

grad_x = conv2(double(in), double(gx),'same');
grad_y = conv2(double(in), double(gy),'same');
figure("Name","Grad X");
imshow (grad_x);
figure("Name", "Grad Y");
imshow (grad_y);
%out_gradient = sqrt(grad_x.^2 + grad_y.^2);

out_gradient = sqrt(gx2.^2+gy2.^2);

out_gradient = uint8(out_gradient);

%figure("Name","Gradient Magitue");
%imshow(out_gradient);


end

