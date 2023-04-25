function dif = myRMSE(A, B)
% myRMSE using the forumla we calculate the difference between to images.
% That are the same sizes image. The purpose is to see what happen when you
% resize and image and turn in back to its original sizes. Printing out a
% double value showing the difference between the images pixel values
% 
% Syntax: 
%   dif = myRMSE(A, B) 
% 
% Input: 
%   A = the orignal image
%   B = the resize image and turn back to normal
% 
% Output: 
%   dif = the double variable of how different the image pixel values from
%   on to another due to resizing
% 
%History:
%   Kenneth T Tran 03/02/2022 created
dif = sqrt(mean(mean((double(A)-double(B)).^2)));

end%end of function

