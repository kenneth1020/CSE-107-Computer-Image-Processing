function h = compute_histogram(inputImage)
%COMPUTE_HISTOGRAM Reading the inputImage and reading its all image pixel
%intensity and creating a PMF (probabilty mass function). Ranging from
%values of 0-255. 
%
% Syntax: 
%   h = histogram(inputImage)
% 
% Input: 
%   inputImage= The dark or light unequalize image into histogram. 
% 
%
% Output: 
%   h = a PMF(probabilty mass function) ranging of 0-255. When add all
%   value should equal to 1.
%
% 
%History:
%   Kenneth T Tran 3/30/2022 created

%Read in image sizes
[x, y] = size(inputImage);
%Creating matrix variables into double to read
float = double(inputImage);
%Create the array histogram filled with zeros 255 values
h =zeros(1,256);

%Reading in the matrix 
for m=1:x
    for n=1:y
        %Getting the index value from the image intensity ranging 0-255
        index = float(m,n)+1;
        %Getting the h(index) count of freqency these pixel value occur
        value = h(1,index);
        %increaing by incrementing 1 every time these intensity occur
        h(1,index) = value +1 ;  
    end %End of n
end %End of m
%Pixel occurs at the values divde by image dimension x*y
%Creating the PMF (probabilty mass function)
h = h/(x*y);

end%end of function

