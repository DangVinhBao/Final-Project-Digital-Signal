function [output] = LPfilt2( input, Fc )
    %input image
    %Fc: cutoff frequency radius
    %output: denoised image
    %using low pass filter to denoise the image
    if ~ismatrix(input)
        error('Input must be an image!')
    end
    if nargin < 2
      Fc = 15;
    end

    
    %get the size of input
    [r,c] = size(input);
    %convert input to frequency domain
    inputF = fftshift(fft2(input));
    
    %create the low pass filter in frequency domain c
    [x,y] = meshgrid( (-c/2):(c/2-1), -(r/2):(r/2-1) );
    z = sqrt(x.^2 + y.^2); %make an invert cone
    c = double(z<Fc);
    
    %make the multiplication
    outputF = inputF.*c;
    
    %invert fourier transform
    output = ifft2(outputF);
    fm = max(output(:));
    output = abs(output)/fm;
    
end