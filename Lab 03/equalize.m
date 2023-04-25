function out_image = equalize(inputImage)
%EQUALIZE inputImage that needs to be equalized calling using functions of:
% 1. compute_histogram
% 2. histrogram_transform
% 3. plot_histogram
% Taking the input image then transforming into a equalize image. The function will
% show the Mean and Standard deviation of the Orignal and Equalized. Also
% displaying a bar graph of the histogram of Orignal and Equalize Image.
%
% Syntax: 
%  out_image = equalize(inputImage)
% 
% Input: 
%   inputImage = The dark or light unequalize image that needs to equalize 
% 
%
% Output: 
%   out_image = produces a well balance equalize image.
%   Gives out Histrogram graph and display information mean and standard
%   deviation of both inputImage and out_image
%
%History:
%   Kenneth T Tran 3/30/2022 created

%reads in input image and make it into a double
in = double(inputImage);

%Display mean and standard deviations of the input image and print it out
%in terminal
M = mean(in,"all");
S = std(in,0,"all");
fprintf(1,"Mean of the Orignal Image: %f", M);
fprintf(1," || Standard Deviation of the Orignal Image: %f\n", S);

%Compute the histogram of input Image
h = compute_histogram(inputImage);

%Display a histogram graph of the input image
figure("Name",'Orignal Image Histogram');
plot_histogram(h)

%Call the histogram Transformation creating values of intensity for each
%value of the original image ranging 0-255 each a=having a special
%transform value
%figure("Name",'Image Transform');
T = histogram_transform(h);
%plot_histogram(T)

%Getting dimension of the image
[x, y] = size(inputImage);

%Creating an blank output_image 
out_image = double(uint8(zeros(x,y)));

%Replacing each certain value of intensity pixel value and transform it
%with T. Making output_image(m,n) = T(index). 
%index = inputImage pixel intensity value at (m,n)
for m=1:x
    for n=1:y
        value = double(inputImage(m,n));
        input = T(value +1);
        out_image(m,n) = input;
    end
end

%Creating the output image needing uint8 to fix the image output. 
%Without uint8 the image pixel value seems to be 0-1.
out_image = uint8(out_image);

%Displaying the histogram graph of the Equalize image
figure("Name",'Equalize Image Histogram');
h = compute_histogram(out_image);
plot_histogram(h)

%Calculating the mean and standard deviation of Equalize image
out = double(out_image);
M = mean(out,"all");
S = std(out,0,"all");
fprintf(1,"Mean of the Equalize Image: %f", M);
fprintf(1," || Standard Deviation of the Equalize Image: %f\n", S);


end

