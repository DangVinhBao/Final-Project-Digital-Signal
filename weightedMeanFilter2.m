function [output] = weightedMeanFilter2( input )
    %input image
    %output: denoised image
    %using weighted mean filter to denoise the image
    if ~ismatrix(input)
        error('Input must be an image!')
    end
    %get the size of input
    [r,c] = size(input);
    %ex prefix show that this is the version with extra border
    exOutput = exImg(input);
    
    H = [   1   2   1;
            2   4   2
            1   2   1]/16; %weighted mean filter
    
    exOutput = filter2(H, exOutput);
    %remove the border
    output = exOutput(2:r+1, 2:c+1);
    output = uint8(output);
    
end