%Clear out everything and tidy up 
clear all;

%Read in the image functions
A = imread('Lab_02_image1.tif');

%Using my created function to downscale then upscale the images using
%Nearest Neighbor interpolization
MyDownNN = myimresize(A, [40,75], 'nearest');
MyDownNN1 = myimresize(MyDownNN, [300, 300], 'nearest');

%Using my created function to downscale then upscale the images using
%bilinear interpolization
MyDownB = myimresize(A, [40,75], 'bilinear');
MyDownB1 = myimresize(MyDownB, [300, 300], 'bilinear');

%Using the already prebuilt function in matlab of resizing
%Function called:(imresize) 
%Down size then up size the image using nearest neighbor interpolation.
%We are going use this to compare to our method
DownNN = imresize(A, [40,75], 'nearest','Antialiasing',false);
DownNN1 = imresize(DownNN, [300,300], 'nearest','Antialiasing',false);

%Using the already prebuilt function in matlab of resizing
%Function called:(imresize) 
%Down size then up size the image using bilinear interpolization.
%We are going use this to compare to our method
DownB = imresize(A, [40,75], 'bilinear','Antialiasing',false);
DownB1 = imresize(DownB, [300, 300], 'bilinear','Antialiasing',false);

%Creating the images of downsizes from myimresizes
imwrite(MyDownNN, 'downsampled_NearestNeighbor.tif');
imwrite(MyDownB, "downsampled_Bilieaner.tif");

%Calling myRMSE to calculate the diff between A and the downsizes to
%upsizes images.
DiffMyDownNN = myRMSE(A,MyDownNN1);
DiffMyDownB = myRMSE(A,MyDownB1);
DiffDownNN = myRMSE(A,DownNN1);
DiffDownB = myRMSE(A,DownB1);


%Using my created function to downscale then upscale the images using
%Nearest Neighbor interpolization
MyUpscaleNN = myimresize(A, [425,600], 'nearest');
MyUpscaleNN1 = myimresize(MyUpscaleNN, [300, 300], 'nearest');

%Using my created function to upscale then downscale the images using
%bilinear interpolization
MyUpscaleB = myimresize(A, [425,600], 'bilinear');
MyupscaleB1 = myimresize(MyUpscaleB, [300, 300], 'bilinear');

%Using the already prebuilt function in matlab of resizing
%Function called:(imresize) 
%Up size then down size the image using nearest neighbor interpolation.
%We are going use this to compare to our method
UpscaleNN = imresize(A, [425,600], 'nearest','Antialiasing',false);
UpscaleNN1 = imresize(UpscaleNN, [300,300], 'nearest','Antialiasing',false);

%Using the already prebuilt function in matlab of resizing
%Function called:(imresize) 
%Up size then down size the image using bilinear interpolization.
%We are going use this to compare to our method
UpscaleB = imresize(A, [425,600], 'bilinear','Antialiasing',false);
UpscaleB1 = imresize(UpscaleB, [300, 300], 'bilinear','Antialiasing',false);

%Creating the images of the upscale images created by my myimresize
imwrite(MyUpscaleNN, 'upsampled_NearestNeighbor.tif');
imwrite(MyUpscaleB, "upsampled_Bilieaner.tif");

%Calling myRMSE to see the diff between the images that were upscale then
%return to their orgrinal sizes
DifMyUpNN = myRMSE(A,MyUpscaleNN1);
DifMyUpB = myRMSE(A,MyupscaleB1);
DifUpNN = myRMSE(A,UpscaleNN1);
DifUpB = myRMSE(A,UpscaleB1);

%Printing out the results 
fprintf("====================Downsample/upsample================== \n");
fprintf(1,"Downsample/upsample with myimrezise using nearest neighbor = %f\n", DiffMyDownNN);
fprintf(1,"Downsample/upsample with myimrezise using bilinear interpolation = %f\n", DiffMyDownB);
fprintf(1,"Downsample/upsample with imrezise using nearest neighbor = %f\n", DiffDownNN);
fprintf(1,"Downsample/upsample with imrezise using bilinear interpolation = %f\n", DiffDownB);
fprintf("====================Upsample/Downsample================== \n");
fprintf(1,"Upsample/downsample with myimrezise using nearest neighbor = %f\n", DifMyUpNN);
fprintf(1,"Upsample/downsample with myimrezise using bilinear interpolation = %f\n", DifMyUpB);
fprintf(1,"Upsample/downsample with imrezise using nearest neighbor = %f\n", DifUpNN);
fprintf(1,"Upsample/downsample with imrezise using bilinear interpolation = %f\n", DifUpB);


