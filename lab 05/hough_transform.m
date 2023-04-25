function [theta_out, rho_out, accumlator] = hough_transform(i_edge)
%hough_transform
%
% Syntax: 
%   [theta_out, rho_out, accumlator] = spatial_filter(i_edge) 
% 
% Input: 
%   i_edge = an edge image with a values of 0 or 255. The image should be
%   outline edges. 
% 
% Output: 
%   theta_out = the angle of the detected line. Horizontal is 0
%   
%   rho_out = The length of the perpendicular bisector in pixels. Can range
%   between -D and D. Where D is the diagonal size of the image
%   
%   accumlator = the acculator matrix, It has 180 columns, one for each
%   degree from -89 to 90 the number of rows is equal to twice size of the
%   diagonal of the image plus one. 2*D+1 rows and 180 columns
% 
% History: 
%   Kenneth T Tran created 4/13/2022 

% steps
% 1.Quantize the parameter space(m,c)
% 2. Create accumlator array A(m,c)
% 3. Set A(m,c) = 0; for all (m,c)
% 4. For each edge point (xi,yi), A(m,c)=A(m,c)+1
% 5. find local maxima in A(m,c);

%Deterime size of the edge image
[size_x, size_y] = size(i_edge);

%Create accumlator matrix
%One horizontal div per degree, vertical divranges{-d,d}
diagonal_size = ceil(sqrt((size_x^2)+(size_y^2)));
accumlator = zeros(2*diagonal_size+1,180);

%Visit each edge point in i_edge, plot coresponding curve in accumator
for i =1:size_x
    for j=1: size_y
        for t = -89:90
            if(i_edge(i,j) == 255)
            %Compute 'rho' using normal eq
            rho_out = (i*cosd(t))+(j*sind(t));
            rho_out = ceil(rho_out + diagonal_size+1);
            %Accumulate another "vote"
            %fprintf(1,'Here is rho_out %f \n',rho_out);
            %fprintf(1,'Here is theta_out %f \n',t+90);
            value = accumlator(rho_out,t+90);
            accumlator(rho_out, t+90)= value+1;
            end
        end
    end
end

%Accumulator Cell with most votes is most prominent line
%Convert to indices
%Adjust rows and Columns
currentMax = 0;
for a=1 : 2*diagonal_size+1
    for b=1 : 180
        max = double(accumlator(a,b));
        if(currentMax <= max)
            currentMax = accumlator(a,b);
            rho_out = a-(diagonal_size+1);
            theta_out = b-90;
        end
    end
end


end