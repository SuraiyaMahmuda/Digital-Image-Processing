% Read the input image
img = imread('C:\Users\CSELAB-2\Desktop\LAB07\Dia.jpg'); % Replace with your image file

% Convert to grayscale if it's a color image
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Convert to double for processing
img = double(img) / 255; % Normalize the image

% Parameters for the homomorphic transform
gammaL = 0.3; % Low frequency gain
gammaH = 2.0; % High frequency gain
cutoff = 30; % Cutoff frequency for the filter

% Compute the FFT of the image
fft_image = fft2(img);
fft_shifted = fftshift(fft_image);

% Create a Gaussian filter
[M, N] = size(img);
[x, y] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
D = sqrt(x.^2 + y.^2);
H = 1 - exp(-(D.^2) / (2 * (cutoff^2))); % Homomorphic filter

% Apply the filter to the shifted FFT
filtered_fft = H .* fft_shifted;

% Inverse FFT to get back to the spatial domain
inverse_fft = ifft2(ifftshift(filtered_fft));
enhanced_img = abs(inverse_fft);

% Apply gamma correction
enhanced_img = (gammaH * enhanced_img) ./ (gammaL * (1 - enhanced_img));

% Normalize the enhanced image
enhanced_img = mat2gray(enhanced_img);

% Display the original and enhanced images
figure;
subplot(1, 2, 1);
imshow(img, []);
title('Original Image');

subplot(1, 2, 2);
imshow(enhanced_img, []);
title('Enhanced Image (Homomorphic Transform)');
