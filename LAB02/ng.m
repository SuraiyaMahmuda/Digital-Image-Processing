% Read the image
originalImage = imread('C:\Users\CSELAB-2\Desktop\GIPLab02\negativeimage1.jpg');

% Check if the image is grayscale or RGB
if size(originalImage, 3) == 1
    % Grayscale image
    maxValue = 255; % Maximum value for 8-bit images
    negativeImage = maxValue - originalImage;
else
    % RGB image
    maxValue = 255; % Maximum value for 8-bit images
    % Apply the negative transformation to each channel
    negativeImage = maxValue - originalImage;
end

% Display the original and negative images
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(1, 2, 2);
imshow(negativeImage);
title('Negative Image');