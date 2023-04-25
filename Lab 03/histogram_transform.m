function T = histogram_transform(inputH)
%HISTOGRAM_TRANSFORM transform the image of the histogram. By grabbing the
%computed histogram as inputH and summation of values 0-255. Each slowly
%taking in i amount of number in the array of 255. Then times who array by
% 255. Creating an array of transform intensity value of each pixel for 
% equalization.
%
% Syntax: 
%   T = histogram_transform(inputH)
% 
% Input: 
%   inputH = an array frequency of intensity value from 0-255. The values is 
% How many pixels with that value divide by the pixels MxN size. 
% 
%
% Output: 
%   T = an equalizes value of 0-225 going from lowest to highest. This is 
% going be used to equalizes an images. Represent each value of T repesent
% a value of pixel intensity that will transform the input image 
% pixel value using its intensity as an index for T.
%
%History:
%   Kenneth T Tran 3/30/2022 created

%Reutrn a leagth 256 vector T which represents the transformation function
%for histogram equalizations.
T =zeros(1,256);
float = double(inputH);

% Y has cumulative frequency 0-1
% X has pixel intensity 0-255
% all intenisty together being accumlative making a graph of 0-1
%Times it by 255 and round it off. Having a increasing intensity graph
%ranging from 0-255
for i=1:256
        T(i) = round(255*sum(float(1:i)));
end


