function B = myimresize( A, insize, method)
% myimresize Resizing an greyscale images using nearest neightbor or
% billinear methods. Reading in put of (Image, [size requested], type of
% method ]
% 
% Syntax: 
%   out = myImresize(in, size, method) 
% 
% Input: 
%   in = the input image that will be resized
%   insize = the size  the output images in format [m,n]
%   method = 'Nearest' or 'bilinear'
% 
% Output: 
%   out = the resize image size by insize: [m,n]
% 
%History:
%   Kenneth T Tran 03/02/2022 created

%Getting the values of the input requested
Moutput = insize(1);
Noutput = insize(2);

%Determine size of input image
[Minput, Ninput] = size(A);

%Create output image by using user requested insize by [m,n]
B = uint8(zeros(Moutput,Noutput));

%For each pixel there is a corresponding location using inpolation to
%determine the value at those locations.
for m=1:Moutput
    for n=1:Noutput
        m_interpolate = (((m-0.5)/Moutput)*Minput)+0.5;
        n_interpolate = (((n-0.5)/Noutput)*Ninput)+0.5;
        
  %Nearst Neighbor interpolation
        if strcmp(method, 'nearest')
            %Round the M and N interpolate to find the nearest neighbor
            m1 = round(m_interpolate);
            n1 = round(n_interpolate);
            %Assign the values of these nearst neighbor to an output image
            %B
            B(m,n) = A(m1,n1);

 %Bilnear interpolation
        %Find the four neareast Neightbor
        %Only need to decide top-left pixel. The locations of other
        %follows.
        elseif strcmp(method, 'bilinear')
               %When inpolated coodinate is >=1 and <=Minput
               if m_interpolate >=1 && m_interpolate <= Minput
                   %If the interpolated coordinate is not an interger value
                   if m_interpolate ~= floor(m_interpolate)
                            x(1) = floor(m_interpolate);
                   else
                   %When interpolated coordinate is interger value, take
                   %that pixel and one larger expect when at the edge
                   %of image
                        if m_interpolate ~= Minput
                                x(1) = m_interpolate;
                        else
                            x(1) = m_interpolate -1;
                        end
                    end
               %if interpolated coordinate is less than 1 then use first
               %two locations
               elseif m_interpolate < 1
                   x(1) =1;
               %If interpolated coordinate is greather than Minput then use
               %last two location
               elseif m_interpolate > Minput
                   x(1) = Minput -1;
               end

               x(2) = x(1);
               x(3) = x(1) + 1;
               x(4) = x(3);
               
               %Repeat for other dimension which is n_interpolate
               %IF the interpolated coordinate is >=1 and <=Ninput
               if n_interpolate >= 1 && n_interpolate <= Ninput
                   %When the interpolated coordianate is not interger value
                   %Floor n_intperpolate and = to interpolate coordinates
                   if n_interpolate ~= floor(n_interpolate)
                        y(1) = floor(n_interpolate);
                   else
                   %When interpolated coordinate in interger value, take 
                   %that pixel and one larger expect when at edge of image
                       if n_interpolate ~= Ninput
                           y(1) = n_interpolate;
                       else
                           y(1) = n_interpolate-1;
                       end
                   end
               %if interpolated coordinate is less than 1 then use first
               %two locations
               elseif n_interpolate < 1
                    y(1) = 1;
               %If interpolated coordinate is greather than Ninput then use
               %last two locations
               elseif n_interpolate >Ninput
                   y(1) = Ninput -1;
               end

               y(2) = y(1)+1;
               y(3) = y(1);
               y(4) = y(2);

               %Get pixel values of these locations in input image.
               p(1) = double(A(x(1), y(1)));
               p(2) = double(A(x(2), y(2)));
               p(3) = double(A(x(3), y(3)));
               p(4) = double(A(x(4), y(4)));

               %Load location of interpolated location.
               x(5) = m_interpolate;
               y(5) = n_interpolate;

               %Call bilinear interpolation function.
               p(5) = mybilinear2(x,y,p);
               
               B(m,n) = round(p(5));

        else
            fprintf(1, 'Sorry method wasnt reconginzes. The method we are looking for is bilinear or nearest: %s\n', method);
            error('exiting');
        end %end of if strcmp methods
    end %end of N for loop
end%end of M for loop
end%end of functions