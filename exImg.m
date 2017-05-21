function [output] = exImg( input )

    %input image
    %output: the same image but with an extra border
    if ~ismatrix(input)
        error('Input must be an image!')
    end

    [r,c] = size(input);
    %create output
    output = zeros(r+2 , c+2);
    %put input inside output
    output(2:r+1, 2:c+1) = input;

    %set the borders
    output(1, 2:(c+1)) = input(1,:); %top
    output(r+2, 2:(c+1)) = input(r,:); %bottom
    output(2:(r+1), 1) = input(:, 1); %left
    output(2:(r+1), c+2) = input(:, c); %right
    %set the corners
    output(1,1) = input(1,1); %top left
    output(1,c+2) = input(1,c); %top right
    output(r+2,c+2) = input(r,c); %bottom right
    output(r+2,1) = input(r,1); %bottom left

end