%Testing.m this is a code that will called the method Equalize. By reading
%in the assign image of light and dark. Then calling the function of
%equalize and putting the read image into the function. Then saving these
%image and outputing the results

%clearing the terminal
clear all

%Reading the two image of dark and light
in = imread("Lab_03_image1_dark.tif");
in2 = imread("Lab_03_image2_light.tif");

%Creating string to output and display for an order terminal for mean and
%Standard Deviation
s1 = "Dark Image 1 for lab 03";
s2 = "Light Image 2 for lab 03";

%Show that the dark image is being put into the equalize
fprintf(1,"Mean and Standard Deviation: %s\n", s1);
out1 = equalize(in);

%Give out the results of dark equalize image and save it
figure("Name","Dark Equalize Image")
imshow(out1);
imwrite(out1,"Equalize_Dark.tif");

%Show that the light image is being put into the equalize
fprintf(1,"Mean and Standard Deviation: %s\n", s2);
out2 = equalize(in2);

%Give out the results of light equalize image and save it
figure("Name","Light Equalize Image")
imshow(out2);
imwrite(out2,"Equalize_light.tif");