%This code called the functions find edges. Reading in the images and
%inputing into the functions and show the image results and save it the 
%output as a tif. Also using the build in edge program using Canny. We can 
% compare the images of our program vs matlabs  

clear all

in = imread("watertower.tif");
edges = find_edges(in, 50);
figure("Name","Edges")
imshow(edges);
imwrite(edges,"watertower_Edges50.tif")

BW1 = edge(in, 'canny');
figure("Name","CannyEdge")
imshow(BW1)
imwrite(BW1, "watertower_CannyEdge.tif")
