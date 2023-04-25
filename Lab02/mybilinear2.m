function v = mybilinear2(x,y,p)
% Given values at 4 pixel, using bilinear interpolation to compute the pixel
% of the 5th. Using the x,y location of my pixel 5th 
% P contains all the values calculate of the 4 pixels
%
%   It does this by:
%       1) Linearly interploated between 1 and 3
%       2) Linearly interploated between 2 and 4
%       3) Linearly interpolating between the two location above
%
% Syntax:
%   v= mybilinear2(x,y,p)
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

%Interpolate between 1 and 3
t1 = (p(3)-p(1))*(x(5)-x(1))/(x(3)-x(1)) + p(1);

%Interpolate between 2 and 4
t2 = (p(4)-p(2))*(x(5)-x(2))/(x(4)-x(2)) + p(2);

%Interpolate two location t1 and t2
v = (t2-t1)*(y(5)-y(1))/(y(2)-y(1))+t1;

end%end of function

