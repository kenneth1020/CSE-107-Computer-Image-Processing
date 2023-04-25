function v = mybilinear(x,y,p)
% Given values at 4 pixel, using bilinear interpolation to compute the pixel
% of the 5th. Using the x,y location of my pixel 5th 
% P = all the values calculate of the 4 pixels
%
% Performing the bilinear interpolation by fitting the following function
% to the 4th pixel values: Using the formula v(x,y) = ax +by +cxy + d
% It does this by setting up the 4 equations using the 4 known pixels values
% This will solves the four constants of a,b,c and d using linear algebra.
% Once a,b,c, and d are found the value of pixel 5th will be computed easily
%
% Syntax:
%   v= mybilinear(x,y,p)
%
% Input:
%   x,y = the locations of the pixel 5th
%   p = containing values of the four pixels
%
% Output:
%   v = the estimated calulated 5th pxel values
%
% History:
%   Kenneth T Tran      03/02/2022 Created

A = [x(1:4); y(1:4); x(1:4).*y(1:4); ones(1,4)]';

%Have Ac = p. c contains the unknown constants. Solve by computing
%c=inv(A)*p.
c = inv(A) * p(1:4)';

%Finally, compute value at 5th pixel
v = c(1)*x(5) + c(2)*y(5) + c(3)*x(5)*y(5) + c(4);
end%end of functions

