function output = myhalftone(in)
[rows, columns] = size(in);
output = uint8(ones(rows, columns));
%Creating the dots in a 3d Matrix for dots
dots = uint8(zeros(3,3,10));
size(dots)
%fill in the dots
dots(:,:,1) =[0 0 0; 0 0 0; 0 0 0]; % number 0
dots(:,:,2) =[0 255 0; 0 0 0; 0 0 0]; % number 1
dots(:,:,3) =[0 255 0; 0 0 0; 0 0 255]; % number 2
dots(:,:,4) =[255 255 0; 0 0 0; 0 0 255]; % number 3
dots(:,:,5) =[255 255 0; 0 0 0; 255 0 255]; % number 4
dots(:,:,6) =[255 255 255; 0 0 0; 255 0 255]; % number 5
dots(:,:,7) =[255 255 255; 0 0 255; 255 0 255]; % number 6
dots(:,:,8) =[255 255 255; 0 0 255; 255 255 255]; % number 7
dots(:,:,9) =[255 255 255; 255 0 255; 255 255 255]; % number 8
dots(:,:,10) =[255 255 255; 255 255 255; 255 255 255]; % number 9

%Converting the image into a float double. This will be used to calculate
%the desinty per pixel in the images
float = double(in);

%THe maximum and min values of the halftone
min_in =0;
max_in = 255;

%check to see if the .tif dimenstion is divisable by 3. Input image are
%multiple of 3 this will help check through the dimension
rows_edge = mod(rows,3);
columns_edge = mod(columns,3);

%jumps to the 3rd row
for rows1 = 1:3:rows - rows_edge
    %jumps to 3rd column
    for columns1 = 1:3:columns - columns_edge
        %calculates the average over a 3x3
        avgerage = mean(mean(float(rows1:rows1+2, columns1:columns1+2)));
        %figure out the density to apply to the 0-9 dot pattern
        %Using the formula of to find the range of 1-10(average / 255 * 10)
        %Floor gets rid of the decimal |DOESNT NOT ROUND|
        density = floor((avgerage / max_in)*10);
        %check to see if pattern is above 10
        if density == 10
            density= 9;
        end
        %output to the empty output matrix to create halftone image
        output(rows1:rows1+2, columns1: columns1+2) = dots(:,:,density+1);
    end
end

%Creating the new halftone images
imwrite(output,"Wedge(halftone).tif");
imshow(output)

%6. Take care of special cases - when the block is not multiple of 3
%   -ex: 2x3 or 1x3
%   - if the dimensions of the input img are not multiples of three then
%   treat the edges as special cases:
%       -compute avg over whatever size block is at edge of img (ex:2x3)
%       -use this value to copy part of the appropriate dot pattern to the
%       -output image(ex:2x3 block)
%creating a function that handles no divide able image by 3.
%Ideas to tackle this problem: ===1=== mulitply by 3 and then the image is
%divide by 3 or this could be wrong. ===2=== Find a way to mod the image x
%and y coords to find which one has remainder.
%jumps to the 3rd row
%       -compute avg over whatever size block is at edge of img (ex:2x3)
%       -use this value to copy part of the appropriate dot pattern to the
%       -output image(ex:2x3 block)
for rows1 = 1:3:rows - rows_edge
    %jumps to 3rd column
    for columns1 = 1:3:columns - columns_edge
        %calculates the average over a 3x3
        avgerage = mean(mean(float(rows1:rows1+2, columns1:columns1+2)));
        %figure out the density to apply to the 0-9 dot patterns
        %Using the formula of to find the range of 1-10(average / 255 * 10)
        %Floor gets rid of the decimal |DOESNT NOT ROUND|
        density = floor((avgerage / max_in)*10);
        %check to see if pattern is above 10
        if density == 10
            density= 9;
        end
        %output to the empty output matrix to create halftone image
        output(rows1:rows1+2, columns1: columns1+2) = dots(:,:,density+1);
    end
    %If the columns edge is not diviable by 3
    if columns_edge > 0
        %using the same method as above but having the column -1
        avgerage = mean(mean(float(rows1:rows1+2, columns1:columns1+1)));
        density = floor((avgerage/max_in)*10);
        if density == 10
            density= 9;
        end
        %Output consricted by the column edge
        output(rows1:rows1+2, columns-columns_edge+1:columns) = dots(:,1:columns_edge,density+1);
    end
end


%If any of the row or column are not divisible by 3
if rows_edge > 0
    for columns1 = 1:3:columns - columns_edge
        %using the same method as above but having the row -1
        avgerage = mean(mean(float(rows1:rows1+(rows_edge-1), columns1:columns1+2)));
        density = floor((avgerage/max_in)*10);
        if density == 10
            density= 9;
        end
        %Output consricted by the column edge
        output(rows-rows_edge+1:rows, columns1: columns1+2) = dots(1:rows_edge,:,density+1);
        %Special case for if the columns is not divisible by 3
        if columns_edge > 0
            avgerage = mean(mean(float(rows1:rows1+(rows_edge-1), columns1:columns1+(columns_edge-1))));
            density = floor((avgerage/max_in)*10);
            if density == 10
                density= 9;
            end
            %Output consricted by the column edge
            output(rows-rows_edge+1:rows, columns-columns_edge+1:columns) = dots(1:rows_edge,1:columns_edge,density+1);
        end
    end
end
imshow(output);
imwrite(output,"Wedge2(halftone).tif");
%History:
%   Kenneth T Tran 2/09/2022 created
%   Kenneth T Tran 2/09/2022 Currently creating code. LOTS OF ERROR
%   Kenneth T Tran 2/15/2022 Got more help on the code and hopefully fix.
%   Kenneth T Tran 2/16/2022 Working on in lab and able to get the half
%   tone working. Need fix special cases
%   Kenneth T Tran Fixing the alorightm for special case and revamping the
%   output for special case