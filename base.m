clc
clear all
close all

I=imread('eight.tif');
figure(1)
subplot(1,2,1)
imshow(I)

% N=imnoise(I,'gaussian');
% subplot(1,2,2);
% imshow(N);
% title('Gaussian noise');

N=imnoise(I,'salt & pepper');
subplot(1,2,2);
imshow(N);
title('Salt & Pepper noise');

OM = meanFilter2(N);
OW = weightedMeanFilter2(N);
OMd = medianFilter2(N);
OL = LPfilt2(N);

figure(2)
subplot(1,2,1)
imshow(OM)
title('Mean filter')
subplot(1,2,2)
imshow(OW)
title('Weighted mean filter')

figure(3)
subplot(1,2,1)
imshow(OMd)
title('Median filter')
subplot(1,2,2)
imshow(OL)
title('Low pass filter')
