function [output] = medianFilter2( input )
    %input image
    %output: denoised image
    %using median filter to denoise the image
    if ~ismatrix(input)
        error('Input must be an image!')
    end
    %get the size of input
    [r,c] = size(input);
    
    %ex prefix show that this is the version with extra border
    exOutput = exImg(input);
    
    for row = 2:(r+1)
        for col = 2:(c+1)
            %find the median of 3x3 square has (row,col) as its center 
            exOutput(row, col) = median(   [exOutput(row-1 , col-1:col+1), exOutput(row, col-1:col+1), exOutput(row+1, col-1:col+1)] );
        end
    end
    
    %remove the border
    output = exOutput(2:r+1, 2:c+1);
    output = uint8(output);
    
end