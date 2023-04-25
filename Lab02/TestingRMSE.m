clear All;
A = imread('Lab_02_image1.tif');

%Using the already prebuilt function in matlab of resizing
%Function called:(imresize) 
%Down size then up size the image using nearest neighbor interpolation.
%We are going use this to compare to our method
D = imresize(A, [40,75], 'nearest','Antialiasing',false);
D1 = imresize(D, [300,300], 'nearest','Antialiasing',false);

%Using the already prebuilt function in matlab of resizing
%Function called:(imresize) 
%Down size then up size the image using bilinear polization.
%We are going use this to compare to our method
E = imresize(A, [40,75], 'bilinear','Antialiasing',false);
E1 = imresize(E, [300, 300], 'bilinear','Antialiasing',false);

 myRMSE(A,D1);
 myRMSE(A,E1);

 
 function e = myRMSE(A,B)

    e = sqrt(mean(mean((double(A)-double(B)).^2)));

 end%end of function