%Creating the wedge test image
clear all % getting rid of prior non-sense

%create a blank canvas to render/ create a matrix
%test_img = uint8(zeros(256,256));
%create an image that is all black

%Now lets fill in the value for the matrix that will give that fading
%effect. Starting first row of 0s, till last row of all 255s
%for c = 1:256
%    test_img(c,:) = c-1 %c-1 because of the intensity varies from 0-255
%end % That the end of it
%imwrite(test_img,"Wedge.tif");
%imshow(test_img)

in = imread("Fig0225(a)(face).tif");
output = halftone(in);
%imwrite(output,"Wedge(halftone).tif");
imwrite(output, 'Face(halftone).tif')

imshow(output)
%imwrite(output,"Face3(halftone.tif")

