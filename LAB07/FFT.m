% Read the input image
img = imread('C:\Users\CSELAB-2\Desktop\LAB07\Dia.jpg'); % Replace with your image file

% Convert to grayscale if it's a color image
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Convert to double for FFT processing
img = double(img);

% Compute the FFT of the image
fft_image = fft2(img);

% Shift the zero-frequency component to the center
fft_shifted = fftshift(fft_image);

% Compute the magnitude spectrum
magnitude_spectrum = log(1 + abs(fft_shifted));

% Display the original image and its FFT magnitude spectrum
figure;
subplot(1, 2, 1);
imshow(img, []);
title('Original Image');

subplot(1, 2, 2);
imshow(magnitude_spectrum, []);
title('Magnitude Spectrum (FFT)');
