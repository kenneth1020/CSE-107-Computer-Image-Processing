function plot_histogram(inputH)
%PLOT_HISTOGRAM Taking in any histrogram and put them into a graph. X value
%represent the pixel intensity range. The Y value display the PMF 
% (probabilty mass function)
%
% Syntax: 
%   plot_histogram(inputH)
% 
% Input: 
%   image= The dark or light unequalize image into histogram. 
% 
%
% Output: 
%   Nothing should be output. Only display a graph of the histrogram
%
%History:
%   Kenneth T Tran 3/30/2022 created

bar(inputH,"blue")
xlabel("Intensity Value")
ylabel("PMF")
end

